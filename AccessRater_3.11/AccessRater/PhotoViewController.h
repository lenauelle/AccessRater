//
//  PhotoViewController.h
//  AccessRater
//
//  Created by Jingya Huang on 10/31/13.
//  Copyright (c) 2013 AccessRaterTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController 

@property (strong, nonatomic) IBOutlet UIImageView *PhotoB1;

- (IBAction)PhotoChange:(UIPageControl *)sender;

@end
