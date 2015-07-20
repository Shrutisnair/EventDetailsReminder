//
//  Calculate.m
//  Sample
//
//  Created by Shruthi on 20/07/15.
//  Copyright © 2015 Shruthi. All rights reserved.
//

#import "Calculate.h"

@interface Calculate ()

@end

@implementation Calculate

@synthesize result;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)addNums:(id)sender
{

    UITextField *mTextField, *nTextField;
    
    mTextField = (UITextField*)[self.view viewWithTag:1];
    nTextField = (UITextField*)[self.view viewWithTag:2];
    
    
    int x = ([mTextField.text intValue]);
    
    int y = ([nTextField.text intValue]);
    
   // int ans = x + y;
    [result setText:[NSString stringWithFormat:@"%d", x + y]];
    
}
- (IBAction)diffNums:(id)sender
{
    
    UITextField *mTextField, *nTextField;
    
    mTextField = (UITextField*)[self.view viewWithTag:1];
    nTextField = (UITextField*)[self.view viewWithTag:2];
    
    
    int x = ([mTextField.text intValue]);
    
    int y = ([nTextField.text intValue]);
    
    // int ans = x + y;
    [result setText:[NSString stringWithFormat:@"%d", x - y]];
    
}
- (IBAction)prodNums:(id)sender
{
    
    UITextField *mTextField, *nTextField;
    
    mTextField = (UITextField*)[self.view viewWithTag:1];
    nTextField = (UITextField*)[self.view viewWithTag:2];
    
    
    int x = ([mTextField.text intValue]);
    
    int y = ([nTextField.text intValue]);
    
    // int ans = x + y;
    [result setText:[NSString stringWithFormat:@"%d", x * y]];
    
}
- (IBAction)divNums:(id)sender
{
    
    UITextField *mTextField, *nTextField;
    
    mTextField = (UITextField*)[self.view viewWithTag:1];
    nTextField = (UITextField*)[self.view viewWithTag:2];
    
    
    float x = ([mTextField.text floatValue]);
    
    float y = ([nTextField.text floatValue]);
    
    // int ans = x + y;
    [result setText:[NSString stringWithFormat:@"%f", x / y]];
    
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
