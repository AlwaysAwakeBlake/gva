//
//  BidCalculatorViewController.m
//  Auctions
//
//  Created by Blake Mabe on 3/22/15.
//  Copyright (c) 2015 QuantumWareApps. All rights reserved.
//

#import "BidCalculatorViewController.h"
#import "BidCardViewController.h"
#import <sys/sysctl.h>

@interface BidCalculatorViewController ()

@end

@implementation BidCalculatorViewController

@synthesize tf1, tf2, tf3, tf4, tf5, tf6, tf7, tf8, lab, bid, lab2;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(runMethod) userInfo:nil repeats:YES];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [tf1 resignFirstResponder];
    [tf2 resignFirstResponder];
    [tf3 resignFirstResponder];
    [tf4 resignFirstResponder];
    [tf5 resignFirstResponder];
    [tf6 resignFirstResponder];
    [tf7 resignFirstResponder];
    [tf8 resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
     [tf1 resignFirstResponder];
     [tf2 resignFirstResponder];
     [tf3 resignFirstResponder];
     [tf4 resignFirstResponder];
     [tf5 resignFirstResponder];
     [tf6 resignFirstResponder];
     [tf7 resignFirstResponder];
     [tf8 resignFirstResponder];
     return NO;
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

-(void)runMethod
{
    NSLog(tf1.text);
    double d1 = [tf1.text doubleValue];
    double d2 = [tf2.text doubleValue];
    double d3 = [tf3.text doubleValue];
    double d4 = [tf4.text doubleValue];
    double d5 = [tf5.text doubleValue];
    double d6 = [tf6.text doubleValue];
    double d7 = [tf7.text doubleValue];
    double d8 = [tf8.text doubleValue];
    
    NSLog([NSString stringWithFormat:@"%.2f", d1]);
    double dresult = d1 + d2 +d3 + d4 +d5+d6+d7+d8;
    
    double ctax = dresult * .153;
    double cardtax = dresult * .183;
    
    cardtax = dresult + cardtax;
    ctax = dresult + ctax;
    
    
    NSString *result = [NSString stringWithFormat:@"Final Price with Cash: %.2f", ctax];
    lab.text = result;
   
    
     NSString *result2 = [NSString stringWithFormat:@"Final Price with Card: %.2f ", cardtax];
    lab2.text = result2;

}

- (IBAction)return:(id)sender
{
    [self performSegueWithIdentifier:@"return" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"return"])
    {
        BidCardViewController *destViewController = segue.destinationViewController;
        destViewController.bid = bid;
    }
}

@end
