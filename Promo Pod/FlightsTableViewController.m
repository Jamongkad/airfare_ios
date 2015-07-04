//
//  FlightsTableViewController.m
//  Promo Pod
//
//  Created by Mathew Wong on 7/2/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import "FlightsTableViewController.h"
#import "NSDate+DateTools.h"

@interface FlightsTableViewController ()
@property NSDateFormatter *formatter;
@property NSDate *toSelectedDate;
@property NSDate *fromSelectedDate;
@end

@implementation FlightsTableViewController

@synthesize flights;

static NSString *CellIdentifier = @"FlightCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Flight Promos";
    
    UIBarButtonItem *dismiss = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
    
    [dismiss setTintColor:[UIColor whiteColor]];
    
    [self.navigationItem setLeftBarButtonItem:dismiss];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView registerClass:[FlightTableViewCell class] forCellReuseIdentifier:CellIdentifier];
    
    NSLocale *enUSPOSIXLocale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    self.formatter = [[NSDateFormatter alloc] init];
    self.formatter.locale = enUSPOSIXLocale;
    self.formatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    [self.formatter setDateFormat:@"yyyy'-'MM'-'dd' 'HH':'mm':'ss'"];
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
        NSLog(@"Search Count %lu", [self.flights count]);
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
    NSLog(@"%@", data);
    
    self.fromSelectedDate = [self.formatter dateFromString:data[@"travel_period_from"]];
    self.toSelectedDate = [self.formatter dateFromString:data[@"travel_period_to"]];
   
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setTimeStyle:NSDateFormatterNoStyle];
    [df setDateStyle:NSDateFormatterLongStyle];

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
    [cell.airline setText:data[@"provider"]];
    [cell.origin setText:[NSString stringWithFormat:@"%@ to ", data[@"origin"]]];
    [cell.destination setText:data[@"destination"]];
    [cell.travelPeriodLabel setText:@"Travel Period:"];
    [cell.travelPeriodFrom setText:[NSString stringWithFormat:@"%@ to ", fromDate]];
    [cell.travelPeriodTo setText:toDate];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
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

- (void)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
