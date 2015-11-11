//
//  LoginViewController.m
//  Auctions
//
//  Created by Blake Mabe on 4/21/15.
//  Copyright (c) 2015 QuantumWareApps. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    _username.returnKeyType = UIReturnKeyNext;
    _password.returnKeyType = UIReturnKeyDone;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_username resignFirstResponder];
    [_password resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //Allows next button to navigate through fields
    if (textField == _username)
    {
        [textField resignFirstResponder];
        [_password becomeFirstResponder];
    }
    else if (textField == _password)
    {
        [textField resignFirstResponder];
        [self Login];
    }
    return YES;
}



- (void) Login
{
    //NSLog(@"MADE IT");
    [PFUser logInWithUsernameInBackground:_username.text password:_password.text block:^(PFUser *user, NSError *error)
    {
        if(error)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Wrong Username/Password. Please Contact GVA if you have forgotten your login information." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        else
        {
            [self performSegueWithIdentifier:@"loginMain" sender:self];
        }
    }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
