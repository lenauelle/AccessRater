//
//  FavouriteViewController.m
//  AccessRater
//
//  Created by Michael Lee on 11/30/13.
//  Copyright (c) 2013 AccessRaterTeam. All rights reserved.
//

#import "RatingViewController.h"

@interface RatingViewController ()

@end

@implementation RatingViewController
@synthesize LocationID;
@synthesize info;
@synthesize flag;

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
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)AddFavourite:(id)sender {
if (LocationID==nil) {
    [self alter:@"can not load the information,please try again later"];
}else{
    flag = true;
    PFUser *user = [PFUser currentUser];
    PFQuery *query1 =[PFQuery queryWithClassName:@"Favourite"];
    //NSLog(@" %@",user);
    [query1 whereKey:@"user" equalTo:user];
    [query1 findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // NSLog(@"objects %i",objects.count);
            for (int x =0; x<objects.count; x++) {
                NSNumber *id1=objects[x][@"LocationID"];
                
                if ([id1 intValue]==[LocationID intValue]) {
                    NSLog(@"already exist");
                    [self alter:@"This location is alredy in your favourite list"];
                    flag =false;
                    break;
                }else{
                    //NSLog(@"not exist");
                }
                
                
            }
        }
        if (flag) {
            NSLog(@"not exist");
            PFQuery *query =[PFQuery queryWithClassName:@"Favourite"];
            
            [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                if (!error) {
                    
                    PFObject *newfavourite = [PFObject objectWithClassName:@"Favourite"];
                    [newfavourite setObject:LocationID forKey:@"LocationID"];
                    [newfavourite setObject:info forKey:@"Info"];
                    [newfavourite setObject:user forKey:@"user"];
                    [newfavourite saveInBackground];
                    NSLog(@"successfully add to favourite");
                    [self alter:@"successfully add to favourite"];
                }
                else {
                    //NSLog(@"Couldn't save!");
                    NSLog(@"Could not save: %@", error);
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[[error userInfo] objectForKey:@"error"] message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                    [alertView show];
                    return;
                    
                    
                }
            }];
        }
    }];
            }
    
}

-(void) alter: (NSString*)pop{
    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"Notice" message:pop delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alter show];
    
}
@end