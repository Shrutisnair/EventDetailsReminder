//
//  UnsubscribeInterfaceController.m
//  Sample
//
//  Created by Shruthi on 30/07/15.
//  Copyright © 2015 Shruthi. All rights reserved.
//

#import "UnsubscribeInterfaceController.h"
#import "WatchEvent.h"
#import <CoreData/CoreData.h>

@interface UnsubscribeInterfaceController ()
{
    WatchEvent *selectedEvent;
}

@end

@implementation UnsubscribeInterfaceController

@synthesize selectEvent;
@synthesize date;
@synthesize time;
@synthesize location;

- (NSManagedObjectContext *)managedObjectContext {
    // NSManagedObjectContext *context = nil;
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"events" withExtension:@"momd"];
    NSManagedObjectModel * managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    
    
    NSURL *storeURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"group.qburst.watch"];
    storeURL = [storeURL URLByAppendingPathComponent:@"Sample.sqlite"];
    
    NSPersistentStore *store = nil;
    NSPersistentStoreCoordinator *coordinator=[[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
    NSError *error=nil;
    store = [coordinator addPersistentStoreWithType:NSSQLiteStoreType
                                      configuration:nil
                                                URL:storeURL
                                            options:nil
                                              error:&error];
    
    NSManagedObjectContext * managedObjectContext = [[NSManagedObjectContext alloc] init];
    [managedObjectContext setPersistentStoreCoordinator:coordinator];
    
    return managedObjectContext;
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    selectedEvent = (WatchEvent* )context;
    selectEvent.text = selectedEvent.name;
    date.text=selectedEvent.date;
    time.text=selectedEvent.time;
    location.text=selectedEvent.location;
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

#pragma mark - IBAction methods

- (IBAction)Unsubscribe{
    
    
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];

    
    NSEntityDescription *productEntity=[NSEntityDescription entityForName:@"Entity" inManagedObjectContext:managedObjectContext];
    NSFetchRequest *fetch=[[NSFetchRequest alloc] init];
    [fetch setEntity:productEntity];
    NSPredicate *p=[NSPredicate predicateWithFormat:@"eventId == %@", selectedEvent.eventid];
    [fetch setPredicate:p];
    
    NSError *fetchError;
    NSArray *fetchedProducts=[managedObjectContext executeFetchRequest:fetch error:&fetchError];
    // handle error
    

    [managedObjectContext deleteObject:[fetchedProducts objectAtIndex:0]];
    
    
     [managedObjectContext save:nil];
    [self popController];

}

@end



