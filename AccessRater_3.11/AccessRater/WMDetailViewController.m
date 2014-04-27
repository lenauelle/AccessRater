//
//  WMDetailViewController.m
//  WorldMap
//
//  Created by kishikawa katsumi on 2012/09/27.
//  Copyright (c) 2012 kishikawa katsumi. All rights reserved.
//

#import "WMDetailViewController.h"

@interface WMDetailViewController () <ADBannerViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *removePinLabel;
@property (weak, nonatomic) IBOutlet ADBannerView *bannerView;

@end

@implementation WMDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = NSLocalizedString(@"Info", nil);
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    _headerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _titleLabel.text = [NSString stringWithFormat:@"<%g/%g>", _placemark.coordinate.latitude, _placemark.coordinate.longitude];
    _addressTitleLabel.text = NSLocalizedString(@"Address", nil);
    NSArray *addressLines = [_placemark.addressDictionary objectForKey:@"FormattedAddressLines"];
    if (addressLines) {
        _addressLabel.text = [addressLines componentsJoinedByString:@", "];
    }
    else {
        _addressLabel.text = ABCreateStringWithAddressDictionary(_placemark.addressDictionary, YES);
    }
    
    _removePinLabel.text = NSLocalizedString(@"Add a new location", nil);
    
    _bannerView.hidden = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [self setHeaderView:nil];
    [self setTitleLabel:nil];
    [self setAddressLabel:nil];
    [self setAddressTitleLabel:nil];
    [self setRemovePinLabel:nil];
    [self setBannerView:nil];
    [super viewDidUnload];
}

#pragma mark -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        [_mapView removeAnnotation:_placemark];
        PFGeoPoint *geoPoint = [PFGeoPoint geoPointWithLatitude:_placemark.coordinate.latitude
                                                      longitude:_placemark.coordinate.longitude];
        
        
        NSString *tempAddr =[NSString stringWithFormat:@" "];
        
        NSArray *aaddressLines = [_placemark.addressDictionary objectForKey:@"FormattedAddressLines"];
        if (aaddressLines) {
            tempAddr = [aaddressLines componentsJoinedByString:@", "];
        }
        else {
            tempAddr = ABCreateStringWithAddressDictionary(_placemark.addressDictionary, YES);
        }
        
        
        PFQuery *query = [PFQuery queryWithClassName:@"Location"];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                NSLog(@"there are %d items",objects.count);
                [query whereKey:@"info" equalTo:tempAddr];
                
                [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
                    if (!object) {
                        NSLog(@"The getFirstObject request failed.");
                        PFObject *objectT = [PFObject objectWithClassName:@"Location"];
                        [objectT setObject:geoPoint forKey:@"location"];
                        [objectT setObject:tempAddr forKey:@"info"];
                        NSNumber *it= [NSNumber numberWithInteger:objects.count+1];
                        [objectT setObject:it forKey:@"PlaceID"];
                        [objectT saveInBackground];
                        
                        
                    } else {
                        // The find succeeded.
                        NSLog(@"Successfully retrieved the object.");
                        // UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notice" message:@"Location is already exixt" delegate:self cancelButtonTitle:@"CANCEL" otherButtonTitles:@"Yes", nil];
                        
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notice" message:@"Location already exists" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        [alert show];
                    }
                }];
            }
        }];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark -

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    banner.hidden = YES;
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    banner.hidden = YES;
}

@end
