//
//  FlightHeaderView.h
//  Promo Pod
//
//  Created by Mathew Wong on 7/18/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "UIColor+HTMLColors.h"
#import <ChameleonFramework/Chameleon.h>

@interface FlightHeaderView : UIView {
    UIView *airportView;
    UIView *tripView;
    UIView *vertLine;
    UIView *perPersonView;
    UIView *airlineView;
    
    UILabel *oneWayLabel;
    UILabel *perPersonLabel;
    UILabel *selectDepartureLabel;
    UILabel *displayFlightsLabel;
    UILabel *displayAirlineLabel;
}

@property (nonatomic, strong) UILabel *displayFlightsLabel;

@end
