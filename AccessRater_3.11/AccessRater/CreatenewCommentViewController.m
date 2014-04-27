//
//  CreatenewCommentViewController.m
//  AccessRater
//
//  Created by MaxOu on 2013-11-28.
//  Copyright (c) 2013 AccessRaterTeam. All rights reserved.
//

#import "CreatenewCommentViewController.h"
#import "CommentView.h"


@interface CreatenewCommentViewController ()
- (void)updateCharacterCount:(UITextView *)aTextView;
- (BOOL)checkCharacterCount:(UITextView *)aTextView;
- (void)textInputChanged:(NSNotification *)note;


@end

@implementation CreatenewCommentViewController

@synthesize LocationID;
@synthesize createNewCommentButton;
@synthesize textView;
@synthesize characterCount;

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
    
    // Do any additional setup after loading the view from its nib.
	
	self.characterCount = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 154.0f, 21.0f)];
	//self.characterCount.backgroundColor = [UIColor clearColor];
	//self.characterCount.textColor = [UIColor whiteColor];
	//self.characterCount.shadowColor = [UIColor colorWithWhite:0.0f alpha:0.7f];
    self.characterCount.backgroundColor = [UIColor whiteColor];
	self.characterCount.textColor = [UIColor blackColor];
	self.characterCount.shadowColor = [UIColor colorWithWhite:0.0f alpha:0.7f];
	self.characterCount.shadowOffset = CGSizeMake(0.0f, -1.0f);
	self.characterCount.text = @"0/600";
    
	[self.textView setInputAccessoryView:self.characterCount];
    
	[self updateCharacterCount:textView];
	[self checkCharacterCount:textView];
    
	// Show the keyboard/accept input.
	[textView becomeFirstResponder];
    
    //NSLog(@"%f and %f", lat, lon);
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{    PFUser *user = [PFUser currentUser];
    // NSString *userName = user[@"username"];
    // NSLog(@"%@", userName);
    // send LocationID
    UITabBarController *newvc = [segue destinationViewController];
    //newvc.LocationID=LocationID;
    InfoViewController *dc =[[InfoViewController alloc] init];
    dc = (InfoViewController *)[[newvc customizableViewControllers] objectAtIndex:1];
    dc.LocationID =LocationID;
    CommentView *comment = [[CommentView alloc] init];
    comment = (CommentView *)[[newvc customizableViewControllers] objectAtIndex:3];
    comment.LocationID=LocationID;
    if ([segue.identifier isEqualToString:@"DoneComment"]) {
        //NSLog(@"done comment");
        PFQuery *query =[PFQuery queryWithClassName:@"Comments"];
        
        //[query whereKey:@"LocationID" equalTo:LocationID];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                NSLog(@"there are %@ items",textView.text);
                
                
                PFObject *newcomment = [PFObject objectWithClassName:@"Comments"];
                [newcomment setObject:textView.text forKey:@"Content"];
                [newcomment setObject:LocationID forKey:@"LocationID"];
                NSNumber *cid= [NSNumber numberWithInteger:objects.count+1];
                [newcomment setObject:cid forKey:@"CommentID"];
                [newcomment setObject:user forKey:@"user"];
                [newcomment saveInBackground];
                
                
            }
            else {
                NSLog(@"Couldn't save!");
                NSLog(@"%@", error);
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[[error userInfo] objectForKey:@"error"] message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                [alertView show];
                return;
                
                
            }
        }];
    }
    
    
}

- (IBAction)cancelCreate:(id)sender {
    
    
    
}

- (IBAction)createNewComment:(id)sender {
    
    NSLog(@"sdfwefwefdwf%@ ",textView.text);
    
}


#pragma mark UITextView notification methods

- (void)textInputChanged:(NSNotification *)note {
	// Listen to the current text field and count characters.
	UITextView *localTextView = [note object];
	[self updateCharacterCount:localTextView];
	[self checkCharacterCount:localTextView];
}

#pragma mark Private helper methods

- (void)updateCharacterCount:(UITextView *)aTextView {
	NSUInteger count = aTextView.text.length;
	self.characterCount.text = [NSString stringWithFormat:@"%i/600", count];
	if (count > MaximumCharacterCount || count == 0) {
		self.characterCount.font = [UIFont boldSystemFontOfSize:self.characterCount.font.pointSize];
	} else {
		self.characterCount.font = [UIFont systemFontOfSize:self.characterCount.font.pointSize];
	}
}

- (BOOL)checkCharacterCount:(UITextView *)aTextView {
	NSUInteger count = aTextView.text.length;
	if (count > MaximumCharacterCount || count == 0) {
		createNewCommentButton.enabled = NO;
		return NO;
	} else {
		createNewCommentButton.enabled = YES;
		return YES;
	}
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
