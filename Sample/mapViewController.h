//
//  mapViewController.h
//  Sample
//
//  Created by Shruthi on 15/07/15.
//  Copyright © 2015 Shruthi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface mapViewController : UIViewController

@property MKCoordinateRegion boundRegion;
@property MKMapItem *mapItem;
@property (nonatomic, weak) IBOutlet MKMapView *mapView;

@end
