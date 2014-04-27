//
//  AddPhotoCameraViewController.h
//  AccessRater
//
//  Created by Jingya Huang on 13-11-7.
//  Copyright (c) 2013 AccessRaterTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AddPhotoCameraViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)takeImage:(id)sender;

@end
