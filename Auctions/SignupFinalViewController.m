//
//  SignupFinalViewController.m
//  Auctions
//
//  Created by Blake Mabe on 4/13/15.
//  Copyright (c) 2015 QuantumWareApps. All rights reserved.
//

#import "SignupFinalViewController.h"
#import <Parse/Parse.h>

@interface SignupFinalViewController ()

@end

@implementation SignupFinalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_dob resignFirstResponder];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)agree:(id)sender
{
        if([_dob.text isEqualToString:@""] )
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please complete all fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        else
        {
            PFUser *user = [PFUser currentUser];
            user[@"DOB"] = _dob.text;
             [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){}];
            [self performSegueWithIdentifier:@"enter" sender:self];
        }
}
@end
