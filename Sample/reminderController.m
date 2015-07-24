//
//  reminderController.m
//  Sample
//
//  Created by Shruthi on 23/07/15.
//  Copyright © 2015 Shruthi. All rights reserved.
//

#import "reminderController.h"

@interface reminderController ()

@end

@implementation reminderController

@synthesize timerLabel;
@synthesize stepperLabel;
@synthesize hourLabel;
@synthesize stepperhourLabel;
@synthesize textLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
  }
-(void)viewDidAppear:(BOOL)animated {
 
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:now];
    NSInteger hour = [comp hour];
    NSInteger minute = [comp minute];
    [hourLabel setText:[NSString stringWithFormat:@"%ld", hour]];
    stepperLabel.value=minute;
    stepperhourLabel.value=hour;
    [timerLabel setText:[NSString stringWithFormat:@"%ld", minute]];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  }

#pragma mark - IBAction methods

- (IBAction)valueChanged:(UIStepper *)sender {
    
   
    double value = [sender value];
    
    [timerLabel setText:[NSString stringWithFormat:@"%d", (int)value]];
}

- (IBAction)hourChanged:(UIStepper *)sender {
    
    
    double value = [sender value];
    
    [hourLabel setText:[NSString stringWithFormat:@"%d", (int)value]];
}


- (IBAction)OK {
UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Reminder set"
                                                message:textLabel.text                                             delegate:self
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
[alert show];

    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear |NSCalendarUnitMonth|NSCalendarUnitDay)fromDate:now];
    
    [components setHour:stepperhourLabel.value];
    [components setMinute:stepperLabel.value];
    [components setSecond:0];
    
    NSDate *alarmdate = [calendar dateFromComponents:components];
   
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = alarmdate;
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.category = @"myCategory";
    localNotification.alertBody = textLabel.text;
    localNotification.alertTitle = @"Reminder";
    localNotification.userInfo = @{ @"title" : @"Reminder", @"body" : textLabel.text };
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}



@end
