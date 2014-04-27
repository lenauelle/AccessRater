//
//  MapViewController.h
//  AccessRater
//
//  Created by Max Ou on 10/28/13.
//  Copyright (c) 2013 AccessRaterTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoViewController.h"
#import "CommentView.h"
#import "RatingViewController.h"

@interface MapViewController : UIViewController <MKMapViewDelegate>{
    
    MKMapView *_mapView;
    // UIButt
}
@property(nonatomic,retain) MKMapView *mapView;
- (IBAction)backButton:(id)sender;
@end
