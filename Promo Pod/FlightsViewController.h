//
//  FlightsViewController.h
//  Promo Pod
//
//  Created by Mathew Wong on 7/2/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import "Masonry.h"
#import <AFNetworking/AFNetworking.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "FlightsTableViewController.h"
#import "FlightPromosTableViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "Common.h"


@interface FlightsViewController : UIViewController
@property (nonatomic, strong) AFHTTPSessionManager *httpManager;
@property (nonatomic, strong) FlightPromosTableViewController *fptvc;
@property (nonatomic, strong) UIBarButtonItem *filterButton;
@end
