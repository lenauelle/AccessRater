//
//  AddRatingViewController.h
//  AccessRater
//
//  Created by Jingya Huang on 13-11-10.
//  Copyright (c) 2013 AccessRaterTeam. All rights reserved.
//

//TODO: + N/A segment

#import <UIKit/UIKit.h>

@interface AddRatingViewController : UIViewController
{
    IBOutlet UIScrollView *AddRatingScroll; //Scroll
    //Value Storage
    int ratingValues[7];
    char ratingDetails[32];
    //SIGNAGE/LIGHTING
    IBOutlet UISegmentedControl *signageController0;//rating
    IBOutlet UISegmentedControl *signageController1;//statement 1
    IBOutlet UISegmentedControl *signageController2;//statement 2
    IBOutlet UISegmentedControl *signageController3;//statement 3
    //PARKING
    IBOutlet UISegmentedControl *parkingController0;
    IBOutlet UISegmentedControl *parkingController1;
    IBOutlet UISegmentedControl *parkingController2;
    IBOutlet UISegmentedControl *parkingController3;
    IBOutlet UISegmentedControl *parkingController4;
    //EXTERIOR ACCESS
    IBOutlet UISegmentedControl *exteriorAccessController0;
    IBOutlet UISegmentedControl *exteriorAccessController1;
    IBOutlet UISegmentedControl *exteriorAccessController2;
    //DOORS
    IBOutlet UISegmentedControl *doorsController0;
    IBOutlet UISegmentedControl *doorsController1;
    IBOutlet UISegmentedControl *doorsController2;
    IBOutlet UISegmentedControl *doorsController3;
    IBOutlet UISegmentedControl *doorsController4;
    IBOutlet UISegmentedControl *doorsController5;
    //ELEVATOR
    IBOutlet UISegmentedControl *elevatorController0;
    IBOutlet UISegmentedControl *elevatorController1;
    IBOutlet UISegmentedControl *elevatorController2;
    IBOutlet UISegmentedControl *elevatorController3;
    IBOutlet UISegmentedControl *elevatorController4;
    IBOutlet UISegmentedControl *elevatorController5;
    IBOutlet UISegmentedControl *elevatorController6;
    IBOutlet UISegmentedControl *elevatorController7;
    //STAIRS/RAMPS
    IBOutlet UISegmentedControl *stairsController0;
    //IBOutlet UISegmentedControl *stairsController1;
    IBOutlet UISegmentedControl *stairsController2;
    IBOutlet UISegmentedControl *stairsController3;
    IBOutlet UISegmentedControl *stairsController4;
    IBOutlet UISegmentedControl *stairsController5;
    //WASHROOMS
    IBOutlet UISegmentedControl *washroomsController0;
    IBOutlet UISegmentedControl *washroomsController1;
    IBOutlet UISegmentedControl *washroomsController2;
    IBOutlet UISegmentedControl *washroomsController3;
    IBOutlet UISegmentedControl *washroomsController4;
    IBOutlet UISegmentedControl *washroomsController5;
    IBOutlet UISegmentedControl *washroomsController6;
    IBOutlet UISegmentedControl *washroomsController7;
    
}

//SIGNAGE/LIGHTING
- (IBAction)signage0:(id)sender; //rating
- (IBAction)signage1:(id)sender; //statement 1
- (IBAction)signage2:(id)sender; //statement 2
- (IBAction)signage3:(id)sender; //statement 3
//PARKING
- (IBAction)parking0:(id)sender;
- (IBAction)parking1:(id)sender;
- (IBAction)parking2:(id)sender;
- (IBAction)parking3:(id)sender;
- (IBAction)parking4:(id)sender;
//EXTERIOR ACCESS
- (IBAction)exterior0:(id)sender;
- (IBAction)exterior1:(id)sender;
- (IBAction)exterior2:(id)sender;
//DOORS
- (IBAction)doors0:(id)sender;
- (IBAction)doors1:(id)sender;
- (IBAction)doors2:(id)sender;
- (IBAction)doors3:(id)sender;
- (IBAction)doors4:(id)sender;
- (IBAction)doors5:(id)sender;
//ELEVATOR
- (IBAction)elevator0:(id)sender;
- (IBAction)elevator1:(id)sender;
- (IBAction)elevator2:(id)sender;
- (IBAction)elevator3:(id)sender;
- (IBAction)elevator4:(id)sender;
- (IBAction)elevator5:(id)sender;
- (IBAction)elevator6:(id)sender;
- (IBAction)elevator7:(id)sender;
//STAIRS/RAMPS
- (IBAction)stairs0:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *stairsNumber;
//- (IBAction)stairs1:(id)sender;
- (IBAction)stairs2:(id)sender;
- (IBAction)stairs3:(id)sender;
- (IBAction)stairs4:(id)sender;
- (IBAction)stairs5:(id)sender;
//WASHROOMS
- (IBAction)washrooms0:(id)sender;
- (IBAction)washrooms1:(id)sender;
- (IBAction)washrooms2:(id)sender;
- (IBAction)washrooms3:(id)sender;
- (IBAction)washrooms4:(id)sender;
- (IBAction)washrooms5:(id)sender;
- (IBAction)washrooms6:(id)sender;
- (IBAction)washrooms7:(id)sender;

@end
