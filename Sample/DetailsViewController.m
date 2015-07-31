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
#import <CoreData/CoreData.h>

@interface DetailsViewController ()
{
    NSMutableArray *dataObjects;
}

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

/*- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}*/

- (NSManagedObjectContext *)managedObjectContext {
    // NSManagedObjectContext *context = nil;
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"events" withExtension:@"momd"];
    NSManagedObjectModel * managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    
    
    NSURL *storeURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"group.qburst.watch"];
    storeURL = [storeURL URLByAppendingPathComponent:@"Sample.sqlite"];
    
    NSPersistentStore *store = nil;
    NSPersistentStoreCoordinator *coordinator=[[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
    NSError *error=nil;
    store = [coordinator addPersistentStoreWithType:NSSQLiteStoreType
                                      configuration:nil
                                                URL:storeURL
                                            options:nil
                                              error:&error];
    
    NSManagedObjectContext * managedObjectContext = [[NSManagedObjectContext alloc] init];
    [managedObjectContext setPersistentStoreCoordinator:coordinator];
    
    return managedObjectContext;
}


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
  //  self.mapView.delegate = self;
    
    }

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //    MKCoordinateRegion newRegion;
    //    newRegion.center.latitude = self.userLocation.latitude;
    //    newRegion.center.longitude = self.userLocation.longitude;
    //
    //    newRegion.span.latitudeDelta = 0.3;
    //    newRegion.span.longitudeDelta = 0.3;
    //
    //    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    //
    //    request.naturalLanguageQuery = item.location;
    //    request.region = newRegion;
    //    MKLocalSearchCompletionHandler completionHandler = ^(MKLocalSearchResponse *response, NSError *error)
    //    {
    //        self.places = [response mapItems];
    //        self.boundingRegion = response.boundingRegion;
    //
    //        MKMapItem *mapItem = [self.mapItemList objectAtIndex:0];
    //         NSLog(@"%@",mapItem.name);
    //
    //        [self.mapView setRegion:self.boundingRegion];
    //
    //        mapItem = [self.places objectAtIndex:0];
    //
    //        // add the single annotation to our map
    //        PlaceAnnotation *annotation = [[PlaceAnnotation alloc] init];
    //        annotation.coordinate = mapItem.placemark.location.coordinate;
    //        annotation.title = mapItem.name;
    //        annotation.url = mapItem.url;
    //        [self.mapView addAnnotation:annotation];
    //
    //        [self.mapView selectAnnotation:[self.mapView.annotations objectAtIndex:0] animated:YES];
    //
    //        // center the region around this map item's coordinate
    //        self.mapView.centerCoordinate = mapItem.placemark.coordinate;
    //    };
    //
    // if (self.localSearch != nil)
    //{
    //    self.localSearch = nil;
    //}
    //self.localSearch = [[MKLocalSearch alloc] initWithRequest:request];
    //
    //[self.localSearch startWithCompletionHandler:completionHandler];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

#pragma mark- IBAction Methods

- (IBAction)dismiss {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)subscribe{
    
    int subscribed =0;
    
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Entity"];
    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    //   [self.tableView reloadData];
    
    
    
    dataObjects=[[NSMutableArray alloc]init];
    
    for (NSInteger i=0; i<self.devices.count; i++) {
        //  NSDictionary *arrayResult = [allKeys objectAtIndex:i]; */
        
        
        
        NSManagedObject *device = [self.devices objectAtIndex:i];
      //  [dataObjects addObject:[device valueForKey:@"eventName"]];
          // NSLog(@"%@",item.eventid);
        
        if([item.eventid isEqualToString:[device valueForKey:@"eventId"]])
        {
            subscribed =1;
         
            NSLog(@"Already Subscribed");
            break;
        }
    }
    
    if( subscribed ==0) {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Entity" inManagedObjectContext:context];
    
    
    [newDevice setValue:item.name forKey:@"eventName"];
    [newDevice setValue:item.time forKey:@"eventTime"];
    [newDevice setValue:item.date forKey:@"eventDate"];
    [newDevice setValue:item.location forKey:@"eventLocation"];
    [newDevice setValue:item.address forKey:@"eventAddress"];
    [newDevice setValue:item.desc forKey:@"eventDesc"];
    [newDevice setValue:item.eventid forKey:@"eventId"];
    [newDevice setValue:item.rating forKey:@"eventRating"];
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);    }
    
   // NSLog(@"Event name;%@",[newDevice valueForKey:@"eventName"]);
    }
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


#pragma - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"locationmaps"]) {
        mapViewController *destViewController = segue.destinationViewController;
        destViewController.boundRegion=self.boundingRegion;
        destViewController.mapItem=[self.places objectAtIndex:0];
    }
}
        @end
