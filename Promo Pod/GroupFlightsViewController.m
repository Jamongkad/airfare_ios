//
//  GroupFlightsViewController.m
//  Promo Pod
//
//  Created by Mathew Wong on 7/15/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import "GroupFlightsViewController.h"

@interface GroupFlightsViewController ()

@end

@implementation GroupFlightsViewController

@synthesize flightData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor colorWithCSS:@"#CAE1FF"]];
    
    FlightsTableViewController *ftvc = [[FlightsTableViewController alloc] init];
    NSString *url = [NSString stringWithFormat:@"%@/%@", @"http://promopod.gearfish.com/flights", self.flightData[@"flights"]];
    NSString *escapedString = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [ftvc setDisplayFlights:self.flightData[@"displayFlights"]];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Fetching Flights...";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:escapedString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [ftvc setFlights:responseObject];
        [ftvc.tableView reloadData];
        [hud hide:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [self addChildViewController:ftvc];
    [self.view addSubview:ftvc.view];
    [ftvc didMoveToParentViewController:self];
    
    [ftvc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
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
