//
//  InfoViewController.m
//  AccessRater
//
//  Created by MaxOu on 2013-11-28.
//  Copyright (c) 2013 AccessRaterTeam. All rights reserved.
//

#import "InfoViewController.h"

@implementation InfoViewController
@synthesize label1;
@synthesize addresslabel;
@synthesize idlabel;
//@synthesize lat;
//@synthesize lon;
@synthesize LocationID;


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
    if (LocationID==nil) {
        [self alter:@"can not load the information,please try again later"];
        label1.text=@"no data";
        addresslabel.text=@"no data";
        idlabel.text=@"no data";
    }else{
    
    NSLog(@"locationID %@",LocationID);
    [super viewDidLoad];

    NSString *temp = [NSString stringWithFormat:@"%@",LocationID];
    idlabel.text=temp;

    PFQuery *query =[PFQuery queryWithClassName:@"Location"];
    [query whereKey:@"PlaceID" equalTo:LocationID];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSLog(@"equal");
            //  NSLog(@"there are %d items",objects.count);
            for (int x =0; x<objects.count; x++) {
                NSString *title = objects[x][@"info"];
                PFGeoPoint *num = objects[x][@"location"];
                NSNumber *id1=[[NSNumber alloc]init];
                id1=objects[x][@"PlaceID"];
                NSLog(@"id1 = %@",id1);
                label1.text=[NSString stringWithFormat:@"<%g/%g>",num.latitude,num.longitude];
                addresslabel.text = title;
            }
        }
    }];
    
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) alter: (NSString*)pop{
    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"Notice" message:pop delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alter show];
    
}

@end
