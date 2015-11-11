//
//  BidCardsViewController.m
//  Auctions
//
//  Created by Blake Mabe on 3/21/15.
//  Copyright (c) 2015 BlakeMabeApps. All rights reserved.
//

#import "BidCardsViewController.h"
#import <Parse/Parse.h>

@interface BidCardsViewController ()

@end

@implementation BidCardsViewController

NSArray *theArray;


- (void)viewDidLoad {
    theArray = [[NSArray alloc] initWithObjects:@"Apple",@"Pineapple",@"Banana",nil];
    [super viewDidLoad];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [theArray count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [theArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Selected a row" message:[theArray objectAtIndex:indexPath.row] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [alert release];
}


- (void)dealloc {
    [theArray release];
    [super dealloc];
}


@end
