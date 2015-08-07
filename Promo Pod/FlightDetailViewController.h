//
//  FlightDetailViewController.h
//  Promo Pod
//
//  Created by Mathew Wong on 7/10/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "UIColor+HTMLColors.h"
#import <ChameleonFramework/Chameleon.h>
#import "FlightDetailTableViewController.h"

@interface FlightDetailViewController : UIViewController
@property (nonatomic, strong) NSDictionary *flightDetails;
@end
