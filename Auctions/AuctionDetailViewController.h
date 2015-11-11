//
//  AuctionDetailViewController.h
//  Auctions
//
//  Created by Blake Mabe on 3/5/15.
//  Copyright (c) 2015 QuantumWareApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Auction.h"

@interface AuctionDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *date;



@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;

- (IBAction)goWeb:(id)sender;
- (IBAction)RegAuction:(id)sender;


@property (nonatomic, strong) Auction *auction;



@end
