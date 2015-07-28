//
//  ViewController.m
//  Sample
//
//  Created by Shruthi on 13/07/15.
//  Copyright © 2015 Shruthi. All rights reserved.
//

#import "ViewController.h"
#import "SampleCell.h"
#import "DetailsViewController.h"
#import "Events.h"
#import <CoreData/CoreData.h>

@interface ViewController ()


@end

@implementation ViewController

@synthesize tableView=_tableView;


- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (int) rowCount {
    
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Entity"];
    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    return [self.devices count];
    
}

- (void) copyToDatabase {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"events" ofType:@"json"];
    
    NSString* jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    event=[[NSMutableArray alloc]init];
    
    NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *jsonError;
    id allKeys = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&jsonError];
    NSManagedObjectContext *context = [self managedObjectContext];
    
    for (int i=0; i<[allKeys count]; i++) {
        NSDictionary *arrayResult = [allKeys objectAtIndex:i];
        
        details = [[Events alloc]init];
        
        details.name=[arrayResult objectForKey:@"eventName"];
        details.time=[arrayResult objectForKey:@"time"];
        details.date=[arrayResult objectForKey:@"date"];
        details.location=[arrayResult objectForKey:@"location"];
        details.address=[arrayResult objectForKey:@"address"];
        details.desc=[arrayResult objectForKey:@"description"];
        details.id=[arrayResult objectForKey:@"eventId"];
        details.rating=[arrayResult objectForKey:@"rating"];
        
        [event addObject:details];
        
        // Create a new managed object
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Entity" inManagedObjectContext:context];
        [newDevice setValue:details.name forKey:@"eventName"];
        [newDevice setValue:details.time forKey:@"eventTime"];
        [newDevice setValue:details.date forKey:@"eventDate"];
        [newDevice setValue:details.location forKey:@"eventLocation"];
        [newDevice setValue:details.address forKey:@"eventAddress"];
        [newDevice setValue:details.desc forKey:@"eventDesc"];
        [newDevice setValue:details.id forKey:@"eventId"];
        [newDevice setValue:details.rating forKey:@"eventRating"];
        
        NSError *error = nil;
        // Save the object to persistent store
        if (![context save:&error]) {
            NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);    }

}
}


- (void) fetchFromJson {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"events" ofType:@"json"];
    
    NSString* jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    event=[[NSMutableArray alloc]init];
    
    NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *jsonError;
    id allKeys = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&jsonError];
    
    
    for (int i=0; i<[allKeys count]; i++) {
        NSDictionary *arrayResult = [allKeys objectAtIndex:i];
        
        details = [[Events alloc]init];
        
        details.name=[arrayResult objectForKey:@"eventName"];
        details.time=[arrayResult objectForKey:@"time"];
        details.date=[arrayResult objectForKey:@"date"];
        details.location=[arrayResult objectForKey:@"location"];
        details.address=[arrayResult objectForKey:@"address"];
        details.desc=[arrayResult objectForKey:@"description"];
        details.id=[arrayResult objectForKey:@"eventId"];
        details.rating=[arrayResult objectForKey:@"rating"];
        
        [event addObject:details];
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([self rowCount]==0) {
        [self copyToDatabase];
    }
    else {
        [self fetchFromJson];
    }
   

    //code for deleting the contents of database
    
  /* NSManagedObjectContext *myContext = [self managedObjectContext];
    NSFetchRequest *allCars = [[NSFetchRequest alloc] init];
    [allCars setEntity:[NSEntityDescription entityForName:@"Entity" inManagedObjectContext:myContext]];
    [allCars setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    
    NSError *error = nil;
    NSArray *cars = [myContext executeFetchRequest:allCars error:&error];
 //   [allCars release];
    //error handling goes here
    for (NSManagedObject *car in cars) {
        [myContext deleteObject:car];
    }
    NSError *saveError = nil;
    [myContext save:&saveError]; */
    
    
    }



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
   

}



- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Entity"];
    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    [self.tableView reloadData];
}





#pragma mark- UITableView delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   // return [event count];
   
    return self.devices.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SampleCell";
    
    SampleCell *cell = (SampleCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
 
    if (cell == nil)
    {
        cell = [[SampleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    
    NSManagedObject *device = [self.devices objectAtIndex:indexPath.row];
    [cell.nameLabel setText:[device valueForKey:@"eventName"]];
    [cell.timeLabel setText:[device valueForKey:@"eventTime"]];
    [cell.dateLabel setText:[device valueForKey:@"eventDate"]];
    [cell.locationLabel setText:[device valueForKey:@"eventLocation"]];
    
    switch ([[device valueForKey:@"eventRating"] intValue]) {
        case 1:
            cell.star1.image=[UIImage imageNamed:@"brightstar"];
            cell.star2.image=[UIImage imageNamed:@"darkstar"];
            cell.star3.image=[UIImage imageNamed:@"darkstar"];
            cell.star4.image=[UIImage imageNamed:@"darkstar"];
            cell.star5.image=[UIImage imageNamed:@"darkstar"];
                              break;
        
        case 2:
            cell.star1.image=[UIImage imageNamed:@"brightstar"];
            cell.star2.image=[UIImage imageNamed:@"brightstar"];
            cell.star3.image=[UIImage imageNamed:@"darkstar"];
            cell.star4.image=[UIImage imageNamed:@"darkstar"];
            cell.star5.image=[UIImage imageNamed:@"darkstar"];
                            break;
        
        case 3:
            cell.star1.image=[UIImage imageNamed:@"brightstar"];
            cell.star2.image=[UIImage imageNamed:@"brightstar"];
            cell.star3.image=[UIImage imageNamed:@"brightstar"];
            cell.star4.image=[UIImage imageNamed:@"darkstar"];
            cell.star5.image=[UIImage imageNamed:@"darkstar"];
                        break;
            
        case 4:
            cell.star1.image=[UIImage imageNamed:@"brightstar"];
            cell.star2.image=[UIImage imageNamed:@"brightstar"];
            cell.star3.image=[UIImage imageNamed:@"brightstar"];
            cell.star4.image=[UIImage imageNamed:@"brightstar"];
            cell.star5.image=[UIImage imageNamed:@"darkstar"];
                        break;
            
        case 5:
            cell.star1.image=[UIImage imageNamed:@"brightstar"];
            cell.star2.image=[UIImage imageNamed:@"brightstar"];
            cell.star3.image=[UIImage imageNamed:@"brightstar"];
            cell.star4.image=[UIImage imageNamed:@"brightstar"];
            cell.star5.image=[UIImage imageNamed:@"brightstar"];
                        break;
            
            
        default:
            break;
    }
   
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cellImage"]];
 
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;

}


#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailsViewController *destViewController = segue.destinationViewController;
        
               destViewController.item = [event objectAtIndex:indexPath.row];
    }
}
@end
