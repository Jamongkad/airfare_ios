//
//  FlightDetailTableViewController.h
//  Promo Pod
//
//  Created by Mathew Wong on 8/8/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlightHeaderDetailView.h"
#import "FlightDetailTableViewCell.h"

@interface FlightDetailTableViewController : UITableViewController
@property (nonatomic, strong) NSDictionary *flightDetails;
@end
