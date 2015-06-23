//
//  SearchResultsTableViewController.h
//  Promo Pod
//
//  Created by Mathew Wong on 6/22/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultsTableViewController : UITableViewController
@property (nonatomic) int searchCount;
@property (nonatomic, strong) NSString *searchText;
@property (nonatomic, strong) NSArray *searchResults;
@end
