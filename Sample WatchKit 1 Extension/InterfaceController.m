//
//  InterfaceController.m
//  Sample WatchKit 1 Extension
//
//  Created by Shruthi on 21/07/15.
//  Copyright © 2015 Shruthi. All rights reserved.
//

#import "InterfaceController.h"
#import "BaseTableView.h"

@interface InterfaceController()

@end


@implementation InterfaceController

@synthesize table;

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
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"watchevents" ofType:@"json"];
    
    NSString* jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    event=[[NSMutableArray alloc]init];
    
    NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *jsonError;
    id allKeys = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&jsonError];
    
    
    NSMutableArray *dataObjects = [[NSMutableArray alloc] init];
    for (int i=0; i<[allKeys count]; i++) {
        NSDictionary *arrayResult = [allKeys objectAtIndex:i];
        
        [dataObjects addObject:[arrayResult valueForKey:@"eventName"]];
          }
    
    [self configureTableWithData:dataObjects];
}


- (void)configureTableWithData:(NSMutableArray*)dataObjects {
  //  NSLog(@"%@",[dataObjects objectAtIndex:i]);
    
        [self.table setNumberOfRows:[dataObjects count] withRowType:@"row"];
    for (NSInteger i = 0; i < self.table.numberOfRows; i++) {
        NSLog(@"%@",[dataObjects objectAtIndex:i]);
       BaseTableView* theRow = [self.table rowControllerAtIndex:i];
        
     //  BaseTableView* dataObj = [dataObjects objectAtIndex:i];
        
       [theRow.label setText:[dataObjects objectAtIndex:i]];
        
      //  [theRow.rowIcon setImage:dataObj.image];
    }
}


- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}


@end



