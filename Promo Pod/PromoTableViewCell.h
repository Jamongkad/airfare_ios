//
//  PromoTableViewCell.h
//  Promo Pod
//
//  Created by Mathew Wong on 7/13/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ChameleonFramework/Chameleon.h>
#import "UIColor+HTMLColors.h"
#import "Masonry.h"

@interface PromoTableViewCell : UITableViewCell {

}

@property (nonatomic, strong) UILabel *flightLabel;
@property (nonatomic, strong) UILabel *startingPrice;
@property (nonatomic, strong) UILabel *cheapestProvider;
@property (nonatomic, strong) UILabel *numberOfFlights;
@property (nonatomic, strong) UILabel *priceStartFrom;
@property (nonatomic, strong) UILabel *providerFrom;

@end
