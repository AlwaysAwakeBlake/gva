//
//  WebsiteViewController.m
//  Auctions
//
//  Created by Blake Mabe on 3/20/15.
//  Copyright (c) 2015 QuantumWareApps. All rights reserved.
//

#import "WebsiteViewController.h"

@interface WebsiteViewController ()

@end

@implementation WebsiteViewController

@synthesize webView;
@synthesize auction;
@synthesize toolbar;

- (void)viewDidLayoutSubviews
{
    webView.frame = CGRectMake(-50, 0, self.view.frame.size.width, self.view.frame.size.height - 50);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.webView.scalesPageToFit = YES;
    webView.scrollView.zoomScale = 2.0;
    //1
    NSString *urlString = auction.web;
    
    //2
    NSURL *url = [NSURL URLWithString:urlString];
    
    //3
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //4
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    //5
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         if ([data length] > 0 && error == nil) [webView loadRequest:request];
         else if (error != nil) NSLog(@"Error: %@", error);
     }];
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

- (IBAction)return:(id)sender
{
    [self performSegueWithIdentifier:@"return" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"return"])
    {
        WebsiteViewController *destViewController = segue.destinationViewController;
        destViewController.auction = auction;
    }
}

@end
