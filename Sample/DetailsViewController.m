//
//  DetailsViewController.m
//  Sample
//
//  Created by Shruthi on 14/07/15.
//  Copyright © 2015 Shruthi. All rights reserved.
//

#import "DetailsViewController.h"
//#import "PlaceAnnotation.h"

@interface PlaceAnnotation : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subTitle;
@property (nonatomic, retain) NSURL *url;

@end
@interface DetailsViewController ()

@property (nonatomic, strong) PlaceAnnotation *annotation;

@property (nonatomic, assign) MKCoordinateRegion boundingRegion;

@property (nonatomic, strong) MKLocalSearch *localSearch;
@property (nonatomic, strong) CLLocationManager *locationManager;
@end






@implementation DetailsViewController



@synthesize mapView;

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
    self.mapView.delegate = self;
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

/*- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
}*/

-(void)viewDidAppear:(BOOL)animated
 {
     [super viewDidAppear:animated];
     
     [self.mapView setRegion:self.boundingRegion];
     
     if (self.mapItemList.count == 1)
     {
         MKMapItem *mapItem = [self.mapItemList objectAtIndex:0];
         
         self.title = mapItem.name;
         
         // add the single annotation to our map
         PlaceAnnotation *annotation = [[PlaceAnnotation alloc] init];
         annotation.coordinate = mapItem.placemark.location.coordinate;
         annotation.title = mapItem.name;
         annotation.url = mapItem.url;
         [self.mapView addAnnotation:annotation];
         
         // we have only one annotation, select it's callout
         [self.mapView selectAnnotation:[self.mapView.annotations objectAtIndex:0] animated:YES];
         
         // center the region around this map item's coordinate
         self.mapView.centerCoordinate = mapItem.placemark.coordinate;
     }
     else
     {
         self.title = @"All Places";
         
         // add all the found annotations to the map
         for (MKMapItem *item in self.mapItemList)
         {
             PlaceAnnotation *annotation = [[PlaceAnnotation alloc] init];
             annotation.coordinate = item.placemark.location.coordinate;
             annotation.title = item.name;
             annotation.url = item.url;
             [self.mapView addAnnotation:annotation];
             
             
         }
     }
     
 }

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.mapView removeAnnotations:self.mapView.annotations];
}

- (NSUInteger)supportedInterfaceOrientations
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return UIInterfaceOrientationMaskAll;
    else
        return UIInterfaceOrientationMaskAllButUpsideDown;
}


#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKPinAnnotationView *annotationView = nil;
    if ([annotation isKindOfClass:[PlaceAnnotation class]])
    {
        annotationView = (MKPinAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:@"Pin"];
        if (annotationView == nil)
        {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"Pin"];
            annotationView.canShowCallout = YES;
            annotationView.animatesDrop = YES;
        }
    }
    return annotationView;
}

@end
