//
//  SampleCell.h
//  Sample
//
//  Created by Shruthi on 13/07/15.
//  Copyright © 2015 Shruthi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SampleCell : UITableViewCell
{
}
    @property (nonatomic, weak) IBOutlet UILabel *nameLabel;
    @property (nonatomic, weak) IBOutlet UILabel *timeLabel;
    @property (nonatomic, weak) IBOutlet UILabel *dateLabel;
    @property (nonatomic, weak) IBOutlet UILabel *locationLabel;
    @property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end
