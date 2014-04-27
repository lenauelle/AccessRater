//
//  FavouriteViewController.m
//  AccessRater
//
//  Created by Michael Lee on 11/30/13.
//  Copyright (c) 2013 AccessRaterTeam. All rights reserved.
//

#import "FavouriteViewController.h"

@interface FavouriteViewController ()

@end

@implementation FavouriteViewController
@synthesize TableView;
@synthesize tableData;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self TableView]setDelegate:self];
    [[self TableView]setDataSource:self];
    static NSDateFormatter *dateFormatter = nil;
	if (dateFormatter == nil) {
		dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.timeStyle = NSDateFormatterMediumStyle;
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
	}
    //tableData =[[NSArray alloc] initWithObjects:@"123",@"345",@"3345", nil];
    tableData= [[NSMutableArray alloc]init];
    
    
    PFQuery *query1 =[PFQuery queryWithClassName:@"Favourite"];
    PFUser *user = [PFUser currentUser];
    [query1 whereKey:@"user" equalTo:user];
           [query1 findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            //  NSLog(@"there are %d items",objects.count);
        
            //for (int x =0; x<objects.count; x++) {
            for (PFObject *object in objects) {
                
                NSString *info = object[@"Info"];
                //NSLog(@"%@",info);
                [tableData addObject:[NSString stringWithFormat:@"%@",info]];
                //add user name  as subtitle into the cell subtitle array (subtitletableData)
                
                
                
                //NSLog(@"%@",tableData[x]);
                
                // NSLog(@"number of item in data %i", tableData.count);
                
            }
            [[self TableView]reloadData];
        }
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //NSLog(@"number of data %i",tableData.count);
    return [tableData count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *SimpleTableIdentifier = @"onefavourite";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:SimpleTableIdentifier];
    }
    cell.textLabel.text=[tableData objectAtIndex:indexPath.row];
    
    
    
    return cell;
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
        NSLog(@"go?");
        //NSString *tittle = @"sfu";
        UITabBarController*control =segue.destinationViewController;
        InfoViewController *dc =[[InfoViewController alloc] init];
        dc = (InfoViewController *)[[control customizableViewControllers] objectAtIndex:1];
        CommentView *comment = [[CommentView alloc] init];
        comment = (CommentView *)[[control customizableViewControllers] objectAtIndex:3];
        RatingViewController *favourite =[[RatingViewController alloc]init];
        favourite = (RatingViewController *)[[control customizableViewControllers] objectAtIndex:2];
        NSString *info =[[NSString alloc]init];
        NSIndexPath * path =[self.TableView indexPathForSelectedRow];
        info =[tableData objectAtIndex:path.row];
        
        //PASS ID
        PFQuery *query =[PFQuery queryWithClassName:@"Location"];
        [query whereKey:@"info" equalTo:info];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                //  NSLog(@"there are %d items",objects.count);
                for (int x =0; x<objects.count; x++) {
                    //  NSString *title = objects[x][@"info"];
                    NSString *info =objects[x][@"info"];
                    
                    NSNumber *id1= objects[x][@"PlaceID"];
                    NSLog(@"the id1 is equal to %@",id1);
                    comment.LocationID=id1;
                    dc.LocationID=id1;
                    favourite.LocationID=id1;
                    favourite.info=info;
                }
            }
        }];
        
        
        
    
}
-(void) alter: (NSString*)pop{
    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"Notice" message:pop delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alter show];
    
}

@end
