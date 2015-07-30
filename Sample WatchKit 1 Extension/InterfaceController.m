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


@interface InterfaceController()
{
      NSMutableArray *dataObjects;
}

@end


@implementation InterfaceController

@synthesize table;

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

/*- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}*/


- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    [self fetchFromJson];
}

-(void)fetchFromJson {
    
 /*   NSString *filePath = [[NSBundle mainBundle] pathForResource:@"watchevents" ofType:@"json"];
    
    NSString* jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *jsonError;
    id allKeys = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&jsonError];*/
    
    
    
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Entity"];
    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
 //   [self.tableView reloadData];
    
    
      
    dataObjects=[[NSMutableArray alloc]init];
  
   for (NSInteger i=0; i<self.devices.count; i++) {
      //  NSDictionary *arrayResult = [allKeys objectAtIndex:i]; */
  
    
    
        NSManagedObject *device = [self.devices objectAtIndex:i];
        [dataObjects addObject:[device valueForKey:@"eventName"]];
         }
    
    [self configureTableWithData  /*:dataObjects*/];
}


- (void)configureTableWithData// :(NSMutableArray*)dataObjects
{
    [self.table setNumberOfRows:[dataObjects count] withRowType:@"row"];
    for (NSInteger i = 0; i < self.table.numberOfRows; i++) {
        
       BaseTableView* theRow = [self.table rowControllerAtIndex:i];
       [theRow.label setText:[dataObjects objectAtIndex:i]];
        
      }
}

- (void)table:(WKInterfaceTable*)table didSelectRowAtIndex:(NSInteger)rowIndex
{
    [self pushControllerWithName:@"Unsubscribe" context:[dataObjects objectAtIndex:rowIndex]];
}

/*- (void)pushControllerWithName:(NSString *)Unsubscribe context:(id )context {
    
}*/
- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}



@end



