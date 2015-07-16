//
//  DetailsViewController.h
//  Sample
//
//  Created by Shruthi on 14/07/15.
//  Copyright © 2015 Shruthi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface DetailsViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate, UISearchBarDelegate>
@property NSString *eventName;
@property NSString *eventDate;
@property NSString *eventTime;
@property NSString *eventLocation;
@property NSString *eventDesc;
//@property NSString *eventRating;
@property UIImageView *imageView;
@property NSString *eventAddress;

-(IBAction)dismiss;

@property (nonatomic, weak) IBOutlet UILabel *enameLabel;
@property (nonatomic, weak) IBOutlet UILabel *edateLabel;
@property (nonatomic, weak) IBOutlet UILabel *etimeLabel;
@property (nonatomic, weak) IBOutlet UILabel *eaddressLabel;
@property (nonatomic, weak) IBOutlet UILabel *edescLabel;
//@property (nonatomic, weak) IBOutlet UILabel *eratingLabel;

@property (nonatomic, strong) IBOutlet MKMapView *mapView;

@property (nonatomic, strong) NSArray *mapItemList;
@property (nonatomic, assign) MKCoordinateRegion boundingRegion;
@property (nonatomic) CLLocationCoordinate2D userLocation;
@property (nonatomic, strong) MKLocalSearch *localSearch;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) NSArray *places;
@end
