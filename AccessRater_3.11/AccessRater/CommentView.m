//
//  CommentView.m
//  AccessRater
//
//  Created by Michael Lee on 2013-11-29.
//  Copyright (c) 2013 AccessRaterTeam. All rights reserved.
//

#import "CommentView.h"
#import "CreatenewCommentViewController.h"
#import "CommentDetailViewController.h"
@implementation CommentView
@synthesize lat;
@synthesize lon;
@synthesize LocationID;
@synthesize tableData;
@synthesize subtitletableData;
@synthesize commentIDarray;
@synthesize table;


-(void)viewDidLoad{
    [[self table]setDelegate:self];
    [[self table]setDataSource:self];
    // A date formatter for the creation date.
    static NSDateFormatter *dateFormatter = nil;
	if (dateFormatter == nil) {
		dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.timeStyle = NSDateFormatterMediumStyle;
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
	}

    tableData= [[NSMutableArray alloc]init];
    subtitletableData = [[NSMutableArray alloc]init];
    commentIDarray = [[NSMutableArray alloc]init];

    if (LocationID==nil) {
        [self alter:@"can not load the information,please try again later"];
    }else{
    
    PFQuery *query1 =[PFQuery queryWithClassName:@"Comments"];
    
    [query1 whereKey:@"LocationID" equalTo:LocationID];
    [query1 findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            //  NSLog(@"there are %d items",objects.count);
            
            //for (int x =0; x<objects.count; x++) {
            for (PFObject *object in objects) {
                [commentIDarray addObject:[NSString stringWithFormat:@"%@",object[@"Content"]]] ;
                //add date as the title into the cell title array (tableData)
                NSDate *createdAt = object.createdAt;
                NSString *datetime = [dateFormatter stringFromDate:createdAt];
                NSLog(@"%@",datetime);
                [tableData addObject:[NSString stringWithFormat:@"%@",datetime]];
                //add user name  as subtitle into the cell subtitle array (subtitletableData)
                PFUser *commentUsercbject=[object objectForKey:@"user"];
                PFQuery *userquery = [PFUser query];
                [userquery whereKey:@"objectId" equalTo:commentUsercbject.objectId];
                NSArray *userArray = [userquery findObjects];
                NSString *userName = [userArray[0] objectForKey:@"username"];
                NSLog(@"%@",userName);
                [subtitletableData addObject:[NSString stringWithFormat:@"%@",userName]];
                
                
                
                
                //NSLog(@"%@",tableData[x]);
                
                // NSLog(@"number of item in data %i", tableData.count);
                
            }
            [[self table]reloadData];
            [self alter:@"finish loadding data"];
        }
    }];
    }

    [super viewDidLoad];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{  //commentdetail
    if ([segue.identifier isEqualToString:@"commentdetail"]) {
        CommentDetailViewController *detailc = [segue destinationViewController];
        detailc.LocationID =LocationID;
        
        NSIndexPath *indexpath = nil;
        NSString *titlestring = nil;
        NSString *subtitlestring = nil;
        NSString *commentDetail = nil;
        
        indexpath = [table indexPathForSelectedRow];
        titlestring = [tableData objectAtIndex:indexpath.row];
        subtitlestring = [subtitletableData objectAtIndex:indexpath.row];
        commentDetail = [commentIDarray objectAtIndex:indexpath.row];
        [[segue destinationViewController] setCommentDatil:commentDetail];
        [[segue destinationViewController] setTitlecontents:titlestring];
        [[segue destinationViewController] setSubtitlecontents:subtitlestring];
    }
    
    
	if ([segue.identifier isEqualToString:@"makeNewComment"])
	{
        CreatenewCommentViewController *newvc = [segue destinationViewController];
        newvc.LocationID =LocationID;
        
	}
}



#pragma mark - TableView Data Source methods

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //NSLog(@"number of data %i",tableData.count);
    return [tableData count];
    
}






- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *smplUD=@"onecomment";
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:smplUD];
    
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:smplUD];
    }
    NSString *tl=[tableData objectAtIndex:indexPath.row];
    NSString *stl=[subtitletableData objectAtIndex:indexPath.row];
    NSLog(@"%@",stl);
    
    cell.textLabel.text=tl;
    cell.detailTextLabel.text=stl;
    
    
    return cell;
}

-(void) alter: (NSString*)pop{
    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"Notice" message:pop delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alter show];
    
}
@end
