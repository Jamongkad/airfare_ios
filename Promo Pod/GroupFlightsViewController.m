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
    
    NSString *url = [NSString stringWithFormat:@"%@%@/%@", API_URL, @"flights", self.flightData[@"flights"]];
    [ftvc setDisplayFlights:self.flightData[@"displayFlights"]];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = FLIGHT_FETCH_MSG;

    httpManager = [AFHTTPSessionManager manager];
    NSString *encodedURL = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [httpManager GET:encodedURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [ftvc setFlights:responseObject];
        [ftvc.tableView reloadData];
        [hud hide:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
    }];
    
    [self addChildViewController:ftvc];
    [self.view addSubview:ftvc.view];
    [ftvc didMoveToParentViewController:self];
    
    [ftvc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self showAds];
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
