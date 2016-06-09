//
//  RootViewController.h
//  Promo Pod
//
//  Created by Mathew Wong on 6/21/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootAdvertisingViewController.h"
#import "Masonry.h"
#import "FlightsViewController.h"
#import "DatabaseController.h"
#import "FilterViewController.h"
#import "IAPurchaseViewController.h"
#import "WhatsNewViewController.h"
#import "MMDrawerController.h"
@import GoogleMobileAds;

@interface RootViewController : RootAdvertisingViewController
@property (nonatomic, strong) DatabaseController *dbc;
@property (nonatomic, strong) FlightsViewController *fvc;
@end