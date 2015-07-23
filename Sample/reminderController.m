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
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

/*-(IBAction)indexChanged:(UISegmentedControl *)sender {
    
    switch (sender.selectedSegmentIndex)
    {
        case 0:
            d=0;
            break;
        case 1:
            d=12;
            break;
        default: 
            break; 
    }

}*/

- (IBAction)OK {
UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Reminder set"
                                                message:textLabel.text                                             delegate:self
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
[alert show];

    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear |NSCalendarUnitMonth|NSCalendarUnitDay)fromDate:now];
  //  NSInteger hour = [components hour];
   // NSInteger minute = [components minute];
    [components setHour:stepperhourLabel.value];
    NSLog(@"hour:%f",stepperhourLabel.value);
    [components setMinute:stepperLabel.value];
     [components setSecond:0];
    NSDate *alarmdate = [calendar dateFromComponents:components];
    NSLog(@"Date:%@" ,alarmdate);
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = alarmdate;
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.category = @"myCategory";
    localNotification.alertBody = textLabel.text;
    localNotification.alertTitle = @"Reminder Set";
    localNotification.userInfo = @{ @"title" : @"Reminder", @"body" : textLabel.text };
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
