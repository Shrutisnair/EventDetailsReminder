//
//  reminderController.h
//  Sample
//
//  Created by Shruthi on 23/07/15.
//  Copyright © 2015 Shruthi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface reminderController : UIViewController <UIAlertViewDelegate >


@property (nonatomic, weak) IBOutlet UILabel *timerLabel;
@property (nonatomic, weak) IBOutlet UIStepper *stepperLabel;
@property (nonatomic, weak) IBOutlet UILabel *hourLabel;
@property (nonatomic, weak) IBOutlet UIStepper *stepperhourLabel;
@property (nonatomic, weak) IBOutlet UITextField *textLabel;

@end

