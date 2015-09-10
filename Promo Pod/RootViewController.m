//
//  RootViewController.m
//  Promo Pod
//
//  Created by Mathew Wong on 6/21/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property (nonatomic, strong) SearchViewController *svc;
@property (nonatomic, strong) FlightsViewController *fvc;
@end

@implementation RootViewController

- (id)init {
    if(self = [super init]) {
        self.dbc = [[DatabaseController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.canDisplayBannerAds = YES;
    self.title = @"Promo Pod";
    
    UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
        
    UIImageView *bgImage = [[UIImageView alloc] init];
    [bgImage setFrame:self.view.bounds];
    [bgImage setContentMode:UIViewContentModeScaleAspectFill];
    [bgImage setImage:[UIImage imageNamed:@"bg-main-0"]];
    [self.view addSubview:bgImage];
    UILabel *saying = [[UILabel alloc] init];
    [saying setText:@"Vacations need not be expensive"];
    [saying setLineBreakMode:NSLineBreakByWordWrapping];
    [saying setNumberOfLines:0];
    [saying setTextAlignment:NSTextAlignmentCenter];
    [saying setTextColor:[UIColor flatWhiteColor]];
    [saying setFont:[UIFont systemFontOfSize:23]];
    [self.view addSubview:saying];
    
    UIView *sayingContainer = [[UIView alloc] init];
    [sayingContainer addSubview:saying];
    [self.view addSubview:sayingContainer];
    
    UIView *viewAllPromos = [[UIView alloc] init];
    [viewAllPromos setBackgroundColor:[[UIColor flatBlueColor] colorWithAlphaComponent:.6]];
    [self.view addSubview:viewAllPromos];
    
    [sayingContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@200);
        make.bottom.equalTo(viewAllPromos.mas_top);
    }];
    
    [saying mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(sayingContainer);
        make.centerY.equalTo(sayingContainer);
        make.left.equalTo(sayingContainer).offset(10);
        make.right.equalTo(sayingContainer).offset(-10);
    }];
    
    [viewAllPromos mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sayingContainer.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.mas_equalTo(120);
    }];
    
    UILabel *viewPromo = [[UILabel alloc] init];
    [viewPromo setText:@"View All Flight Promos"];
    [viewPromo setTextAlignment:NSTextAlignmentCenter];
    [viewPromo setTextColor:[UIColor flatWhiteColor]];
    [viewPromo setNumberOfLines:0];
    [viewPromo setFont:[UIFont systemFontOfSize:19]];
    [viewAllPromos addSubview:viewPromo];
    
    [viewPromo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(viewAllPromos).insets(padding);
    }];
    
    UITapGestureRecognizer *searchPromoGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openPromo:)];
    [viewAllPromos addGestureRecognizer:searchPromoGesture];
    // Do any additional setup after loading the view.
    
}

- (void)openSearch:(id)sender {
    [self.dbc clearAllFlights];
    self.svc = [[SearchViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self.svc];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)openPromo:(id)sender {
    self.fvc = [[FlightsViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self.fvc];
    [self presentViewController:nav animated:YES completion:nil];
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
