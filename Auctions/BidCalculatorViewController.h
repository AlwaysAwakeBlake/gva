//
//  BidCalculatorViewController.h
//  Auctions
//
//  Created by Blake Mabe on 3/22/15.
//  Copyright (c) 2015 QuantumWareApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bid.h"

@interface BidCalculatorViewController : UIViewController
@property (nonatomic, strong) Bid *bid;
@property (weak, nonatomic) IBOutlet UITextField *tf1;
@property (weak, nonatomic) IBOutlet UITextField *tf2;
@property (weak, nonatomic) IBOutlet UITextField *tf3;
@property (weak, nonatomic) IBOutlet UITextField *tf4;
@property (weak, nonatomic) IBOutlet UITextField *tf5;
@property (weak, nonatomic) IBOutlet UITextField *tf6;
@property (weak, nonatomic) IBOutlet UITextField *tf7;
@property (weak, nonatomic) IBOutlet UITextField *tf8;
@property (weak, nonatomic) IBOutlet UILabel *lab;

@property (weak, nonatomic) IBOutlet UILabel *lab2;

- (IBAction)return:(id)sender;

@end
