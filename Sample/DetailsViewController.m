//
//  DetailsViewController.m
//  Sample
//
//  Created by Shruthi on 14/07/15.
//  Copyright © 2015 Shruthi. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

@synthesize eventName;
@synthesize eventDate;
@synthesize eventTime;
@synthesize eventRating;
@synthesize eventLocation;
@synthesize eventAddress;
@synthesize eventDesc;

@synthesize enameLabel=_enameLabel;
@synthesize edateLabel=_edateLabel;
@synthesize etimeLabel=_etimeLabel;
@synthesize eaddressLabel=_eaddressLabel;
@synthesize edescLabel=_edescLabel;
@synthesize eratingLabel=_eratingLabel;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.enameLabel.text=eventName;
    self.edateLabel.text=eventDate;
    self.etimeLabel.text=eventTime;
    self.eaddressLabel.text=eventAddress;
    self.edescLabel.text=eventDesc;
    self.eratingLabel.text=eventRating;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
