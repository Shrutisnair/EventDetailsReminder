//
//  DetailsViewController.h
//  Sample
//
//  Created by Shruthi on 14/07/15.
//  Copyright © 2015 Shruthi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Events.h"

@interface DetailsViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate, UISearchBarDelegate>


//@property UIImage *eventImage;

@property Events *item;

-(IBAction)dismiss;

@property (nonatomic, weak) IBOutlet UILabel *enameLabel;
@property (nonatomic, weak) IBOutlet UILabel *edateLabel;
@property (nonatomic, weak) IBOutlet UILabel *etimeLabel;
@property (nonatomic, weak) IBOutlet UILabel *eaddressLabel;
@property (nonatomic, weak) IBOutlet UILabel *edescLabel;
@property (nonatomic, weak) IBOutlet UIImageView *ratingImage;


@property (nonatomic, weak) IBOutlet MKMapView *mapView;


@property (nonatomic, strong) NSArray *mapItemList;
@property (nonatomic, assign) MKCoordinateRegion boundingRegion;
@property (nonatomic) CLLocationCoordinate2D userLocation;
@property (nonatomic, strong) MKLocalSearch *localSearch;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) NSArray *places;
@end
