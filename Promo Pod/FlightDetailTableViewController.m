//
//  FlightDetailTableViewController.m
//  Promo Pod
//
//  Created by Mathew Wong on 8/8/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import "FlightDetailTableViewController.h"

@interface FlightDetailTableViewController ()

@end

@implementation FlightDetailTableViewController

@synthesize flightDetails;

NSString *const FlightDetailCellIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSLog(@"Flight Details Pwet: %@", self.flightDetails);
    
    NSLog(@"Origin IATA: %@", self.flightDetails[@"org_iata"]);
    NSLog(@"Destination IATA: %@", self.flightDetails[@"des_iata"]);

    NSLog(@"Origin IATA: %@", self.flightDetails[@"org_iata"]);
    NSLog(@"Destination IATA: %@", self.flightDetails[@"des_iata"]);
    
    FlightHeaderDetailView *headerView = [[FlightHeaderDetailView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 160)];
    [headerView.originAirportLabel setText:self.flightDetails[@"origin_airport"]];
    [headerView.destinationAirportLabel setText:self.flightDetails[@"destination_airport"]];
    [self.tableView setTableHeaderView:headerView];
    
    /*
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 100)];
    [footerView setBackgroundColor:[UIColor flatOrangeColor]];
    [self.tableView setTableFooterView:footerView];
    */
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView registerClass:[FlightDetailTableViewCell class] forCellReuseIdentifier:FlightDetailCellIdentifier];
    
    FlightDetailTableViewCell *cell = (FlightDetailTableViewCell *)[tableView dequeueReusableCellWithIdentifier:FlightDetailCellIdentifier forIndexPath:indexPath];
    
    if(cell == nil) {
        cell = [[FlightDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FlightDetailCellIdentifier];
    }
    
    if(indexPath.row == 0) {
   
    }
    
    if(indexPath.row == 1) {

    }
    
    if(indexPath.row == 2) {

    }
    
    if(indexPath.row == 3) {

    }
    
    if(indexPath.row == 4) {
   
    }
    
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
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
