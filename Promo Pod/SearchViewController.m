//
//  SearchViewController.m
//  Promo Pod
//
//  Created by Mathew Wong on 6/21/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()
@property (nonatomic, strong) SearchFormViewController *sfvc;
@property (nonatomic, strong) DatabaseController *dbc;
@end

@implementation SearchViewController

- (id)init {
    if(self = [super init]) {
        self.dbc = [[DatabaseController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Search Promo Flights";
    
    UIBarButtonItem *dismiss = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
    
    [dismiss setTintColor:[UIColor whiteColor]];
    [self.navigationItem setLeftBarButtonItem:dismiss];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [searchBtn setTitle:@"Search" forState:UIControlStateNormal];
    [searchBtn setBackgroundColor:[UIColor colorWithComplementaryFlatColorOf:[UIColor flatSkyBlueColor]]];
    [searchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchBtn];
    
    [searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@50);
        make.bottom.equalTo(self.view);
        make.width.equalTo(self.view);
    }];
    
    UIView *departureView = [[UIView alloc] init];
    [departureView setBackgroundColor:[UIColor colorWithCSS:@"#F7F7F7"]];
    [self.view addSubview:departureView];

    UIView *arrivalView = [[UIView alloc] init];
    [arrivalView setBackgroundColor:[UIColor colorWithCSS:@"#BEBEBE"]];
    [self.view addSubview:arrivalView];

    self.sfvc = [[SearchFormViewController alloc] init];
    [self addChildViewController:self.sfvc];
    [self.view addSubview:self.sfvc.view];
    [self.sfvc didMoveToParentViewController:self];
    
    [self.sfvc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(departureView.mas_top);
    }];
    
    [self.sfvc.tableView setScrollEnabled:NO];
    
    [departureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sfvc.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.height.mas_equalTo(150);
        make.width.mas_equalTo([[UIScreen mainScreen] bounds].size.width/2);
        make.bottom.equalTo(searchBtn.mas_top).offset(-300);
    }];
    
    [arrivalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sfvc.view.mas_bottom);
        make.right.equalTo(self.view.mas_right);
        make.height.mas_equalTo(150);
        make.width.mas_equalTo([[UIScreen mainScreen] bounds].size.width/2);
        make.bottom.equalTo(searchBtn.mas_top).offset(-300);
    }];
    
    /*
    if(self.searchResultData) {
        UILabel *departureLabel = [[UILabel alloc] init];
        [departureLabel setText:self.searchResultData[@"airport"]];
        [departureView addSubview:departureLabel];
        
        [departureLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(departureView);
        }];
    }
    */
    NSMutableArray *d = [self.dbc getFlightData];
    NSLog(@"Flights %@", d);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSMutableArray *d = [self.dbc getFlightData];
    NSLog(@"Flights %@", d);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)search:(id)sender {
    NSLog(@"Searching");
    [self.dbc clearAllFlights];
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
