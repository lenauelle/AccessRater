//
//  PhotoViewController.m
//  AccessRater
//
//  Created by Jingya Huang on 10/31/13.
//  Copyright (c) 2013 AccessRaterTeam. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController
@synthesize PhotoB1;

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

- (IBAction)PhotoChange:(UIPageControl *)sender
{
    PhotoB1.image = [UIImage imageNamed:[NSString stringWithFormat:@"B1Photo%d.jpg", sender.currentPage + 1]];
}
@end
