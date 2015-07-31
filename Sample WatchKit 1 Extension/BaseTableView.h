//
//  BaseTableView.h
//  Sample
//
//  Created by Shruthi on 29/07/15.
//  Copyright © 2015 Shruthi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface BaseTableView : NSObject


@property (weak, nonatomic) IBOutlet WKInterfaceLabel* nameLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel* dateLabel;
@end
