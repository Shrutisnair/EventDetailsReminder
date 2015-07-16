//
//  DetailsViewController.m
//  Sample
//
//  Created by Shruthi on 14/07/15.
//  Copyright © 2015 Shruthi. All rights reserved.
//

#import "DetailsViewController.h"
#import "PlaceAnnotation.h"
#import"mapViewController.h"


@interface DetailsViewController () 
//@property (nonatomic, assign) MKCoordinateRegion boundingRegion;
@end






@implementation DetailsViewController



@synthesize mapView;

@synthesize eventName;
@synthesize eventDate;
@synthesize eventTime;
//@synthesize eventRating;
@synthesize eventLocation;
@synthesize eventAddress;
@synthesize eventDesc;
@synthesize imageView;

@synthesize enameLabel=_enameLabel;
@synthesize edateLabel=_edateLabel;
@synthesize etimeLabel=_etimeLabel;
@synthesize eaddressLabel=_eaddressLabel;
@synthesize edescLabel=_edescLabel;
//@synthesize eratingLabel=_eratingLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.enameLabel.text=eventName;
    self.edateLabel.text=eventDate;
    self.imageView.image = imageView;
    self.etimeLabel.text=eventTime;
    self.eaddressLabel.text=eventAddress;
    self.edescLabel.text=eventDesc;
    //self.eratingLabel.text=eventRating;
    self.mapView.delegate = self;
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismiss {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewDidAppear:(BOOL)animated
{
    
   
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = self.userLocation.latitude;
    newRegion.center.longitude = self.userLocation.longitude;
    
    newRegion.span.latitudeDelta = 0.3;
    newRegion.span.longitudeDelta = 0.3;
    
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    
    request.naturalLanguageQuery = eventLocation;
    request.region = newRegion;
    MKLocalSearchCompletionHandler completionHandler = ^(MKLocalSearchResponse *response, NSError *error)
    {
        self.places = [response mapItems];
        self.boundingRegion = response.boundingRegion;
        
        MKMapItem *mapItem = [self.mapItemList objectAtIndex:0];
         NSLog(@"%@",mapItem.name);
       // self.title = mapItem.name;
        [self.mapView setRegion:self.boundingRegion];
    
        mapItem = [self.places objectAtIndex:0];
    
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
    };

 if (self.localSearch != nil)
{
    self.localSearch = nil;
}
self.localSearch = [[MKLocalSearch alloc] initWithRequest:request];

[self.localSearch startWithCompletionHandler:completionHandler];
//[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

//[self.mapView setRegion:self.boundingRegion];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"locationmaps"]) {
     //   NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        mapViewController *destViewController = segue.destinationViewController;
        destViewController.boundRegion=self.boundingRegion;
        destViewController.mapItem=[self.places objectAtIndex:0];
    }
}
        @end
