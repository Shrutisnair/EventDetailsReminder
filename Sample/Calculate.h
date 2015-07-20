//
//  Calculate.h
//  Sample
//
//  Created by Shruthi on 20/07/15.
//  Copyright © 2015 Shruthi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Calculate : UIViewController

 @property (strong, nonatomic) IBOutlet UILabel *result;


- (IBAction)addNums:(id)sender;
- (IBAction)diffNums:(id)sender;
- (IBAction)prodNums:(id)sender;
- (IBAction)divNums:(id)sender;
@end
