//
//  InfoViewController.h
//  AccessRater
//
//  Created by MaxOu on 2013-11-28.
//  Copyright (c) 2013 AccessRaterTeam. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <Parse/Parse.h>
#import "MapViewController.h"
@interface InfoViewController : UIViewController{}


@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *addresslabel;
@property (weak, nonatomic) IBOutlet UILabel *idlabel;
//@property (weak, nonatomic) MKMapView *mapView;
//@property (weak, nonatomic) MKPlacemark *placemark;
@property (nonatomic) double lat;
@property (nonatomic) double lon;
@property (nonatomic,strong) NSNumber *LocationID;
@end