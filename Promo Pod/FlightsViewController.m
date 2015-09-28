//
//  FlightsViewController.m
//  Promo Pod
//
//  Created by Mathew Wong on 7/2/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import "FlightsViewController.h"

@interface FlightsViewController ()
@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;
@property (nonatomic, strong) FlightsTableViewController *ftvc;
@property (nonatomic, strong) FlightPromosTableViewController *fptvc;
@property (nonatomic, strong) UIBarButtonItem *filterButton;
@end

@implementation FlightsViewController

- (instancetype)init {
    self = [super init];
    if(!self) return nil;
    
    self.manager = [AFHTTPRequestOperationManager manager];
    
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
    //self.canDisplayBannerAds = YES;
    self.title = @"Flight Promos";
    
    UIColor *navColor = [UIColor whiteColor];
    
    UIBarButtonItem *dismiss = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
    
    [dismiss setTintColor:[UIColor whiteColor]];
    [self.navigationItem setLeftBarButtonItem:dismiss];
    
    
    self.filterButton = [[UIBarButtonItem alloc] initWithTitle:@"Filter" style:UIBarButtonItemStyleDone target:self action:@selector(openFilter:)];
    [self.navigationItem setRightBarButtonItem:self.filterButton];
    
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
    hud.labelText = @"Fetching Flights...";
    NSString *airfareURL = @"http://promopod.gearfish.com/group_flights";
    
    [self.manager GET:airfareURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self.fptvc setFilteredFlights:nil];
        [self.fptvc setFlights:responseObject];
        [self.fptvc.tableView reloadData];
        [hud hide:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
   
}

- (void)filterNow:(NSDictionary *)params {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Fetching Flights...";
    NSString *airfareURL = @"http://promopod.gearfish.com/filter";
    
    [self.manager POST:airfareURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self.fptvc setFilteredFlights:responseObject];
        [self.fptvc setFlights:nil];
        [self.fptvc.tableView reloadData];        
        [hud hide:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
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
