//
//  CommentDetailViewController.m
//  AccessRater
//
//  Created by MaxOu on 2013-11-30.
//  Copyright (c) 2013 AccessRaterTeam. All rights reserved.
//

#import "CommentDetailViewController.h"

@interface CommentDetailViewController ()

@end

@implementation CommentDetailViewController
@synthesize titlelabel;
@synthesize subtitlelable;
//@synthesize commentDetaillabel;
@synthesize commentTextView;
@synthesize navbar;
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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.titlelabel.text= self.titlecontents;
    
    self.subtitlelable.text=self.subtitlecontents;
    
    self.commentTextView.text=self.commentDatil;
    //self.commentDetaillabel.text=self.commentDatil;//[LocationID stringValue];
    
    
    //[self.commentTextView reloadInputViews];
    
    
    
    
    //self.navbar.title=self.titlecontents;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
