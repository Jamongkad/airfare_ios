//
//  RootViewController.m
//  Promo Pod
//
//  Created by Mathew Wong on 6/21/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
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
    self.title = @"Promo Pod";
    
    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"podgear"]
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:self
                                                                      action:@selector(showSettings:)];
    
    [[self navigationItem] setLeftBarButtonItem:settingsButton];

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
    
    UILabel *viewPromo = [[UILabel alloc] init];
    [viewPromo setText:@"View All Flight Promos"];
    [viewPromo setTextAlignment:NSTextAlignmentCenter];
    [viewPromo setTextColor:[UIColor flatWhiteColor]];
    [viewPromo setNumberOfLines:0];
    [viewPromo setFont:[UIFont systemFontOfSize:19]];
    [viewAllPromos addSubview:viewPromo];
    
    UITapGestureRecognizer *searchPromoGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openPromo:)];
    [viewAllPromos addGestureRecognizer:searchPromoGesture];
    
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
    
    [viewPromo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(viewAllPromos).insets(padding);
    }];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self showAds];
    [self whatsNew];
}

- (void)showSettings:(UIBarButtonItem *)theButton {
    IAPurchaseViewController *iap = [[IAPurchaseViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:iap];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)openPromo:(id)sender {
    self.fvc = [[FlightsViewController alloc] init];
    
    MMDrawerController *drawer = [[MMDrawerController alloc]
                                  initWithCenterViewController:self.fvc
                                  rightDrawerViewController:[[FilterViewController alloc] init]];
    
    [drawer setShowsShadow:NO];
    [self.navigationController pushViewController:drawer animated:YES];
}

- (void)whatsNew {
    NSString *currentVersion   = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    NSString *versionOfLastRun = [[NSUserDefaults standardUserDefaults] objectForKey:@"VersionOfLastRun"];
    
    NSLog(@"Current Version %@", currentVersion);
    NSLog(@"Version of Last Run %@", versionOfLastRun);
    
    if (versionOfLastRun == nil) {
        NSLog(@"First run of app");
        [self whatsNewVC];
    } else if (![versionOfLastRun isEqual:currentVersion]) {
        NSLog(@"App was updated");
        [self whatsNewVC];
    } else {
        NSLog(@"App Nothing happened");
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:@"VersionOfLastRun"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)whatsNewVC {
    WhatsNewViewController *wnvc = [[WhatsNewViewController alloc] init];
    [self addChildViewController:wnvc];
    [wnvc didMoveToParentViewController:self];
    [self.view addSubview:wnvc.view];

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
