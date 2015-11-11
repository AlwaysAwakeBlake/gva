//
//  SignupViewController.m
//  GVA
//
//  Created by Blake Mabe on 3/1/15.
//  Copyright (c) 2015 QuantumWareApps. All rights reserved.
//

#import "signupViewController.h"
#import <parse/parse.h>

@interface signupViewController ()

@end

@implementation signupViewController

- (void)viewDidLoad
{
    PFUser *user = [PFUser currentUser];
    if(user.username != nil)
    {
        [self performSegueWithIdentifier:@"login" sender:self];
    }

    _username.returnKeyType = UIReturnKeyNext;
    _password.returnKeyType = UIReturnKeyNext;
    _passwordconfirm.returnKeyType = UIReturnKeyNext;
    _email.returnKeyType = UIReturnKeyDone;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    PFUser *user = [PFUser currentUser];
    if(user.username != nil)
    {
        [self performSegueWithIdentifier:@"login" sender:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_username resignFirstResponder];
    [_password resignFirstResponder];
    [_passwordconfirm resignFirstResponder];
    [_email resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //For text field navigation
    if (textField == _username)
    {
        [textField resignFirstResponder];
        [_password becomeFirstResponder];
    }
    if (textField == _password)
    {
        [textField resignFirstResponder];
        [_passwordconfirm becomeFirstResponder];
    }
    if (textField == _passwordconfirm)
    {
        [textField resignFirstResponder];
        [_email becomeFirstResponder];
    }
    else if (textField == _email)
    {
        [_email resignFirstResponder];
        [self checkFieldsComplete];
        // here you can define what happens
        // when user presses return on the email field
    }
    return YES;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void) checkFieldsComplete
{
    if( [_username.text isEqualToString:@""] || [_email.text isEqualToString:@""] || [_password.text isEqualToString:@""] || [_passwordconfirm.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please complete all fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        [self checkPasswordsMatch];
    }
}

-(void) checkPasswordsMatch
{
    if (![_password.text isEqualToString:_passwordconfirm.text])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Passwords do not match" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        [self registerNewUser];
    }
}

- (void) registerNewUser
{
    PFUser *newUser = [PFUser user];
    newUser.username = _username.text;
    newUser.password = _password.text;
    newUser.email = _email.text;
    newUser[@"RegAuctions"] = @" ";
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
    {
        if(!error)
        {
             NSLog(@"Registration success!");
             //  _username.text = nil;
             //_passwordconfirm.text = nil;
             //_password.text = nil;
             //_email.text = nil;
             
             [self performSegueWithIdentifier:@"nextStep" sender:self];
         }
         else
         {
             
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Username taken!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
             [alert show];
         }
     }];
}

@end