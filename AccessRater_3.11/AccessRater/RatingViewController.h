//
//  FavouriteViewController.h
//  AccessRater
//
//  Created by Michael Lee on 11/30/13.
//  Copyright (c) 2013 AccessRaterTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoViewController.h"
#import "CommentView.h"
#import "FavouriteViewController.h"
@interface RatingViewController : UIViewController
@property (nonatomic,strong) NSNumber *LocationID;
@property (nonatomic,strong) NSString *info;
@property (nonatomic) BOOL flag;
- (IBAction)AddFavourite:(id)sender;

@end
