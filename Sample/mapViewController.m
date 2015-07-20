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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    // we have only one annotation, select it's callout
    [self.mapView selectAnnotation:[self.mapView.annotations objectAtIndex:0] animated:YES];
    
    // center the region around this map item's coordinate
    self.mapView.centerCoordinate = mapItem.placemark.coordinate;
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
