//
//  UIContactViewController.m
//  AccessRater
//
//  Created by Jingya Huang on 13-10-28.
//  Copyright (c) 2013 AccessRaterTeam. All rights reserved.
//

#import "UIContactViewController.h"

@interface UIContactViewController ()

@end

@implementation UIContactViewController

- (IBAction) linkContact
{
    [[UIApplication sharedApplication]
     openURL:[NSURL URLWithString:@"https://sites.google.com/site/computing275g7/"]];
}

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

@end
