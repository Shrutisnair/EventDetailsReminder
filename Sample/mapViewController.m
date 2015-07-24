//
//  mapViewController.m
//  Sample
//
//  Created by Shruthi on 15/07/15.
//  Copyright © 2015 Shruthi. All rights reserved.
//

#import "mapViewController.h"
#import "PlaceAnnotation.h"

@interface mapViewController ()

@end

@implementation mapViewController

@synthesize boundRegion;
@synthesize mapItem;
@synthesize mapView=_mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   }

-(void)viewDidAppear:(BOOL)animated
{
    [self.mapView setRegion:self.boundRegion];
    
   
    // add the single annotation to our map
    PlaceAnnotation *annotation = [[PlaceAnnotation alloc] init];
    annotation.coordinate = mapItem.placemark.location.coordinate;
    annotation.title = mapItem.name;
    annotation.url = mapItem.url;
    [self.mapView addAnnotation:annotation];
    
    [self.mapView selectAnnotation:[self.mapView.annotations objectAtIndex:0] animated:YES];
    
    // center the region around this map item's coordinate
    self.mapView.centerCoordinate = mapItem.placemark.coordinate;
}


@end
