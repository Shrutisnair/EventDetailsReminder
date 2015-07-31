//
//  InterfaceController.m
//  Sample WatchKit 1 Extension
//
//  Created by Shruthi on 21/07/15.
//  Copyright © 2015 Shruthi. All rights reserved.
//

#import "InterfaceController.h"
#import "BaseTableView.h"
#import <CoreData/CoreData.h>
#import "WatchEvent.h"


@interface InterfaceController()
{
      NSMutableArray *dataObjects;
      WatchEvent *details;
}

@end


@implementation InterfaceController

@synthesize table;
@synthesize count;

- (NSManagedObjectContext *)managedObjectContext {
    
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

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    [self fetchFromJson];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

-(void)fetchFromJson {
    
    
    
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Entity"];
    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    count.text=[NSString stringWithFormat:@"My Events (%lu)",(unsigned long)[self.devices count]];
    
      
    [self configureTableWithData];
}


- (void)configureTableWithData{
    
    dataObjects=[[NSMutableArray alloc]init];
    [self.table setNumberOfRows:self.devices.count withRowType:@"row"];
    for (NSInteger i = 0; i < self.table.numberOfRows; i++) {
        
        NSManagedObject *device = [self.devices objectAtIndex:i];
        
       details = [[WatchEvent alloc]init];
        
        details.name=[device valueForKey:@"eventName"];
        details.time=[device valueForKey:@"eventTime"];
        details.date=[device valueForKey:@"eventDate"];
        details.location=[device valueForKey:@"eventLocation"];
        details.address=[device valueForKey:@"eventAddress"];
        details.desc=[device valueForKey:@"eventDesc"];
        details.eventid=[device valueForKey:@"eventId"];
        details.rating=[device valueForKey:@"eventRating"];
        
        [dataObjects addObject:details];
        
       BaseTableView* theRow = [self.table rowControllerAtIndex:i];
       [theRow.nameLabel setText:[device valueForKey:@"eventName"]];
        [theRow.dateLabel setText:[device valueForKey:@"eventDate"]];      }
}

- (void)table:(WKInterfaceTable*)table didSelectRowAtIndex:(NSInteger)rowIndex
{
    
    WatchEvent *temp=[[WatchEvent alloc] init];
    temp=[dataObjects objectAtIndex:rowIndex];
    
    [self pushControllerWithName:@"Unsubscribe" context:temp];
}





@end



