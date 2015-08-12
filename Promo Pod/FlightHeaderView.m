//
//  FlightHeaderView.m
//  Promo Pod
//
//  Created by Mathew Wong on 7/18/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import "FlightHeaderView.h"

@interface FlightHeaderView ()
@end;

@implementation FlightHeaderView

@synthesize displayFlightsLabel;

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        
        [self setBackgroundColor:[UIColor flatWhiteColor]];
        
        oneWayLabel = [[UILabel alloc] init];
        [oneWayLabel setTextColor:[UIColor flatGrayColorDark]];
        [oneWayLabel setFont:[UIFont systemFontOfSize:13 weight:8]];
        [oneWayLabel setText:@"One Way"];
        
        perPersonLabel = [[UILabel alloc] init];
        [perPersonLabel setTextColor:[UIColor flatGrayColorDark]];
        [perPersonLabel setFont:[UIFont systemFontOfSize:12]];
        [perPersonLabel setText:@"price/person"];
        
        airportView = [[UIView alloc] init];
        [airportView setBackgroundColor:[UIColor flatSkyBlueColor]];
        
        tripView = [[UIView alloc] init];
        [tripView setBackgroundColor:[UIColor colorWithCSS:@"#F7F7F7"]];
        
        vertLine = [[UIView alloc] init];
        [vertLine setBackgroundColor:[UIColor flatBlueColor]];
        
        perPersonView = [[UIView alloc] init];
        [perPersonView addSubview:oneWayLabel];
        [perPersonView addSubview:perPersonLabel];
        
        displayAirlineLabel = [[UILabel alloc] init];
        [displayAirlineLabel setTextColor:[UIColor flatGrayColorDark]];
        [displayAirlineLabel setFont:[UIFont boldSystemFontOfSize:20]];
        [displayAirlineLabel setText:@"Airlines"];
        
        selectDepartureLabel = [[UILabel alloc] init];
        [selectDepartureLabel setTextColor:[UIColor flatWhiteColorDark]];
        [selectDepartureLabel setFont:[UIFont systemFontOfSize:14]];
        [selectDepartureLabel setText:@"Select Departure"];
        
        displayFlightsLabel = [[UILabel alloc] init];
        [displayFlightsLabel setTextColor:[UIColor flatWhiteColor]];
        [displayFlightsLabel setFont:[UIFont boldSystemFontOfSize:19]];
        
        [airportView addSubview:selectDepartureLabel];
        [airportView addSubview:displayFlightsLabel];
        
        airlineView = [[UIView alloc] init];
        [airlineView addSubview:displayAirlineLabel];
        
        [tripView addSubview:airlineView];
        [tripView addSubview:perPersonView];
        
        [self addSubview:airportView];
        [self addSubview:tripView];
        [self addSubview:vertLine];
    }
    
    return self;
}

- (void)layoutSubviews {
    [airportView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(self.mas_height).dividedBy(2);
    }];
    
    [displayAirlineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(airlineView);
    }];

    [selectDepartureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(airportView.mas_top).offset(10);
        make.left.equalTo(airportView.mas_left).offset(15);
    }];

    [displayFlightsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selectDepartureLabel.mas_bottom);
        make.left.equalTo(selectDepartureLabel.mas_left);
    }];

    [tripView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(airportView.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(self.mas_height).dividedBy(2);
    }];
    
    [airlineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tripView.mas_top);
        make.left.equalTo(perPersonView.mas_right);
        make.right.equalTo(tripView.mas_right);
        make.bottom.equalTo(tripView.mas_bottom);
    }];
    
    [perPersonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tripView.mas_top);
        make.left.equalTo(tripView.mas_left);
        make.bottom.equalTo(tripView.mas_bottom);
        make.width.equalTo(@120);
    }];
    
    [oneWayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(perPersonView.mas_top).offset(16);
        make.centerX.equalTo(perPersonView.mas_centerX);
    }];
    
    [perPersonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oneWayLabel.mas_bottom);
        make.centerX.equalTo(oneWayLabel.mas_centerX);
    }];
    
    [vertLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@1);
        make.left.equalTo(perPersonView.mas_right);
        make.top.equalTo(perPersonView.mas_top);
        make.bottom.equalTo(perPersonView.mas_bottom);
    }];
}

@end
