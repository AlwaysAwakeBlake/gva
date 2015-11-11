//
//  AuctionDetViewController.h
//  Auctions
//
//  Created by Blake Mabe on 4/12/15.
//  Copyright (c) 2015 BlakeMabeApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Auction.h"

@interface AuctionDetViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *name;
- (IBAction)register:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *date;
- (IBAction)goWebsite:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *web;

- (IBAction)goWeb:(id)sender;


@property (nonatomic, strong) Auction *auction;

@end
