//
//  BidCardViewController.m
//  Auctions
//
//  Created by Blake Mabe on 3/21/15.
//  Copyright (c) 2015 QuantumWareApps. All rights reserved.
//

#import "BidCardViewController.h"
#import "BidCalculatorViewController.h"
#import <Parse/Parse.h>
#import <sys/sysctl.h>

@interface BidCardViewController ()

@end

@implementation BidCardViewController
@synthesize bid;
@synthesize name;

- (void)viewDidLoad
{

    //NSLog(bid.name);
    name.hidden = true;

    [super viewDidLoad];
 
    //Grab user
    PFUser *user = [PFUser currentUser];
    
    NSString *realbid = [bid.name stringByReplacingOccurrencesOfString:@"." withString:@""];
    
    //Search for bid number
    PFQuery *query = [PFQuery queryWithClassName:realbid];
    [query whereKey:@"users" equalTo:user[@"Name"]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error)
        {
            // The find succeeded.
            PFObject *num = [objects objectAtIndex:0];
            self.name.text = num[@"BidNumber"];
            self.name.hidden = NO;
        }
        else
        {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    name.hidden = false;

    //Change font size depending on device
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
    }
    if (([platform isEqualToString:@"iPhone5,1"]) || ([platform isEqualToString:@"iPhone5,2"]) || ([platform isEqualToString:@"iPhone5,3"]) || ([platform isEqualToString:@"iPhone5,4"]) || ([platform isEqualToString:@"iPhone6,1"]) || ([platform isEqualToString:@"iPhone6,2"]))
    {
        self.button.titleLabel.font = [UIFont  fontWithName:@"Helvetica Neue-Helvetica 25 Ultra Light" size:30];
        self.button2.titleLabel.font = [UIFont  fontWithName:@"Helvetica Neue-Helvetica 25 Ultra Light" size:30];
    }
    
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

- (IBAction)bidcalc:(id)sender
{
    [self performSegueWithIdentifier:@"showCalc" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showCalc"])
    {
        BidCalculatorViewController *destViewController = segue.destinationViewController;
        destViewController.bid = bid;
    }
}


@end
