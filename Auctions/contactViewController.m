//
//  contactViewController.m
//  Auctions
//
//  Created by Blake Mabe on 3/5/15.
//  Copyright (c) 2015 QuantumWareApps. All rights reserved.
//

#import "contactViewController.h"
#import <Parse/Parse.h>
@import MapKit;

@interface contactViewController ()

@end

@implementation contactViewController
@synthesize addbutton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    addbutton.titleLabel.numberOfLines = 2;
    [addbutton.titleLabel setTextAlignment:NSTextAlignmentCenter];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)call:(id)sender
{
    //Call GVA
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:5404344260"]];
}

- (IBAction)logout:(id)sender
{
    //Logout User
    [PFUser logOut];
    
    //Return to Main Page
    [self performSegueWithIdentifier:@"return" sender:self];
}

- (IBAction)addy:(id)sender
{
    Class mapItemClass = [MKMapItem class];
    if (mapItemClass && [mapItemClass respondsToSelector:@selector(openMapsWithItems:launchOptions:)])
    {
        // Create an MKMapItem to pass to the Maps app
        CLLocationCoordinate2D coordinate =
        CLLocationCoordinate2DMake(38.352405, -78.899616);
        MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coordinate
                                                       addressDictionary:nil];
        MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
        [mapItem setName:@"Green Valley Auctions"];
        // Pass the map item to the Maps app
        [mapItem openInMapsWithLaunchOptions:nil];
    }
    
}
@end
