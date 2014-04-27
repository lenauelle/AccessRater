//
//  RegistedViewController.h
//  AccessRater
//
//  Created by Wei Xiang on 12/1/13.
//  Copyright (c) 2013 AccessRaterTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistedViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *loginUsernameField;
@property (weak, nonatomic) IBOutlet UITextField *loginPasswordField;

- (IBAction)loginButton:(id)sender;


@end
