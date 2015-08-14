//
//  FlightHeaderDetailView.h
//  Promo Pod
//
//  Created by Mathew Wong on 8/14/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "UIColor+HTMLColors.h"
#import <ChameleonFramework/Chameleon.h>

@interface FlightHeaderDetailView : UIView
@property (strong, atomic) NSString *originLabel;
@property (strong, atomic) NSString *destinationLabel;
@property (strong, atomic) UILabel *originAirportLabel;
@property (strong, atomic) UILabel *destinationAirportLabel;
@end
