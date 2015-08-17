//
//  FlightDetailTableViewCell.m
//  Promo Pod
//
//  Created by Mathew Wong on 8/14/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import "FlightDetailTableViewCell.h"

@implementation FlightDetailTableViewCell {
    UIView *detailContainer;
    UIView *divider;
    UIView *fromContainer;
    UIView *toContainer;
}

@synthesize currencyRate,
            travelPeriodTo,
            travelPeriodFrom,
            airlineLabel,
            travelFromDay,
            travelToDay,
            travelPeriodLabel,
            airlineIdLabel,
            priceLabel;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        detailContainer = [[UIView alloc] init];
        [detailContainer setBackgroundColor:[UIColor whiteColor]];
        [self.contentView addSubview:detailContainer];
        
        fromContainer = [[UIView alloc] init];
        [detailContainer addSubview:fromContainer];
        
        toContainer = [[UIView alloc] init];
        [detailContainer addSubview:toContainer];
        
        divider = [[UIView alloc] init];
        [divider setBackgroundColor:[UIColor colorWithCSS:@"#f1f1f1"]];
        [self.contentView addSubview:divider];
        
        currencyRate = [[UILabel alloc] init];
        [currencyRate setFont:[UIFont boldSystemFontOfSize:32]];
        [currencyRate setTextColor:[UIColor flatBlackColor]];
        [detailContainer addSubview:currencyRate];
        
        travelPeriodFrom = [[UILabel alloc] init];
        [travelPeriodFrom setFont:[UIFont boldSystemFontOfSize:25]];
        [travelPeriodFrom setTextColor:[UIColor flatBlackColor]];
        [fromContainer addSubview:travelPeriodFrom];
        
        travelFromDay = [[UILabel alloc] init];
        [travelFromDay setTextColor:[UIColor flatGrayColorDark]];
        [travelFromDay setFont:[UIFont systemFontOfSize:12]];
        [fromContainer addSubview:travelFromDay];
        
        travelPeriodTo = [[UILabel alloc] init];
        [travelPeriodTo setFont:[UIFont boldSystemFontOfSize:25]];
        [travelPeriodTo setTextColor:[UIColor flatBlackColor]];
        [toContainer addSubview:travelPeriodTo];
        
        travelToDay = [[UILabel alloc] init];
        [travelToDay setTextColor:[UIColor flatGrayColorDark]];
        [travelToDay setFont:[UIFont systemFontOfSize:12]];
        [toContainer addSubview:travelToDay];
        
        airlineLabel = [[UILabel alloc] init];
        [airlineLabel setFont:[UIFont boldSystemFontOfSize:30]];
        [airlineLabel setTextColor:[UIColor flatBlackColor]];
        [detailContainer addSubview:airlineLabel];
        
        airlineIdLabel = [[UILabel alloc] init];
        [airlineIdLabel setFont:[UIFont systemFontOfSize:12]];
        [airlineIdLabel setTextColor:[UIColor flatGrayColor]];
        [detailContainer addSubview:airlineIdLabel];
        
        travelPeriodLabel = [[UILabel alloc] init];
        [travelPeriodLabel setFont:[UIFont systemFontOfSize:12]];
        [travelPeriodLabel setTextColor:[UIColor flatGrayColor]];
        [detailContainer addSubview:travelPeriodLabel];
        
        priceLabel = [[UILabel alloc] init];
        [priceLabel setFont:[UIFont systemFontOfSize:12]];
        [priceLabel setTextColor:[UIColor flatGrayColor]];
        [detailContainer addSubview:priceLabel];
        
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [detailContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    [divider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(detailContainer.mas_top);
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.height.equalTo(@1);
    }];
    
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(detailContainer.mas_top).offset(10);
        make.right.equalTo(detailContainer.mas_right).offset(-10);
    }];
    
    [currencyRate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(priceLabel.mas_bottom);
        make.right.equalTo(detailContainer.mas_right).offset(-10);
    }];
    
    [travelPeriodLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(detailContainer.mas_top).offset(10);
        make.left.equalTo(detailContainer.mas_left).offset(10);
    }];
    
    [fromContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(travelPeriodLabel.mas_bottom).offset(5);
        make.left.equalTo(detailContainer.mas_left).offset(10);
        make.height.equalTo(@40);
    }];
    
        [travelPeriodFrom mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(fromContainer.mas_top);
            make.left.equalTo(fromContainer.mas_left);
        }];
    
        [travelFromDay mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(travelPeriodFrom.mas_bottom);
            make.left.equalTo(fromContainer.mas_left);
        }];
    
    [toContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fromContainer.mas_bottom).offset(10);
        make.left.equalTo(detailContainer.mas_left).offset(10);
    }];
    
        [travelPeriodTo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(toContainer.mas_top);
            make.left.equalTo(toContainer.mas_left);
        }];
    
        [travelToDay mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(travelPeriodTo.mas_bottom);
            make.left.equalTo(toContainer.mas_left);
        }];
    
    [airlineIdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(detailContainer.mas_top).offset(10);
        make.left.equalTo(detailContainer.mas_left).offset(10);
    }];
    
    [airlineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(airlineIdLabel.mas_bottom);
        make.left.equalTo(detailContainer.mas_left).offset(10);
    }];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
