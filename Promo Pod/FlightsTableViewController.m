//
//  FlightsTableViewController.m
//  Promo Pod
//
//  Created by Mathew Wong on 7/2/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import "FlightsTableViewController.h"

@interface FlightsTableViewController () {
    int currentSelection;
}
@property NSDateFormatter *formatter;
@property NSDate *toSelectedDate;
@property NSDate *fromSelectedDate;
@end

@implementation FlightsTableViewController

@synthesize flights, displayFlights;

static NSString *CellIdentifier = @"FlightCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor clearColor]];
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView registerClass:[FlightTableViewCell class] forCellReuseIdentifier:CellIdentifier];
    
    NSLocale *enUSPOSIXLocale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    self.formatter = [[NSDateFormatter alloc] init];
    self.formatter.locale = enUSPOSIXLocale;
    self.formatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    [self.formatter setDateFormat:@"yyyy'-'MM'-'dd' 'HH':'mm':'ss'"];
    
    currentSelection = -1;
    
    FlightHeaderView *headerView = [[FlightHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 130)];
    [headerView.displayFlightsLabel setText:self.displayFlights];
    [self.tableView setTableHeaderView:headerView];
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

    if([self.flights count] > 0) {
        return [self.flights count];
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FlightTableViewCell *cell = (FlightTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if(cell == nil) {
        cell = [[FlightTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    NSDictionary *data = [self.flights objectAtIndex:indexPath.row];
    [cell setFlightData:data];
    [cell setEnableControls:YES];
    
    self.fromSelectedDate = [self.formatter dateFromString:data[@"travel_period_from"]];
    self.toSelectedDate = [self.formatter dateFromString:data[@"travel_period_to"]];
   
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setTimeStyle:NSDateFormatterNoStyle];
    [df setDateStyle:NSDateFormatterMediumStyle];

    NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [df setLocale:usLocale];
    NSString *fromDate = [df stringFromDate:self.fromSelectedDate];
    NSString *toDate = [df stringFromDate:self.toSelectedDate];
    
    if(indexPath.row % 2 == 0) {
        [cell setBackgroundColor:[UIColor flatWhiteColor]];
    } else {
        [cell setBackgroundColor:[UIColor colorWithCSS:@"#FAFAFA"]];
    }
    
    NSNumberFormatter *currencyFormat = [[NSNumberFormatter alloc] init];
    [currencyFormat setNumberStyle:NSNumberFormatterCurrencyStyle];
    [currencyFormat setCurrencySymbol:@""];
    
    NSNumber *rate = [NSNumber numberWithFloat:[data[@"price"] floatValue]];
    
    NSString *price = [NSString stringWithFormat:@"%@%@", @"PHP", [currencyFormat stringFromNumber:rate]];
    [cell.currencyRate setText:price];
    [cell.airlineLabel setText:data[@"provider_fullname"]];
    
    [cell.travelPeriodLabel setText:@"Travel Period:"];
    [cell.travelPeriodFrom setText:[NSString stringWithFormat:@"%@ to ", fromDate]];
    [cell.travelPeriodTo setText:toDate];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *data = [self.flights objectAtIndex:indexPath.row];

    FlightDetailViewController *fdvc = [[FlightDetailViewController alloc] init];
    [fdvc setFlightDetails:data];
    [self.navigationController pushViewController:fdvc animated:YES];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
