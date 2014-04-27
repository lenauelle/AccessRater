//
//  HistoryViewController.h
//  AccessRater
//
//  Created by Rory O'Connor on 11/30/13.
//  Copyright (c) 2013 AccessRaterTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"
#import "InfoViewController.h"
#import "CommentView.h"
#import "RatingViewController.h"

@interface HistoryViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray  *historyData;
    NSMutableArray *data;
    NSMutableArray *locations;
    NSArray *address;
    //NSFileCoordinator *filePath;
    
}

@property (nonatomic,retain) NSMutableArray *historyData;
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (nonatomic) double lat;
@property (nonatomic) double lon;
@property (nonatomic,strong) NSNumber *LocationID;

@end

