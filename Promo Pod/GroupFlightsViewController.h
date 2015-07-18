//
//  GroupFlightsViewController.h
//  Promo Pod
//
//  Created by Mathew Wong on 7/15/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+HTMLColors.h"
#import <AFNetworking/AFNetworking.h>
#import "Masonry.h"
#import "FlightsTableViewController.h"

@interface GroupFlightsViewController : UIViewController
@property (nonatomic, strong) NSDictionary *flightData;
@end
