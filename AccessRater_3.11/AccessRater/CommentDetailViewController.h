//
//  CommentDetailViewController.h
//  AccessRater
//
//  Created by MaxOu on 2013-11-30.
//  Copyright (c) 2013 AccessRaterTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentView.h"
#import "InfoViewController.h"
@interface CommentDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UINavigationItem *navbar;
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitlelable;
//@property (weak, nonatomic) IBOutlet UILabel *commentDetaillabel;
@property (weak, nonatomic) IBOutlet UITextView *commentTextView;
@property (strong, nonatomic) NSString *titlecontents;
@property (strong, nonatomic) NSString *subtitlecontents;
@property (strong, nonatomic) NSString *commentDatil;

@property (nonatomic,strong) NSNumber *LocationID;
@end
