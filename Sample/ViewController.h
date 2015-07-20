//
//  ViewController.h
//  Sample
//
//  Created by Shruthi on 13/07/15.
//  Copyright © 2015 Shruthi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Events.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
   
    NSMutableArray *event;
    Events *details;
}

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

