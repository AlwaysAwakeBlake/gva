//
//  SignupcontViewController.m
//  Auctions
//
//  Created by Blake Mabe on 4/13/15.
//  Copyright (c) 2015 QuantumWareApps. All rights reserved.
//

#import "SignupcontViewController.h"
#import <parse/parse.h>

@interface SignupcontViewController ()

@end

@implementation SignupcontViewController

- (void)viewDidLoad
{
    _name.returnKeyType = UIReturnKeyNext;
    _phone.returnKeyType = UIReturnKeyNext;
    _address.returnKeyType = UIReturnKeyNext;
    _city.returnKeyType = UIReturnKeyNext;
    _dlnumber.returnKeyType = UIReturnKeyDone;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_name resignFirstResponder];
    [_phone resignFirstResponder];
    [_address resignFirstResponder];
    [_city resignFirstResponder];
    [_dlnumber resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //For text field navigation
    if (textField == _name)
    {
        [textField resignFirstResponder];
        [_phone becomeFirstResponder];
    }
    if (textField == _phone)
    {
        [textField resignFirstResponder];
        [_address becomeFirstResponder];
    }
    if (textField == _address)
    {
        [textField resignFirstResponder];
        [_city becomeFirstResponder];
    }
    if (textField == _city)
    {
        [textField resignFirstResponder];
        [_dlnumber becomeFirstResponder];
    }
    else if (textField == _dlnumber)
    {
        [_dlnumber resignFirstResponder];
        [self checkFieldsComplete];
        // here you can define what happens
        // when user presses return on the email field
    }
    return YES;
}

- (void) checkFieldsComplete
{
    if( [_name.text isEqualToString:@""] || [_phone.text isEqualToString:@""] || [_address.text isEqualToString:@""] || [_dlnumber.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please complete all fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        PFUser *user = [PFUser currentUser];
        user[@"Name"] = _name.text;
        user[@"Phone"] = _phone.text;
        user[@"Address"] = _address.text;
        user[@"DLNumber"] = _dlnumber.text;
        user[@"City"] = _city.text;
         [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){}];
        [self performSegueWithIdentifier:@"final" sender:self];
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

@end
