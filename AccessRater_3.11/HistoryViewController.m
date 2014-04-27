//
//  HistoryViewController.m
//  AccessRater
//
//  Created by Rory O'Connor on 11/30/13.
//  Copyright (c) 2013 AccessRaterTeam. All rights reserved.
//

#import "HistoryViewController.h"


@implementation HistoryViewController

@synthesize historyData;
@synthesize LocationID;
@synthesize table;


- (void)viewDidLoad{
    [[self table]setDelegate:self];
    [[self table]setDataSource:self];
    NSLog( @"Hello");
    
    historyData = [[NSMutableArray alloc] init];
    data = [[NSMutableArray alloc] init];
    address = [[NSArray alloc] init];
    
    if([@"rpo1"  isEqual: [PFUser currentUser].username])
    {
        NSLog(@"Working");
    }
    else{
        NSLog(@"Not Working");
    }
    //setting current user object
    PFUser *cUser = [PFUser currentUser];
    
    //query returning History objects with currentUser identifier
    PFQuery *query =[PFQuery queryWithClassName:@"History"];
    [query whereKey:@"user" equalTo:cUser];
    NSInteger count = (long)query.countObjects;
    NSLog(@"Count of query objects %ld", (long)count);
    NSLog(@"Number of query results %ld",(long)query.countObjects);
    
    if(count == 0)
    {
        PFObject *temp = [PFObject objectWithClassName:@"History"];
        temp[@"user"] = cUser;
        [temp saveInBackground];
    }
    else{
        
        //store query results
        NSArray *history = [query findObjects];
        
        
        
        
        
        NSLog(@"Printing history: %@", history);
        
        //loop through result set
        for(PFObject *objects in history)
        {
            //set location array with the locationId values in the result set
            locations = [[NSMutableArray alloc] initWithArray:[objects objectForKey:@"locationIdArray"]];
            NSLog(@"Printing location ids: %@", locations);
            if(history.count>0)
            {
                
                
                //loop through locationIdArray
                for(int i =0; i<locations.count; i++)
                {
                    //query to find the location information for the Location object with the corresponding PlaceID
                    PFQuery *addressQuery = [PFQuery queryWithClassName:@"Location"];
                    // cast to Int so comparison works
                    NSNumber *number = [NSNumber numberWithInt:[locations[i] intValue]];
                    NSLog(@"Showing number: %@", number);
                    [addressQuery whereKey:@"PlaceID" equalTo:number];
                    address = [addressQuery findObjects];
                    NSLog(@"Printing addresses: %@", address);
                    
                    //loop through result set and add to the history table view
                    for(PFObject *objects in address)
                    {
                        NSString *info = [objects objectForKey:@"info"];
                        [historyData addObject:[NSString stringWithFormat:@"%@", info]];
                        NSLog(@"%@", historyData);
                    }
                }
            }
            if(history.count<=0)
            {
                
            }
        }
        
        
        
    }
    
    [[self table]reloadData];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //NSLog(@"number of data %i",historyData.count);
    return [historyData count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *SimpleTableIdentifier = @"history";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    
    if (cell== nil) {
        cell=[[UITableViewCell alloc]
              initWithStyle:UITableViewCellStyleDefault
              reuseIdentifier:SimpleTableIdentifier];
    }
    NSString *tl =[historyData objectAtIndex:indexPath.row];
    
    cell.textLabel.text= tl;
    
    
    
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
    NSIndexPath * path =[self.table indexPathForSelectedRow];
    info =[historyData objectAtIndex:path.row];
    
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







@end