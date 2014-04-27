//
//  AddRatingViewController.m
//  AccessRater
//
//  Created by Jingya Huang on 13-11-10.
//  Copyright (c) 2013 AccessRaterTeam. All rights reserved.
//

#import "AddRatingViewController.h"

@interface AddRatingViewController ()

@end

@implementation AddRatingViewController

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
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //Scroll view settings
    [AddRatingScroll setScrollEnabled:YES];
    [AddRatingScroll setContentSize:CGSizeMake(320, 4000)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Segmented Control
//SIGNAGE/LIGHTING
- (IBAction)signage0:(id)sender
{
    switch (signageController0.selectedSegmentIndex) {
        case 0:
            ratingValues[0] = 1;
            break;
        case 1:
            ratingValues[0] = 2;
            break;
        case 2:
            ratingValues[0] = 3;
            break;
        case 3:
            ratingValues[0] = 4;
            break;
        case 4:
            ratingValues[0] = 5;
            break;
        default:
            break;
    }
}
- (IBAction)signage1:(id)sender
{
    if (signageController1.selectedSegmentIndex == 0) {
        ratingDetails[0] = 'y';
    }
    else {
        ratingDetails[0] = 'n';
    }
}
- (IBAction)signage2:(id)sender
{
    if (signageController2.selectedSegmentIndex == 0) {
        ratingDetails[1] = 'y';
    }
    else {
        ratingDetails[1] = 'n';
    }
}
- (IBAction)signage3:(id)sender
{
    if (signageController3.selectedSegmentIndex == 0) {
        ratingDetails[2] = 'y';
    }
    else {
        ratingDetails[2] = 'n';
    }
}

//PARKING
- (IBAction)parking0:(id)sender
{
    switch (parkingController0.selectedSegmentIndex) {
        case 0:
            ratingValues[1] = 1;
            break;
        case 1:
            ratingValues[1] = 2;
            break;
        case 2:
            ratingValues[1] = 3;
            break;
        case 3:
            ratingValues[1] = 4;
            break;
        case 4:
            ratingValues[1] = 5;
            break;
        default:
            break;
    }
}
- (IBAction)parking1:(id)sender
{
    if (parkingController1.selectedSegmentIndex == 0) {
        ratingDetails[3] = 'y';
    }
    else {
        ratingDetails[3] = 'n';
    }
}
- (IBAction)parking2:(id)sender
{
    if (parkingController2.selectedSegmentIndex == 0) {
        ratingDetails[4] = 'y';
    }
    else {
        ratingDetails[4] = 'n';
    }
}
- (IBAction)parking3:(id)sender
{
    if (parkingController3.selectedSegmentIndex == 0) {
        ratingDetails[5] = 'y';
    }
    else {
        ratingDetails[5] = 'n';
    }
}
- (IBAction)parking4:(id)sender
{
    if (parkingController4.selectedSegmentIndex == 0) {
        ratingDetails[6] = 'y';
    }
    else {
        ratingDetails[6] = 'n';
    }
}

//EXTERIOR ACCESS
- (IBAction)exterior0:(id)sender
{
    switch (exteriorAccessController0.selectedSegmentIndex) {
        case 0:
            ratingValues[2] = 1;
            break;
        case 1:
            ratingValues[2] = 2;
            break;
        case 2:
            ratingValues[2] = 3;
            break;
        case 3:
            ratingValues[2] = 4;
            break;
        case 4:
            ratingValues[2] = 5;
            break;
        default:
            break;
    }
}
- (IBAction)exterior1:(id)sender
{
    if (exteriorAccessController1.selectedSegmentIndex == 0) {
        ratingDetails[7] = 'y';
    }
    else {
        ratingDetails[7] = 'n';
    }
}
- (IBAction)exterior2:(id)sender
{
    if (exteriorAccessController2.selectedSegmentIndex == 0) {
        ratingDetails[8] = 'y';
    }
    else {
        ratingDetails[8] = 'n';
    }
}

//DOORS
- (IBAction)doors0:(id)sender
{
    switch (doorsController0.selectedSegmentIndex) {
        case 0:
            ratingValues[3] = 1;
            break;
        case 1:
            ratingValues[3] = 2;
            break;
        case 2:
            ratingValues[3] = 3;
            break;
        case 3:
            ratingValues[3] = 4;
            break;
        case 4:
            ratingValues[3] = 5;
            break;
        default:
            break;
    }
}
- (IBAction)doors1:(id)sender
{
    if (doorsController1.selectedSegmentIndex == 0) {
        ratingDetails[9] = 'y';
    }
    else {
        ratingDetails[9] = 'n';
    }
}
- (IBAction)doors2:(id)sender
{
    if (doorsController2.selectedSegmentIndex == 0) {
        ratingDetails[10] = 'y';
    }
    else {
        ratingDetails[10] = 'n';
    }
}
- (IBAction)doors3:(id)sender
{
    if (doorsController3.selectedSegmentIndex == 0) {
        ratingDetails[11] = 'y';
    }
    else {
        ratingDetails[11] = 'n';
    }
}
- (IBAction)doors4:(id)sender
{
    if (doorsController4.selectedSegmentIndex == 0) {
        ratingDetails[12] = 'y';
    }
    else {
        ratingDetails[12] = 'n';
    }
}
- (IBAction)doors5:(id)sender
{
    if (doorsController5.selectedSegmentIndex == 0) {
        ratingDetails[13] = 'y';
    }
    else {
        ratingDetails[13] = 'n';
    }
}

//ELEVATOR
- (IBAction)elevator0:(id)sender
{
    switch (elevatorController0.selectedSegmentIndex) {
        case 0:
            ratingValues[4] = 1;
            break;
        case 1:
            ratingValues[4] = 2;
            break;
        case 2:
            ratingValues[4] = 3;
            break;
        case 3:
            ratingValues[4] = 4;
            break;
        case 4:
            ratingValues[4] = 5;
            break;
        default:
            break;
    }
}
- (IBAction)elevator1:(id)sender
{
    if (elevatorController1.selectedSegmentIndex == 0) {
        ratingDetails[14] = 'y';
    }
    else {
        ratingDetails[14] = 'n';
    }
}
- (IBAction)elevator2:(id)sender
{
    if (elevatorController2.selectedSegmentIndex == 0) {
        ratingDetails[15] = 'y';
    }
    else {
        ratingDetails[15] = 'n';
    }
}
- (IBAction)elevator3:(id)sender
{
    if (elevatorController3.selectedSegmentIndex == 0) {
        ratingDetails[16] = 'y';
    }
    else {
        ratingDetails[16] = 'n';
    }
}
- (IBAction)elevator4:(id)sender
{
    if (elevatorController4.selectedSegmentIndex == 0) {
        ratingDetails[17] = 'y';
    }
    else {
        ratingDetails[17] = 'n';
    }
}
- (IBAction)elevator5:(id)sender
{
    if (elevatorController5.selectedSegmentIndex == 0) {
        ratingDetails[18] = 'y';
    }
    else {
        ratingDetails[18] = 'n';
    }
}
- (IBAction)elevator6:(id)sender
{
    if (elevatorController6.selectedSegmentIndex == 0) {
        ratingDetails[19] = 'y';
    }
    else {
        ratingDetails[19] = 'n';
    }
}
- (IBAction)elevator7:(id)sender
{
    if (elevatorController7.selectedSegmentIndex == 0) {
        ratingDetails[20] = 'y';
    }
    else {
        ratingDetails[20] = 'n';
    }
}

//STAIRS/RAMPS
- (IBAction)stairs0:(id)sender
{
    switch (stairsController0.selectedSegmentIndex) {
        case 0:
            ratingValues[5] = 1;
            break;
        case 1:
            ratingValues[5] = 2;
            break;
        case 2:
            ratingValues[5] = 3;
            break;
        case 3:
            ratingValues[5] = 4;
            break;
        case 4:
            ratingValues[5] = 5;
            break;
        default:
            break;
    }
}
- (IBAction)stairs2:(id)sender
{
    if (stairsController2.selectedSegmentIndex == 0) {
        ratingDetails[21] = 'y';
    }
    else {
        ratingDetails[21] = 'n';
    }
}
- (IBAction)stairs3:(id)sender
{
    if (stairsController3.selectedSegmentIndex == 0) {
        ratingDetails[22] = 'y';
    }
    else {
        ratingDetails[22] = 'n';
    }
}
- (IBAction)stairs4:(id)sender
{
    if (stairsController4.selectedSegmentIndex == 0) {
        ratingDetails[23] = 'y';
    }
    else {
        ratingDetails[23] = 'n';
    }
}
- (IBAction)stairs5:(id)sender
{
    if (stairsController5.selectedSegmentIndex == 0) {
        ratingDetails[24] = 'y';
    }
    else {
        ratingDetails[24] = 'n';
    }
}

//WASHROOMS
- (IBAction)washrooms0:(id)sender
{
    switch (washroomsController0.selectedSegmentIndex) {
        case 0:
            ratingValues[6] = 1;
            break;
        case 1:
            ratingValues[6] = 2;
            break;
        case 2:
            ratingValues[6] = 3;
            break;
        case 3:
            ratingValues[6] = 4;
            break;
        case 4:
            ratingValues[6] = 5;
            break;
        default:
            break;
    }
}
- (IBAction)washrooms1:(id)sender
{
    if (washroomsController1.selectedSegmentIndex == 0) {
        ratingDetails[25] = 'y';
    }
    else {
        ratingDetails[25] = 'n';
    }
}
- (IBAction)washrooms2:(id)sender
{
    if (washroomsController2.selectedSegmentIndex == 0) {
        ratingDetails[26] = 'y';
    }
    else {
        ratingDetails[26] = 'n';
    }
}
- (IBAction)washrooms3:(id)sender
{
    if (washroomsController3.selectedSegmentIndex == 0) {
        ratingDetails[27] = 'y';
    }
    else {
        ratingDetails[27] = 'n';
    }
}
- (IBAction)washrooms4:(id)sender
{
    if (washroomsController4.selectedSegmentIndex == 0) {
        ratingDetails[28] = 'y';
    }
    else {
        ratingDetails[28] = 'n';
    }
}
- (IBAction)washrooms5:(id)sender
{
    if (washroomsController5.selectedSegmentIndex == 0) {
        ratingDetails[29] = 'y';
    }
    else {
        ratingDetails[29] = 'n';
    }
}
- (IBAction)washrooms6:(id)sender
{
    if (washroomsController6.selectedSegmentIndex == 0) {
        ratingDetails[30] = 'y';
    }
    else {
        ratingDetails[30] = 'n';
    }
}
- (IBAction)washrooms7:(id)sender
{
    if (washroomsController7.selectedSegmentIndex == 0) {
        ratingDetails[31] = 'y';
    }
    else {
        ratingDetails[31] = 'n';
    }
}


@end
