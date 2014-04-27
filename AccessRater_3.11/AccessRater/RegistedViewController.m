//
//  RegistedViewController.m
//  AccessRater
//
//  Created by Wei Xiang on 12/1/13.
//  Copyright (c) 2013 AccessRaterTeam. All rights reserved.
//

#import "RegistedViewController.h"

@interface RegistedViewController ()

@end

@implementation RegistedViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)loginButton:(id)sender {
    [_loginUsernameField resignFirstResponder];
    [_loginPasswordField resignFirstResponder];
    [PFUser logInWithUsernameInBackground:_loginUsernameField.text password:_loginPasswordField.text block:^(PFUser *user, NSError *error) {
        if (!error){
            NSLog(@"Login user");
            _loginPasswordField.text = nil;
            _loginUsernameField.text =nil;
            
            
            
            [self performSegueWithIdentifier:@"signin" sender:self];
        }
        if (error) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"Invalid Usernmame or Password, please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }];
}
@end
