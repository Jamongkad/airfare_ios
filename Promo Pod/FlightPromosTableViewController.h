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
#import <ChameleonFramework/Chameleon.h>
#import <AFNetworking/AFNetworking.h>
#import "FlightDetailViewController.h"


@interface FlightPromosTableViewController : UITableViewController <UISearchBarDelegate, UIScrollViewDelegate>
@property (nonatomic, strong) NSArray *flights;
@property (nonatomic, strong) NSArray *filteredFlights;
@property (nonatomic) BOOL filterOn;
@end
