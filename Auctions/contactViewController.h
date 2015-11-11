//
//  contactViewController.h
//  Auctions
//
//  Created by Blake Mabe on 3/5/15.
//  Copyright (c) 2015 QuantumWareApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface contactViewController : UIViewController

//Call Button
- (IBAction)call:(id)sender;

//Logout Button
- (IBAction)logout:(id)sender;
- (IBAction)addy:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *addbutton;

@end
