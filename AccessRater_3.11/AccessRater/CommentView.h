//
//  CommentView.h
//  AccessRater
//
//  Created by Michael Lee on 2013-11-29.
//  Copyright (c) 2013 AccessRaterTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentView : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *tableData;
    NSMutableArray *subtitletableData;
    NSMutableArray *commentIDarray;
    
}
@property (nonatomic) double lat;
@property (nonatomic) double lon;
@property (nonatomic,strong) NSNumber *LocationID;
@property (weak, nonatomic) IBOutlet UITableView *table;

@property (nonatomic,retain) NSMutableArray *tableData;
@property (nonatomic,retain) NSMutableArray *subtitletableData;
@property (nonatomic,retain) NSMutableArray *commentIDarray;

@end
