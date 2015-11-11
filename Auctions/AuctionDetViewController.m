//
//  AuctionDetViewController.m
//  Auctions
//
//  Created by Blake Mabe on 4/12/15.
//  Copyright (c) 2015 BlakeMabeApps. All rights reserved.
//

#import "AuctionDetViewController.h"
#import <Parse/Parse.h>
#import "Auction.h"
#import "WebsiteViewController.h"

@interface AuctionDetViewController ()

@end



@implementation AuctionDetViewController

@synthesize name;
@synthesize date;
@synthesize auction;
@synthesize web;

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
    
    self.name.text = auction.name;
    self.date.text = auction.date;
    
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showWebsite"])
    {
        WebsiteViewController *destViewController = segue.destinationViewController;
        
        destViewController.auction = auction;
    }
}

- (IBAction)register:(id)sender
{
    
    int lowerBound = 500;
    int upperBound = 600;
    int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);
    
    
    
    NSString* myString = [@(rndValue) stringValue];
    
    PFUser *user = [PFUser currentUser];
    
    NSString *secondString = [auction.name stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    PFObject *Auction = [PFObject objectWithClassName:secondString];
    
    //   [Auction saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
    
    //     if(succeeded)
    //   {
    
    PFQuery *query = [PFQuery queryWithClassName:secondString];
    [query whereKey:@"BidNumber" equalTo:myString];
    if([query countObjects] > 0)
    {
        int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);
        
        NSString *myString = [@(rndValue) stringValue];
    }
    
    
    
    //  }}];
    
    //Replace with get("name")
    Auction[@"users"] = user.username;
    Auction[@"BidNumber"] = myString;
    
    PFQuery *Namequery = [PFQuery queryWithClassName:secondString];
    [Namequery whereKey:@"users" equalTo:user.username];
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
        
        
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success!" message:@"Registered!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    
}

- (IBAction)goWebsite:(id)sender
{
    
    [self performSegueWithIdentifier:@"ShowWebsite" sender:self];
}
@end
