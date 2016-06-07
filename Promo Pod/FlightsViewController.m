//
//  FlightsViewController.m
//  Promo Pod
//
//  Created by Mathew Wong on 7/2/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import "FlightsViewController.h"

@interface FlightsViewController ()
@end

@implementation FlightsViewController

- (instancetype)init {
    self = [super init];
    if(!self) return nil;
    
    self.httpManager = [AFHTTPSessionManager manager];
    
    [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(pullFilteredFlights:)
         name:@"filteredFlights"
         object:nil];
    
    return self;
}

- (void)pullFilteredFlights:(NSNotification *)notification {
    if([[notification name] isEqualToString:@"filteredFlights"]) {
        NSDictionary *data = [notification userInfo];
        
        if([[data valueForKey:@"filters"] count] > 0) {
            [self filterNow:data];
        } else {
            [self pullGroupFlights];
        }
       
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *navColor = [UIColor whiteColor];
    [self.parentViewController.navigationItem setTitle:@"Flight Promos"];
    self.canDisplayBannerAds = YES;
    
    self.filterButton = [[UIBarButtonItem alloc] initWithTitle:@"Filter" style:UIBarButtonItemStyleDone target:self action:@selector(openFilter:)];
    [self.parentViewController.navigationItem setRightBarButtonItem:self.filterButton];
    
    [self.filterButton setTintColor:navColor];

    [self.view setBackgroundColor:navColor];
    
    self.fptvc = [[FlightPromosTableViewController alloc] init];

    [self addChildViewController:self.fptvc];
    [self.view addSubview:self.fptvc.view];
    [self.fptvc didMoveToParentViewController:self];
    
    [self.fptvc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    // Do any additional setup after loading the view.
    [self pullGroupFlights];
}

- (void)pullGroupFlights {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = FLIGHT_FETCH_MSG;
    NSString *airfareURL = [NSString stringWithFormat:@"%@%@", API_URL, @"group_flights"];
    
    [[self httpManager] GET:airfareURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.fptvc setFilteredFlights:nil];
        [self.fptvc setFlights:responseObject];
        [self.fptvc setFilterOn:NO];
        [self.fptvc.tableView reloadData];
        [hud hide:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)filterNow:(NSDictionary *)params {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = FLIGHT_FETCH_MSG;
    NSString *airfareURL = [NSString stringWithFormat:@"%@%@", API_URL, @"filter"];
    
    [[self httpManager] POST:airfareURL parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.fptvc setFilteredFlights:responseObject];
        [self.fptvc setFlights:nil];
        [self.fptvc setFilterOn:YES];
        [self.fptvc.tableView reloadData];        
        [hud hide:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)openFilter:(id)sender {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
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