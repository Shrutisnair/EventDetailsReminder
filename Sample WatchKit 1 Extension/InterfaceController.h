//
//  InterfaceController.h
//  Sample WatchKit 1 Extension
//
//  Created by Shruthi on 21/07/15.
//  Copyright © 2015 Shruthi. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController

@property (weak, nonatomic) IBOutlet WKInterfaceTable* table;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel* count;

@property (strong) NSMutableArray *devices;


@end
