//
//  UnsubscribeInterfaceController.m
//  Sample
//
//  Created by Shruthi on 30/07/15.
//  Copyright © 2015 Shruthi. All rights reserved.
//

#import "UnsubscribeInterfaceController.h"

@interface UnsubscribeInterfaceController ()

@end

@implementation UnsubscribeInterfaceController

@synthesize selectEvent;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    NSString* selectedEvent = (NSString* )context;
    selectEvent.text = selectedEvent; 
    
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

@end



