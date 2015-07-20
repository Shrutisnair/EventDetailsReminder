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

@interface ViewController ()


@end

@implementation ViewController

@synthesize tableView=_tableView;

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"events" ofType:@"json"];
   
    NSString* jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    tableData=[[NSMutableArray alloc] init] ;
    tableTime=[[NSMutableArray alloc] init] ;
    tableDate=[[NSMutableArray alloc] init] ;
    thumbnails=[[NSMutableArray alloc] init];
    tableLocation=[[NSMutableArray alloc]init];
    tableAddress=[[NSMutableArray alloc]init];
    tableDesc=[[NSMutableArray alloc]init];
    NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *jsonError;
    id allKeys = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&jsonError];
    
    
    for (int i=0; i<[allKeys count]; i++) {
        NSDictionary *arrayResult = [allKeys objectAtIndex:i];
        NSString *name=[arrayResult objectForKey:@"eventName"];
        [tableData addObject:name];
        NSString *time=[arrayResult objectForKey:@"time"];
        [tableTime addObject:time];
        NSString *date=[arrayResult objectForKey:@"date"];
        [tableDate addObject:date];
        NSString *location=[arrayResult objectForKey:@"location"];
        [tableLocation addObject:location];
        NSString *rating=[arrayResult objectForKey:@"rating"];
        [thumbnails addObject:rating];
        NSString *address=[arrayResult objectForKey:@"address"];
        [tableAddress addObject:address];
        NSString *desc=[arrayResult objectForKey:@"description"];
        [tableDesc addObject:desc];
    }
}
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

#pragma - UITableView delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SampleCell";
    
    SampleCell *cell = (SampleCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
 
    if (cell == nil)
    {
        cell = [[SampleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.nameLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.timeLabel.text = [tableTime objectAtIndex:indexPath.row];
    cell.dateLabel.text = [tableDate objectAtIndex:indexPath.row];
    cell.locationLabel.text = [tableLocation objectAtIndex:indexPath.row];
    cell.imageView.image=[UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4700850_orig.png"]];
 
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 125;

}

#pragma - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailsViewController *destViewController = segue.destinationViewController;
        destViewController.eventName = [tableData objectAtIndex:indexPath.row];
        destViewController.eventDate = [tableDate objectAtIndex:indexPath.row];
        destViewController.eventTime = [tableTime objectAtIndex:indexPath.row];
        destViewController.eventImage=[UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
        destViewController.eventAddress=[tableAddress objectAtIndex:indexPath.row];
        destViewController.eventLocation = [tableLocation objectAtIndex:indexPath.row];
        destViewController.eventDesc = [tableDesc objectAtIndex:indexPath.row];
    }
}
@end
