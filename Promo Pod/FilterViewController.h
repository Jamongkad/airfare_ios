//
//  FilterViewController.h
//  Promo Pod
//
//  Created by Mathew Wong on 9/19/15.
//  Copyright © 2015 YidgetSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "UIColor+HTMLColors.h"
#import <ChameleonFramework/Chameleon.h>
#import <AFNetworking/AFNetworking.h>
#import "UIViewController+MMDrawerController.h"
#import "FilterHeaderView.h"
#import "FilterButtonView.h"
#import "Common.h"

@interface FilterViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView * tableView;
@end
