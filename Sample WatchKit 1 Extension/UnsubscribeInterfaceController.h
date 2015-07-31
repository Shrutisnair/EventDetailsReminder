//
//  UnsubscribeInterfaceController.h
//  Sample
//
//  Created by Shruthi on 30/07/15.
//  Copyright © 2015 Shruthi. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface UnsubscribeInterfaceController : WKInterfaceController

@property (weak, nonatomic) IBOutlet WKInterfaceLabel* selectEvent;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel* date;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel* time;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel* location;

@end
