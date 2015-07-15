//
//  DetailsViewController.h
//  Sample
//
//  Created by Shruthi on 14/07/15.
//  Copyright © 2015 Shruthi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface DetailsViewController : UIViewController <MKMapViewDelegate>
@property NSString *eventName;
@property NSString *eventDate;
@property NSString *eventTime;
@property NSString *eventLocation;
@property NSString *eventDesc;
@property NSString *eventRating;
@property NSString *eventAddress;

@property (nonatomic, weak) IBOutlet UILabel *enameLabel;
@property (nonatomic, weak) IBOutlet UILabel *edateLabel;
@property (nonatomic, weak) IBOutlet UILabel *etimeLabel;
@property (nonatomic, weak) IBOutlet UILabel *eaddressLabel;
@property (nonatomic, weak) IBOutlet UILabel *edescLabel;
@property (nonatomic, weak) IBOutlet UILabel *eratingLabel;

@property (nonatomic, strong) IBOutlet MKMapView *mapView;

@property (nonatomic, strong) NSArray *mapItemList;
@property (nonatomic, assign) MKCoordinateRegion boundingRegion;


@end
