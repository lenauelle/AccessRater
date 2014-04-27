//
//  AddPhotoViewController.h
//  AccessRater
//
//  Created by Jingya Huang on 10/31/13.
//  Copyright (c) 2013 AccessRaterTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPhotoLibraryViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIImage *chosenImage;
@property (strong, nonatomic) UIImagePickerController *imagePicker;

@end
