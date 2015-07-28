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

@synthesize star1=_star1;
@synthesize star2=_star2;
@synthesize star3=_star3;
@synthesize star4=_star4;
@synthesize star5=_star5;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.enameLabel.text=item.name;
    self.edateLabel.text=item.date;
    
    switch ([item.rating intValue]) {
        case 1:
            self.star1.image=[UIImage imageNamed:@"brightstar"];
            self.star2.image=[UIImage imageNamed:@"darkstar"];
            self.star3.image=[UIImage imageNamed:@"darkstar"];
            self.star4.image=[UIImage imageNamed:@"darkstar"];
            self.star5.image=[UIImage imageNamed:@"darkstar"];
            break;
            
        case 2:
            self.star1.image=[UIImage imageNamed:@"brightstar"];
            self.star2.image=[UIImage imageNamed:@"brightstar"];
            self.star3.image=[UIImage imageNamed:@"darkstar"];
            self.star4.image=[UIImage imageNamed:@"darkstar"];
            self.star5.image=[UIImage imageNamed:@"darkstar"];
            break;
            
        case 3:
            self.star1.image=[UIImage imageNamed:@"brightstar"];
            self.star2.image=[UIImage imageNamed:@"brightstar"];
            self.star3.image=[UIImage imageNamed:@"brightstar"];
            self.star4.image=[UIImage imageNamed:@"darkstar"];
            self.star5.image=[UIImage imageNamed:@"darkstar"];
            break;
            
        case 4:
            self.star1.image=[UIImage imageNamed:@"brightstar"];
            self.star2.image=[UIImage imageNamed:@"brightstar"];
            self.star3.image=[UIImage imageNamed:@"brightstar"];
            self.star4.image=[UIImage imageNamed:@"brightstar"];
            self.star5.image=[UIImage imageNamed:@"darkstar"];
            break;
            
        case 5:
            self.star1.image=[UIImage imageNamed:@"brightstar"];
            self.star2.image=[UIImage imageNamed:@"brightstar"];
            self.star3.image=[UIImage imageNamed:@"brightstar"];
            self.star4.image=[UIImage imageNamed:@"brightstar"];
            self.star5.image=[UIImage imageNamed:@"brightstar"];
            break;
            
            
        default:
            break;
    }
    
    self.etimeLabel.text=item.time;
    self.eaddressLabel.text=item.address;
    self.edescLabel.text=item.desc;
    self.mapView.delegate = self;
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

#pragma mark- IBAction Methods

- (IBAction)dismiss {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)subscribe{
    
    
    NSString* dateString = [NSString stringWithFormat:@"%@T%@:00", self.item.date,self.item.time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy'T'HH:mm:ss"];
    NSDate *dateFromString = [[NSDate alloc] init];
    dateFromString = [dateFormatter dateFromString:dateString];
    
    NSDate *newDate = [dateFromString dateByAddingTimeInterval:-3600];
    
    UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Reminder set"
                                                  message:self.item.name
                                                 delegate:self
                                        cancelButtonTitle:@"OK"
                                        otherButtonTitles:nil];
    [alert show];
  
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = newDate;
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.category = @"myCategoryyh";
    localNotification.alertTitle = self.item.name;

    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    localNotification.alertBody = @"The event starts in 1 hour";
    localNotification.userInfo = @{ @"title" : self.item.name, @"body" : @"Event starts in one hour"};
  
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
  
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
        mapViewController *destViewController = segue.destinationViewController;
        destViewController.boundRegion=self.boundingRegion;
        destViewController.mapItem=[self.places objectAtIndex:0];
    }
}
        @end
