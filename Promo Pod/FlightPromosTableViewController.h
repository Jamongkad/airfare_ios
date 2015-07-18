//
//  FlightPromosTableViewController.h
//  Promo Pod
//
//  Created by Mathew Wong on 7/13/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PromoTableViewCell.h"
#import "UIColor+HTMLColors.h"
#import "GroupFlightsViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface FlightPromosTableViewController : UITableViewController
@property (nonatomic, strong) NSArray *flights;
@end
