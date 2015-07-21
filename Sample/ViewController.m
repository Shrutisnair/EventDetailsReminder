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

@interface ViewController ()


@end

@implementation ViewController

@synthesize tableView=_tableView;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
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
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

#pragma - UITableView delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [event count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SampleCell";
    
    SampleCell *cell = (SampleCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
 
    if (cell == nil)
    {
        cell = [[SampleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    Events *temp=[[Events alloc]init];
    temp= [event objectAtIndex:indexPath.row];
    cell.nameLabel.text = temp.name;
    cell.timeLabel.text = temp.time;
    cell.dateLabel.text = temp.date;
    cell.locationLabel.text = temp.location;
    cell.imageView.image=[UIImage imageNamed:temp.rating];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cellImage"]];
 
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;

}

#pragma - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailsViewController *destViewController = segue.destinationViewController;
        
               destViewController.item = [event objectAtIndex:indexPath.row];
    }
}
@end
