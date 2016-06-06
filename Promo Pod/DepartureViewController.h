//
//  DepartureViewController.h
//  Promo Pod
//
//  Created by Mathew Wong on 6/22/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "SearchResultsTableViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <AFNetworking/AFNetworking.h>

@interface DepartureViewController : UIViewController {
    AFHTTPSessionManager *httpManager;
}
@property (nonatomic) long flightIdentifier;
@end
