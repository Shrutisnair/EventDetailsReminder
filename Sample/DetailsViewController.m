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

@end


@implementation DetailsViewController

@synthesize item;
@synthesize mapView;

@synthesize enameLabel=_enameLabel;
@synthesize edateLabel=_edateLabel;
@synthesize etimeLabel=_etimeLabel;
@synthesize eaddressLabel=_eaddressLabel;
@synthesize edescLabel=_edescLabel;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.enameLabel.text=item.name;
    self.edateLabel.text=item.date;
    self.ratingImage.image =[UIImage imageNamed:item.rating] ;
    self.etimeLabel.text=item.time;
    self.eaddressLabel.text=item.address;
    self.edescLabel.text=item.desc;
    self.mapView.delegate = self;
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - IBAction Methods

- (IBAction)dismiss {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)subscribe{
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10 ];
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.category = @"myCategory";
    localNotification.alertBody = @"Alert alarm";
    localNotification.applicationIconBadgeNumber = 1;
    localNotification.userInfo = @{ @"key1" : item.name, @"key2" : item.date, @"key3" : item.time };
   // localNotification.alertAction =@"Sample";
    
    
   /* if(soundfileName == nil)
    {
        localNotification.soundName = UILocalNotificationDefaultSoundName;
    }
    else
    {
        localNotification.soundName = soundfileName;
    }
*/
  //  localNotification.alertLaunchImage = launchImage;
    
  //  self.badgeCount ++;
   // localNotification.applicationIconBadgeNumber = self.badgeCount;
   // localNotification.userInfo = userInfo;
    
    // Schedule it with the app
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
   // [localNotification release];
   }

-(void)viewDidAppear:(BOOL)animated
{
    
   
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = self.userLocation.latitude;
    newRegion.center.longitude = self.userLocation.longitude;
    
    newRegion.span.latitudeDelta = 0.3;
    newRegion.span.longitudeDelta = 0.3;
    
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    
    request.naturalLanguageQuery = item.location;
    request.region = newRegion;
    MKLocalSearchCompletionHandler completionHandler = ^(MKLocalSearchResponse *response, NSError *error)
    {
        self.places = [response mapItems];
        self.boundingRegion = response.boundingRegion;
        
        MKMapItem *mapItem = [self.mapItemList objectAtIndex:0];
         NSLog(@"%@",mapItem.name);
      
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

}

#pragma - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"locationmaps"]) {
     //   NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        mapViewController *destViewController = segue.destinationViewController;
        destViewController.boundRegion=self.boundingRegion;
        destViewController.mapItem=[self.places objectAtIndex:0];
    }
}
        @end
