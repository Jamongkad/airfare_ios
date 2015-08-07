//
//  FlightPromosTableViewController.m
//  Promo Pod
//
//  Created by Mathew Wong on 7/13/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import "FlightPromosTableViewController.h"

@interface FlightPromosTableViewController () {
    UISearchBar *searchbar;
}

@end

@implementation FlightPromosTableViewController

@synthesize flights;
static NSString *CellIdentifier = @"PromoCell";

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView registerClass:[PromoTableViewCell class] forCellReuseIdentifier:CellIdentifier];
    
    searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 0)];
    [searchbar setDelegate:self];
    [searchbar sizeToFit];
    [self.tableView setTableHeaderView:searchbar];
    [self searchbarSet];
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
    return [flights count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PromoTableViewCell *cell = (PromoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if(cell == nil) {
        cell = [[PromoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *data = [self.flights objectAtIndex:indexPath.row];
    // Configure the cell...
        
    if(indexPath.row % 2 == 0) {
        [cell setBackgroundColor:[UIColor flatWhiteColor]];
    } else {
        [cell setBackgroundColor:[UIColor colorWithCSS:@"#FAFAFA"]];
    }
    
    [cell.flightLabel setText:data[@"displayFlights"]];
    
    [cell.cheapestProvider setTextColor:[UIColor flatSkyBlueColor]];
    [cell.cheapestProvider setText:data[@"cheapestProvider"]];
    
    [cell.startingPrice setText:[NSString stringWithFormat:@"PHP%@", data[@"startingFrom"]]];
    
    NSString *numberOfFlightStatement = @"";
    
    if([data[@"numberOfFlights"] integerValue] > 1) {
        numberOfFlightStatement = [NSString stringWithFormat:@"%@ flights available", data[@"numberOfFlights"]];
    } else {
        numberOfFlightStatement = [NSString stringWithFormat:@"%@ flight available", data[@"numberOfFlights"]];
    }
   
    [cell.numberOfFlights setText:numberOfFlightStatement];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *data = [self.flights objectAtIndex:indexPath.row];
    
    GroupFlightsViewController *gfvc = [[GroupFlightsViewController alloc] init];
    [gfvc setFlightData:data];
    [self.navigationController pushViewController:gfvc animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    // Remove the keyboard
    [searchBar endEditing:YES];
    [self filterSearch:[searchBar text] resetResults:NO];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if([searchText length] > 0) {
        [self filterSearch:searchText resetResults:NO];
    } else {
        [self filterSearch:searchText resetResults:YES];
    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    // Remove the keyboard
    [searchBar endEditing:YES];
    [searchBar setShowsCancelButton:NO animated:YES];
    // Clear the text on cancel
    [searchBar setText:@""];
    [self filterSearch:@"" resetResults:YES];
    [self searchbarSet];
}

- (void)filterSearch:(NSString *)searchText resetResults:(BOOL)reset {
    
    NSString *restURL;
    
    if(reset) {
        restURL = @"http://promopod.gearfish.com/group_flights";
    } else {
        NSString *url = [NSString stringWithFormat:@"%@/%@", @"http://promopod.gearfish.com/group_flights/search", searchText];
        restURL = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:restURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.flights = responseObject;
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)searchbarSet {
    [self.tableView setContentOffset:CGPointMake(0,  searchbar.frame.size.height - self.tableView.contentOffset.y) animated:YES];
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
