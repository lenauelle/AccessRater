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
#import "RatingViewController.h"

@interface FavouriteViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *tableData;
    NSMutableArray *subtitletableData;
    
}

@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property (nonatomic,retain) NSMutableArray *tableData;

@end
