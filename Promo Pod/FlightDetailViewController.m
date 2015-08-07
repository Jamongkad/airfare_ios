//
//  FlightDetailViewController.m
//  Promo Pod
//
//  Created by Mathew Wong on 7/10/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import "FlightDetailViewController.h"

@interface FlightDetailViewController () {
    UIView *originView;
    UIView *destinationView;
    UIView *divider;
    UIView *gotoWebsite;
    
    UILabel *gotoWebsiteLabel;
    
    FlightDetailTableViewController *fdtvc;
}

@end

@implementation FlightDetailViewController

@synthesize flightDetails;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Flight Details";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    NSLog(@"Flight Details Pwet: %@", self.flightDetails);
    
    NSLog(@"Origin IATA: %@", self.flightDetails[@"org_iata"]);
    NSLog(@"Destination IATA: %@", self.flightDetails[@"des_iata"]);

    NSLog(@"Origin IATA: %@", self.flightDetails[@"org_iata"]);
    NSLog(@"Destination IATA: %@", self.flightDetails[@"des_iata"]);
    // Do any additional setup after loading the view.
    
    originView = [[UIView alloc] init];
    [originView setBackgroundColor:[UIColor flatSkyBlueColor]];
    [self.view addSubview:originView];
    
    divider = [[UIView alloc] init];
    [divider setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:divider];
    
    destinationView = [[UIView alloc] init];
    [destinationView setBackgroundColor:[UIColor flatSkyBlueColor]];
    [self.view addSubview:destinationView];
    
    fdtvc = [[FlightDetailTableViewController alloc] init];
    [self addChildViewController:fdtvc];
    [self.view addSubview:fdtvc.view];
    [fdtvc didMoveToParentViewController:self];
    
    gotoWebsite = [[UIView alloc] init];
    [gotoWebsite setBackgroundColor:[UIColor flatOrangeColor]];
    [self.view addSubview:gotoWebsite];
    
    gotoWebsiteLabel = [[UILabel alloc] init];
    [gotoWebsiteLabel setTextColor:[UIColor flatWhiteColor]];
    [gotoWebsiteLabel setText:@"go to website"];
    [gotoWebsiteLabel setFont:[UIFont systemFontOfSize:20 weight:4]];
    [gotoWebsite addSubview:gotoWebsiteLabel];

    id height = @80;
    
    [originView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(height);
    }];
    
    [divider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(originView.mas_bottom);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@1);
    }];
    
    [destinationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(divider.mas_bottom);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(height);
    }];
    
    [fdtvc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(destinationView.mas_bottom);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(gotoWebsite.mas_top);
    }];
    
    [gotoWebsite mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fdtvc.view.mas_bottom);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@60);
        make.bottom.equalTo(self.view);
    }];
    
    [gotoWebsiteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(gotoWebsite);
    }];
    
    UITapGestureRecognizer *openWebsite = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openWebsite:)];
    [gotoWebsite addGestureRecognizer:openWebsite];
}

- (void)openWebsite:(id)sender {
    NSLog(@"Open Website %@", self.flightDetails[@"provider"]);
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
