//
//  WebsiteViewController.h
//  Auctions
//
//  Created by Blake Mabe on 3/20/15.
//  Copyright (c) 2015 QuantumWareApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Auction.h"

@interface WebsiteViewController : UIViewController
@property (nonatomic, strong) Auction *auction;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

- (IBAction)return:(id)sender;

@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@end
