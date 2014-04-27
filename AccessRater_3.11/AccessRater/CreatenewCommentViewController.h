//
//  CreatenewCommentViewController.h
//  AccessRater
//
//  Created by MaxOu on 2013-11-28.
//  Copyright (c) 2013 AccessRaterTeam. All rights reserved.
//
static NSUInteger const MaximumCharacterCount = 600;

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "InfoViewController.h"
#import "CommentView.h"
#import "FavouriteViewController.h"

@interface CreatenewCommentViewController : UIViewController

@property (nonatomic,strong) NSNumber *LocationID;
@property (nonatomic, strong) IBOutlet UITextView *textView;
@property (nonatomic, strong) IBOutlet UILabel *characterCount;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *createNewCommentButton;
- (IBAction)cancelCreate:(id)sender;
- (IBAction)createNewComment:(id)sender;
@end
