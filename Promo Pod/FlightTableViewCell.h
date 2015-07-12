//
//  FlightTableViewCell.h
//  Promo Pod
//
//  Created by Mathew Wong on 7/3/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ChameleonFramework/Chameleon.h>
#import "UIColor+HTMLColors.h"
#import "Masonry.h"

@interface FlightTableViewCell : UITableViewCell {
    UILabel *currencyRate;
    UILabel *airline;
    UILabel *origin;
    UILabel *destination;
    UILabel *travelPeriodLabel;
    UILabel *travelPeriodTo;
    UILabel *travelPeriodFrom;
    UILabel *flightDetailLabel;
    UILabel *flightCompareLabel;
    UILabel *additionalFlightOptions;
    
    UIView *cellContainer;
    UIView *rateContainer;
    UIView *separator;
    UIView *vertLine;
    UIView *horzLine;
    UIView *seperator;
    UIView *flightOptions;
    
    UIView *flightDetail;
    UIView *flightCompare;
}

@property (nonatomic, strong) NSDictionary *flightData;

@property (nonatomic, strong) UILabel *currencyRate;
@property (nonatomic, strong) UILabel *airline;

@property (nonatomic, strong) UILabel *origin;
@property (nonatomic, strong) UILabel *destination;

@property (nonatomic, strong) UILabel *travelPeriodLabel;
@property (nonatomic, strong) UILabel *travelPeriodTo;
@property (nonatomic, strong) UILabel *travelPeriodFrom;

@property (nonatomic, strong) UIView *flightOptions;
@property (nonatomic, strong) UIView *flightDetail;
@property (nonatomic, strong) UIView *flightCompare;

@property (nonatomic) BOOL enableControls;

@end
