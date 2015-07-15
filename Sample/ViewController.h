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
   
    NSMutableArray *tableData;
    NSMutableArray *tableTime;
    NSMutableArray *tableDate;
    NSMutableArray *tableLocation;
    NSMutableArray *tableRating;
    NSMutableArray *tableAddress;
    NSMutableArray *tableDesc;
   // NSArray *thumbnails;
   // NSArray *prepTime;
   
}
//-(IBAction)display;
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end

