//
//  LoginViewController.m
//  AccessRater
//
//  Created by Wei Xiang on 12/1/13.
//  Copyright (c) 2013 AccessRaterTeam. All rights reserved.
//


#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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

- (void) viewDidAppear:(BOOL)animated{
    PFUser *user =[PFUser currentUser];
    if (user.username != nil) {
        [self performSegueWithIdentifier:@"login" sender:self];
        
    }
}



- (IBAction)registerAction:(id)sender {
    [_usernameField resignFirstResponder];
    [_emailField resignFirstResponder];
    [_passwordField resignFirstResponder];
    [_reEnterPasswordField resignFirstResponder];
    
    [self checkFieldsComplete];
    
}



//- (IBAction)loginButton:(id)sender {
//        [PFUser logInWithUsernameInBackground:_loginUsernameField.text password:_loginPasswordField.text block:^(PFUser *user, NSError *error) {
//            if (!error){
//              NSLog(@"Login user");
//            _loginPasswordField.text = nil;
//            _loginUsernameField.text =nil;
//            _usernameField.text = nil;
//            _usernameField.text= nil;
//            _passwordField.text = nil;
//            _reEnterPasswordField.text = nil;
//            _emailField.text = nil;


//            [self performSegueWithIdentifier:@"login" sender:self];
//          }
//        if (error) {
//           UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"oops" message:@"Sorry we had a problem to logging you in" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//           [alert show];
//       }
//   }];

//}

- (void) checkFieldsComplete {
    if ([_usernameField.text isEqualToString:@""] || [_emailField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""] || [_reEnterPasswordField.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"You need to complete all fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else {
        [self checkPasswordMatch];
        
    }
}

- (void) checkPasswordMatch{
    if (![_passwordField.text isEqualToString:_reEnterPasswordField.text]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"Passwords dont't match, please try again" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else {
        [self registerNewUser];
    }
}

- (void) registerNewUser {
    NSLog(@"registering...");
    PFUser *newUser =[PFUser user];
    newUser.username = _usernameField.text;
    newUser.email = _emailField.text;
    newUser.password = _passwordField.text;
    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@"Registration srccess!");
            
            _usernameField.text = nil;
            _passwordField.text = nil;
            _reEnterPasswordField.text = nil;
            _emailField.text = nil;
            
            [self performSegueWithIdentifier:@"login" sender:self];
        }
        else{
            NSLog(@"There was an error in registration");
        }
    }];
}

//- (IBAction)registedButton:(id)sender {
//    [UIView animateWithDuration:0.3 animations:^{
//        _loginOverlayView.frame = self.view.frame;
//    }];
//}
@end
