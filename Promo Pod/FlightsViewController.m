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
@property (nonatomic, strong) FlightPromosTableViewController *fptvc;
@property (nonatomic, strong) UIBarButtonItem *filterButton;
@end

@implementation FlightsViewController

- (instancetype)init {
    self = [super init];
    if(!self) return nil;
    
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
        NSLog(@"%@", data);
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
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self pullGroupFlights:hud];
}

- (void)pullGroupFlights:(MBProgressHUD *)hud {

    NSString *airfareURL = @"http://promopod.gearfish.com/group_flights";
    hud.labelText = @"Fetching Flights...";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:airfareURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self.fptvc setFlights:responseObject];
        [self.fptvc.tableView reloadData];
        [hud hide:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
   
}

- (void)openFilter:(id)sender {
    if([self.filterButton.title isEqualToString:@"Filter"]) {
        [self.mm_drawerController openDrawerSide:MMDrawerSideRight animated:YES completion:^(BOOL finished) {
            [self.filterButton setTitle:@"Apply"];
        }];
    } else {
        [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
            [self.filterButton setTitle:@"Filter"];
        }];
    }

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
