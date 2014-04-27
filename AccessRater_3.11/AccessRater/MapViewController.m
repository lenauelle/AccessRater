//
//  MapViewController.m
//  AccessRater
//
//  Created by Max Ou on 10/28/13.
//  Copyright (c) 2013 AccessRaterTeam. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController{
    // GMSMapView *mapView_;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    MKPinAnnotationView *pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"pinView"];
    if (!pinView) {
        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pinView"];
        pinView.pinColor = MKPinAnnotationColorPurple;
        pinView.animatesDrop = YES;
        pinView.canShowCallout = YES;
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        pinView.rightCalloutAccessoryView = rightButton;
    } else {
        pinView.annotation = annotation;
    }
    return pinView;
}
-(void) addtohistory:(NSString*) info:(NSNumber*) LocationID{
    PFQuery *query =[PFQuery queryWithClassName:@"History"];
    PFUser *user = [PFUser currentUser];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            PFObject *newfavourite = [PFObject objectWithClassName:@"History"];
            [newfavourite setObject:LocationID forKey:@"LocationID"];
            [newfavourite setObject:info forKey:@"Info"];
            [newfavourite setObject:user forKey:@"user"];
            [newfavourite saveInBackground];
            NSLog(@"successfully add to history");
            
        }
        else {
            //NSLog(@"Couldn't save!");
            //NSLog(@"Could not save: %@", error);
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[[error userInfo] objectForKey:@"error"] message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [alertView show];
            return;
            
            
        }
    }];
}
//jump to the next secne
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"toTheInfo"]) {
        //NSString *tittle = @"sfu";
        UITabBarController*control =segue.destinationViewController;
        InfoViewController *dc =[[InfoViewController alloc] init];
        dc = (InfoViewController *)[[control customizableViewControllers] objectAtIndex:1];
        CommentView *comment = [[CommentView alloc] init];
        comment = (CommentView *)[[control customizableViewControllers] objectAtIndex:3];
        RatingViewController *favourite =[[RatingViewController alloc]init];
        favourite = (RatingViewController *)[[control customizableViewControllers] objectAtIndex:2];
        //InfoViewController *info = control;
        //  dc.mapView = _mapView;
        // dc.placemark = [sender annotation];
        MKPlacemark *mark=[sender annotation];
        double lat =(double)mark.coordinate.latitude;
        double lon =(double)mark.coordinate.longitude;
        
        //PASS ID
        PFQuery *query =[PFQuery queryWithClassName:@"Location"];
        
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                //  NSLog(@"there are %d items",objects.count);
                for (int x =0; x<objects.count; x++) {
                    //  NSString *title = objects[x][@"info"];
                    PFGeoPoint *num = objects[x][@"location"];
                    NSString *info =objects[x][@"info"];
                    //if (num.longitude==_placemark.coordinate.longitude&&num.latitude==_placemark.coordinate.latitude)
                    if (num.longitude==lon&&num.latitude==lat)
                    {
                        
                        NSNumber *id1= objects[x][@"PlaceID"];
                        comment.LocationID=id1;
                        dc.LocationID=id1;
                        favourite.LocationID=id1;
                        favourite.info=info;
                        ////////////////////////////////////////////////////////////////////////////////////////////////////
                        PFUser *thisUser = [PFUser currentUser];
                        NSMutableArray *theLocations;
                        //query returning History objects with currentUser identifier
                        PFQuery *updateHistoryQuery =[PFQuery queryWithClassName:@"History"];
                        [updateHistoryQuery whereKey:@"user" equalTo:thisUser];
                        NSInteger count = (long)updateHistoryQuery.countObjects;
                        NSLog(@"Count of query objects %ld", (long)count);
                        NSLog(@"Number of query results %ld",(long)query.countObjects);
                        
                        if(count == 0)
                        {
                            PFObject *temp = [PFObject objectWithClassName:@"History"];
                            temp[@"user"] = thisUser;
                            [temp saveInBackground];
                        }
                        
                        
                        
                        //store query results
                        NSArray *history = [updateHistoryQuery findObjects];
                        NSLog(@"Printing history: %@", history);
                        for(PFObject *objects in history)
                        {
                            //set location array with the locationId values in the result set
                            theLocations = [[NSMutableArray alloc] initWithArray:[objects objectForKey:@"locationIdArray"]];
                            NSLog(@"Printing location ids: %@", theLocations);
                            if(theLocations.count<10)
                            {
                                for(int i = theLocations.count; i >0; i--)
                                {
                                    theLocations[i] = theLocations[i-1];
                                }
                                theLocations[0]= dc.LocationID;
                                
                            }else{
                                for(int i = 9; i>0; i--)
                                {
                                    theLocations[i] = theLocations[i-1];
                                }
                                theLocations[0] = dc.LocationID;
                            }
                            NSLog(@"Printing new location history: %@", theLocations);
                            objects[@"locationIdArray"] = theLocations;
                            [objects saveInBackground];
                            
                            
                            
                        }
                        ////////////////////////////////////////////////////////////////////////////////////////////////////
                        
                    }
                }
            }
        }];
        
        
        
        
        
        //dc.lat=lat;
        //dc.lon=lon;
        //comment.lat=lat;
        //comment.lon=lon;
        //control.address = tittle;
    }
}
- (void)applyMapViewMemoryHotFix{
    
    switch (self.mapView.mapType) {
        case MKMapTypeHybrid:
        {
            self.mapView.mapType = MKMapTypeStandard;
        }
            
            break;
        case MKMapTypeStandard:
        {
            self.mapView.mapType = MKMapTypeHybrid;
        }
            
            break;
        default:
            break;
    }
    
    [self.mapView removeFromSuperview];
    self.mapView = nil;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    //[self performSegueWithIdentifier:@"toTheInfo" sender:self];
    
    [self performSegueWithIdentifier:@"toTheInfo" sender:view];
    //[_mapView removeAnnotations:_mapView.annotations];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Create a GMSCameraPosition that tells the map to display the
    
    
    
    //stup the rectangular shap for the map
    _mapView=[[MKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];//10, 100, 300, 100//upDown, LeftRight, with, high
    _mapView.scrollEnabled=YES;
    [_mapView setDelegate:self];
    
    //setup the initial display ceter coordinate and zoom level
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 49.279341f;
    coordinate.longitude = -122.915407f;
    //zoom level
    MKCoordinateRegion region;
    region.span.latitudeDelta = 0.4;
    region.span.longitudeDelta = 0.4;
    region.center = coordinate;
    
    [_mapView setRegion:region animated:YES];
    
    [_mapView regionThatFits:region];
    /*
     //add markers
     MKPointAnnotation *ann = [[MKPointAnnotation alloc] init];
     ann.coordinate = coordinate;
     [ann setTitle:@"SFU"];
     [ann setSubtitle:@"Burnaby Campus"];
     
     
     MKPointAnnotation *ann1 = [[MKPointAnnotation alloc] init];
     coordinate.latitude=49.187671f;
     coordinate.longitude =-122.849498f;
     ann1.coordinate = coordinate;
     [ann1 setTitle:@"SFU"];
     [ann1 setSubtitle:@"Surrey Campus"];
     
     MKPointAnnotation *ann2 = [[MKPointAnnotation alloc] init];
     coordinate.latitude=49.284567f;
     coordinate.longitude =-123.114856f;
     ann2.coordinate = coordinate;
     [ann2 setTitle:@"SFU"];
     [ann2 setSubtitle:@"Vancouver Campus"];
     
     
     //add markers on the map
     [_mapView addAnnotation:ann];
     [_mapView addAnnotation:ann1];
     [_mapView addAnnotation:ann2];
     */
    
    //add markers from database(parse)
    PFQuery *query =[PFQuery queryWithClassName:@"Location"];
    
    //[query whereKey:@"info" equalTo:@"SFU"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // NSLog(@"there are %d items",objects.count);
            for (int x =0; x<objects.count; x++) {
                NSString *title = objects[x][@"info"];
                PFGeoPoint *num = objects[x][@"location"];
                CLLocationCoordinate2D corrdinate;
                corrdinate.latitude=num.latitude;
                corrdinate.longitude=num.longitude;
                
                MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
                
                [annotation setCoordinate:corrdinate];
                [annotation setTitle:title];
                [annotation setSubtitle:@""];
                
                //NSLog(@"this is %@,lat is %f",title,num.latitude);
                //[self.mapView1 removeAnnotations:self.mapView1.annotations];
                [_mapView addAnnotation:annotation];
                [_mapView setRegion:region animated:YES];
                
                
            }
        }
    }];
    
    //put the map into view
    [self.view addSubview:_mapView];
    
    [super viewDidLoad];
    
}

- (void)purgeMapMemory
{
    // Switching map types causes cache purging, so switch to a different map type
    self.mapView.mapType = MKMapTypeStandard;
    [self.mapView removeFromSuperview];
    self.mapView = nil;
}
- (IBAction)backButton:(id)sender {
    [_mapView removeAnnotations:_mapView.annotations];
    [self purgeMapMemory];
}
-(void) viewDidDisappear:(BOOL)animated
{
    [self purgeMapMemory];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [_mapView removeAnnotations:_mapView.annotations];
}

@end
