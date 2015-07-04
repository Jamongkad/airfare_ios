//
//  FlightsTableViewController.h
//  Promo Pod
//
//  Created by Mathew Wong on 7/2/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import <ChameleonFramework/Chameleon.h>
#import "UIColor+HTMLColors.h"
#import "FlightTableViewCell.h"

@interface FlightsTableViewController : UITableViewController
@property (nonatomic, strong) NSArray *flights;
@end
