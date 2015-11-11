//
//  TabbarViewController.m
//  Auction
//
//  Created by Blake Mabe on 4/26/15.
//  Copyright (c) 2015 QuantumWareApps. All rights reserved.
//

#import "TabbarViewController.h"

@interface TabbarViewController ()

@end

@implementation TabbarViewController

- (void)viewDidLoad
{
    [self.tabBar setSelectedImageTintColor:[[UIColor alloc] initWithRed:37.0 / 255 green:127.0 / 255 blue:39.0 / 255 alpha:1.0]];
    [super viewDidLoad];
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

@end
