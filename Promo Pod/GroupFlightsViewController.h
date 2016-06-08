//
//  GroupFlightsViewController.h
//  Promo Pod
//
//  Created by Mathew Wong on 7/15/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootAdvertisingViewController.h"
#import "UIColor+HTMLColors.h"
#import <AFNetworking/AFNetworking.h>
#import "FlightsTableViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface GroupFlightsViewController : RootAdvertisingViewController {
    AFHTTPSessionManager *httpManager;
}
@property (nonatomic, strong) NSDictionary *flightData;
@end
