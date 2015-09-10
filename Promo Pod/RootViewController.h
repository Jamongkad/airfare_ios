//
//  RootViewController.h
//  Promo Pod
//
//  Created by Mathew Wong on 6/21/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import "Masonry.h"
#import "SearchViewController.h"
#import "FlightsViewController.h"
#import "FlightsTableViewController.h"
#import "DatabaseController.h"

@interface RootViewController : UIViewController
@property (nonatomic, strong) DatabaseController *dbc;
@end
