//
//  FlightTableViewCell.m
//  Promo Pod
//
//  Created by Mathew Wong on 7/3/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import "FlightTableViewCell.h"

@implementation FlightTableViewCell

@synthesize flightData, currencyRate, airlineLabel, travelPeriodLabel, travelPeriodTo, travelPeriodFrom, flightOptions, flightDetail, flightCompare;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        rateContainer = [[UIView alloc] init];
        
        currencyRate = [[UILabel alloc] init];
        [currencyRate setTextColor:[UIColor flatSkyBlueColor]];
        [currencyRate setFont:[UIFont boldSystemFontOfSize:15]];
        [rateContainer addSubview:currencyRate];
        
        cellContainer = [[UIView alloc] init];
       
        [cellContainer addSubview:rateContainer];
        [self.contentView addSubview:cellContainer];
        
        vertLine = [[UIView alloc] init];
        [vertLine setBackgroundColor:[UIColor flatBlueColor]];
        [cellContainer addSubview:vertLine];
        
        horzLine = [[UIView alloc] init];
        [horzLine setBackgroundColor:[UIColor colorWithCSS:@"#E0EEEE"]];
        [cellContainer addSubview:horzLine];
        
        separator = [[UIView alloc] init];
        [separator setBackgroundColor:[UIColor colorWithCSS:@"#E0EEEE"]];
        [cellContainer addSubview:separator];
        
        airlineLabel = [[UILabel alloc] init];
        [airlineLabel setFont:[UIFont boldSystemFontOfSize:20]];
        [airlineLabel setTextColor:[UIColor flatSkyBlueColorDark]];
        [self.contentView addSubview:airlineLabel];
        
        travelPeriodLabel = [[UILabel alloc] init];
        [travelPeriodLabel setTextColor:[UIColor lightGrayColor]];
        [travelPeriodLabel setFont:[UIFont systemFontOfSize:13]];
        [self.contentView addSubview:travelPeriodLabel];
        
        travelPeriodFrom = [[UILabel alloc] init];
        [travelPeriodFrom setTextColor:[UIColor flatGrayColorDark]];
        [travelPeriodFrom setFont:[UIFont systemFontOfSize:14]];
        [self.contentView addSubview:travelPeriodFrom];
        
        travelPeriodTo = [[UILabel alloc] init];
        [travelPeriodTo setTextColor:[UIColor flatGrayColorDark]];
        [travelPeriodTo setFont:[UIFont systemFontOfSize:14]];
        [self.contentView addSubview:travelPeriodTo];
        
        flightOptions = [[UIView alloc] init];
        [flightOptions setHidden:YES];
        [self.contentView addSubview:flightOptions];
        
        flightDetail = [[UIView alloc] init];
        flightCompare = [[UIView alloc] init];
        
        [flightOptions addSubview:flightDetail];
        [flightOptions addSubview:flightCompare];
        
        flightDetailLabel = [[UILabel alloc] init];
        [flightDetailLabel setText:@"Details"];
        [flightDetailLabel setFont:[UIFont systemFontOfSize:13]];
        [flightDetailLabel setTextColor:[UIColor flatSkyBlueColor]];
        [flightDetail addSubview:flightDetailLabel];
        
        flightCompareLabel = [[UILabel alloc] init];
        [flightCompareLabel setText:@"Compare Flights"];
        [flightCompareLabel setFont:[UIFont systemFontOfSize:13]];
        [flightCompareLabel setTextColor:[UIColor flatSkyBlueColor]];
        [flightCompare addSubview:flightCompareLabel];
        
        additionalFlightOptions = [[UILabel alloc] init];
        [additionalFlightOptions setFont:[UIFont systemFontOfSize:9]];
        [additionalFlightOptions setTextColor:[UIColor flatOrangeColorDark]];
        [self.contentView addSubview:additionalFlightOptions];
    
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
    
    if([self.flightData[@"similar_flights"] count]) {
        [additionalFlightOptions setText:@"*other promos available"];
    } else {
        [additionalFlightOptions setText:@""];
    }
  
    [cellContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(padding);
    }];
    
    [rateContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView);
        make.top.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
        make.width.equalTo(@120);
    }];
    
    [currencyRate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(rateContainer);
    }];
    
    [vertLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@1);
        make.height.equalTo(self.contentView);
        make.left.equalTo(rateContainer.mas_right);
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
    
    [airlineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(vertLine.mas_right).offset(10);
        make.top.equalTo(self.contentView.mas_top).offset(5);
    }];
    
    [travelPeriodLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(vertLine.mas_right).offset(10);
        make.bottom.equalTo(travelPeriodFrom.mas_top);
    }];
    
    [travelPeriodTo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(travelPeriodLabel.mas_bottom);
        make.left.equalTo(travelPeriodFrom.mas_right);
        make.bottom.equalTo(travelPeriodFrom);
    }];
    
    [flightDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(flightDetail.mas_top);
        make.center.equalTo(flightDetail);
    }];
    
    [flightCompareLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(flightCompare.mas_top);
        make.center.equalTo(flightCompare);
    }];
    
    [additionalFlightOptions mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(vertLine.mas_right).offset(10);
        make.top.equalTo(airlineLabel.mas_bottom);
    }];
    
    [travelPeriodFrom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(travelPeriodLabel.mas_bottom);
        make.left.equalTo(vertLine.mas_right).offset(10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
    }];
}

- (void)setNeedsLayout {
    [super setNeedsLayout];
}

@end
