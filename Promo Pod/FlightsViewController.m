//
//  FlightsViewController.m
//  Promo Pod
//
//  Created by Mathew Wong on 7/2/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import "FlightsViewController.h"

@interface FlightsViewController ()
@property (nonatomic, strong) FlightsTableViewController *ftvc;
@end

@implementation FlightsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Flight Promos";
    
    UIBarButtonItem *dismiss = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
    
    [dismiss setTintColor:[UIColor whiteColor]];
    [self.navigationItem setLeftBarButtonItem:dismiss];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.ftvc = [[FlightsTableViewController alloc] init];
    
    [self addChildViewController:self.ftvc];
    [self.view addSubview:self.ftvc.view];
    [self.ftvc didMoveToParentViewController:self];
    
    [self.ftvc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    
    // Do any additional setup after loading the view.
    NSString *url = @"http://promopod.gearfish.com/airfare";
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Fetching Flights...";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self.ftvc setFlights:responseObject];
        [self.ftvc.tableView reloadData];
        [hud hide:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
