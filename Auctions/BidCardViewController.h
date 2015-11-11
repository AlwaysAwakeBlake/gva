//
//  BidCardViewController.h
//  Auctions
//
//  Created by Blake Mabe on 3/21/15.
//  Copyright (c) 2015 QuantumWareApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bid.h"

@interface BidCardViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *name;

@property (nonatomic, strong) Bid *bid;
- (IBAction)bidcalc:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (weak, nonatomic) IBOutlet UIButton *button2;

@end
