//
//  AuctionDetailViewController.m
//  Auctions
//
//  Created by Blake Mabe on 3/5/15.
//  Copyright (c) 2015 QuantumWareApps. All rights reserved.
//

#import "AuctionDetailViewController.h"
#import <Parse/Parse.h>
#import "Auction.h"
#import "WebsiteViewController.h"
#import <sys/sysctl.h>

@interface AuctionDetailViewController ()

@end

@implementation AuctionDetailViewController

@synthesize name;
@synthesize date;
@synthesize auction;
@synthesize button;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [name setNumberOfLines:3];
    [date setNumberOfLines: 3];
    self.name.text = auction.name;
    self.date.text = auction.date;
    
    //Changes font based on device
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    NSLog(platform);
    
    if ([platform isEqualToString:@"iPhone4,1"])
    {
        self.button.titleLabel.font = [UIFont  fontWithName:@"Helvetica Neue-Helvetica 25 Ultra Light" size:30];
        self.button2.titleLabel.font = [UIFont  fontWithName:@"Helvetica Neue-Helvetica 25 Ultra Light" size:30];
        self.button3.titleLabel.font = [UIFont  fontWithName:@"Helvetica Neue-Helvetica 25 Ultra Light" size:30];
    }
    if (([platform isEqualToString:@"iPhone5,1"]) || ([platform isEqualToString:@"iPhone5,2"]) || ([platform isEqualToString:@"iPhone5,3"]) || ([platform isEqualToString:@"iPhone5,4"]) || ([platform isEqualToString:@"iPhone6,1"]) || ([platform isEqualToString:@"iPhone6,2"]))
    {
        self.button.titleLabel.font = [UIFont  fontWithName:@"Helvetica Neue-Helvetica 25 Ultra Light" size:30];
        self.button2.titleLabel.font = [UIFont  fontWithName:@"Helvetica Neue-Helvetica 25 Ultra Light" size:30];
        self.button3.titleLabel.font = [UIFont  fontWithName:@"Helvetica Neue-Helvetica 25 Ultra Light" size:30];
    }
    
    //Hides website button if no website
    if ([auction.web  isEqual: @""])
    {
        button.hidden = true;
    }
}

- (void)viewDidUnload
{
    [self setDate:nil];
    [self setName:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showWebsite"])
    {
        WebsiteViewController *destViewController = segue.destinationViewController;
        destViewController.auction = auction;
    }
}

- (IBAction)goWeb:(id)sender
{
     [self performSegueWithIdentifier:@"showWebsite" sender:self];
}

- (IBAction)RegAuction:(id)sender
{
    int lowerBound = 500;
    int upperBound = 600;
    int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);
    
    NSString* myString = [@(rndValue) stringValue];
    
    //Grab current user
    PFUser *user = [PFUser currentUser];
    
    NSString *secondString = [auction.name stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    PFObject *Auction = [PFObject objectWithClassName:secondString];
    
    //If not already registered, assign bid number
    PFQuery *query = [PFQuery queryWithClassName:secondString];
    [query whereKey:@"BidNumber" equalTo:myString];
    if([query countObjects] > 0)
    {
        int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);
        
        NSString *myString = [@(rndValue) stringValue];
    }
    
    //Save it
    Auction[@"users"] = user[@"Name"];
    Auction[@"BidNumber"] = myString;
    
    
    //Checks if already registered
    PFQuery *Namequery = [PFQuery queryWithClassName:secondString];
    [Namequery whereKey:@"users" equalTo:user[@"Name"]];
    if([Namequery countObjects] > 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Already Registered" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        [Auction saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){}];
        PFUser *user = [PFUser currentUser];
        
        NSString *reg = [user objectForKey:@"RegAuctions"];
        NSString *Upreg = [reg stringByAppendingString:@" "];
        secondString = [auction.name stringByReplacingOccurrencesOfString:@" " withString:@"."];
        
        reg = [Upreg stringByAppendingString:secondString];
        
        user[@"RegAuctions"] = reg;
        [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){}];
        
        //Alert view "Success"
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success!" message:@"Registered!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}


@end
