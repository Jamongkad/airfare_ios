//
//  FlightDetailTableViewCell.h
//  Promo Pod
//
//  Created by Mathew Wong on 8/14/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ChameleonFramework/Chameleon.h>
#import "UIColor+HTMLColors.h"
#import "Masonry.h"

@interface FlightDetailTableViewCell : UITableViewCell {
    UILabel *currencyRate;
    UILabel *airlineLabel;
    UILabel *airlineIdLabel;
    UILabel *destination;
    
    UILabel *travelPeriodTo;
    UILabel *travelPeriodFrom;
    UILabel *travelToDay;
    UILabel *travelFromDay;
    
    UILabel *travelPeriodLabel;
    UILabel *priceLabel;
}

@property (strong, atomic) UILabel *currencyRate;
@property (strong, atomic) UILabel *travelPeriodTo;
@property (strong, atomic) UILabel *travelPeriodFrom;
@property (strong, atomic) UILabel *travelToDay;
@property (strong, atomic) UILabel *travelFromDay;
@property (strong, atomic) UILabel *airlineLabel;
@property (strong, atomic) UILabel *airlineIdLabel;
@property (strong, atomic) UILabel *travelPeriodLabel;
@property (strong, atomic) UILabel *priceLabel;


@end
