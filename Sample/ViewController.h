//
//  ViewController.h
//  Sample
//
//  Created by Shruthi on 13/07/15.
//  Copyright © 2015 Shruthi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
   
    NSArray *tableData;
    NSArray *thumbnails;
    NSArray *prepTime;
   
}
//-(IBAction)display;

@end

