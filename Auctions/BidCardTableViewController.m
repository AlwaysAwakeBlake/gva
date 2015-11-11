//
//  BidCardTableViewController.m
//  Auctions
//
//  Created by Blake Mabe on 3/21/15.
//  Copyright (c) 2015 QuantumWareApps. All rights reserved.
//

#import "BidCardTableViewController.h"
#import <Parse/Parse.h>
#import "BidCardViewController.h"
#import "Bid.h"

@interface BidCardTableViewController ()

@end

@implementation BidCardTableViewController

- (void)viewDidLoad
{
    //Set Table
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableView.rowHeight = 100;
    
    //Set Background
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainBG.png"]];
    [tempImageView setFrame:self.tableView.frame];
    self.tableView.backgroundView = tempImageView;

    //Grab current user
    PFUser *user = [PFUser currentUser];
    
    //Grab registered auctions
    NSString *trimmed = [[user objectForKey:@"RegAuctions"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSLog(trimmed);
    
  
    myArray = [trimmed componentsSeparatedByString:@" "];
    
    //Makes sure auction is still available
    for (id object in myArray)
    {
        //NSLog(object);
        NSString *name = [object stringByReplacingOccurrencesOfString:@"." withString:@" "];

        //Checks to see if it exists
        PFQuery *query = [PFQuery queryWithClassName:@"Auctions"];
        [query whereKey:@"CellTitle" equalTo:name];
        if([query countObjects] == 0)
        {
            //Delete auction from registered auction
            NSString *reg = [user objectForKey:@"RegAuctions"];
            reg = [reg stringByReplacingOccurrencesOfString:object withString:@""];
            user[@"RegAuctions"] = reg;
            [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){}];
        }
    }

    trimmed = [[user objectForKey:@"RegAuctions"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSLog(trimmed);
    
    
    myArray = [trimmed componentsSeparatedByString:@" "];
    
    [super viewDidLoad];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 return [myArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    // Configure the cell...
    NSString *lab12 = [myArray objectAtIndex:indexPath.row];

    cell.textLabel.text = [lab12 stringByReplacingOccurrencesOfString:@"." withString:@" "];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"ShowBidCard" sender:self];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowBidCard"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *name1 = [myArray objectAtIndex:indexPath.row];
        
        Bid *bid =[[Bid alloc] init];
        bid.name = name1;
        bid.number = name1;

        BidCardViewController *destViewController = segue.destinationViewController;
        destViewController.bid = bid;
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
 [myArray objectAtIndex:indexPath.row];

*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
