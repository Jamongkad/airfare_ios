//
//  FlightTableViewCell.m
//  Promo Pod
//
//  Created by Mathew Wong on 7/3/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import "FlightTableViewCell.h"

@implementation FlightTableViewCell

@synthesize currencyRate, airline, origin, destination, travelPeriodLabel, travelPeriodTo, travelPeriodFrom, flightOptions;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //[self setBackgroundColor:[UIColor clearColor]];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        rateContainer = [[UIView alloc] init];
        
        currencyRate = [[UILabel alloc] init];
        [currencyRate setTextColor:[UIColor flatSkyBlueColor]];
        [currencyRate setFont:[UIFont systemFontOfSize:17]];
        [rateContainer addSubview:currencyRate];
        
        airline = [[UILabel alloc] init];
        [airline setTextColor:[UIColor lightGrayColor]];
        [airline setFont:[UIFont systemFontOfSize:13]];
        [rateContainer addSubview:airline];
        
        cellContainer = [[UIView alloc] init];
       
        [cellContainer addSubview:rateContainer];
        [self.contentView addSubview:cellContainer];
        
        vertLine = [[UIView alloc] init];
        [vertLine setBackgroundColor:[UIColor flatBlueColor]];
        [cellContainer addSubview:vertLine];
        
        origin = [[UILabel alloc] init];
        [origin setFont:[UIFont systemFontOfSize:20]];
        [origin setTextColor:[UIColor flatGrayColorDark]];
        [self.contentView addSubview:origin];
        
        destination = [[UILabel alloc] init];
        [destination setFont:[UIFont systemFontOfSize:20]];
        [destination setTextColor:[UIColor flatGrayColorDark]];
        [self.contentView addSubview:destination];
        
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
        
        
        //flightOptions = [[UIView alloc] initWithFrame:CGRectMake(120, 20, 200, 44)];
        flightOptions = [[UIView alloc] init];
        [flightOptions setHidden:YES];
        [flightOptions setBackgroundColor:[UIColor orangeColor]];
        [self.contentView addSubview:flightOptions];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
    
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
    
    [airline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(currencyRate.mas_bottom);
        make.centerX.equalTo(currencyRate);
    }];

    [vertLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@1);
        make.height.equalTo(self.contentView);
        make.left.equalTo(rateContainer.mas_right);
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
    
    [origin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(vertLine.mas_right).offset(10);
        make.top.equalTo(self.contentView.mas_top).offset(5);
    }];
    
    [destination mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(origin.mas_right);
        make.top.equalTo(origin);
    }];
    
    [travelPeriodLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(vertLine.mas_right).offset(10);
        make.bottom.equalTo(travelPeriodFrom.mas_top);
    }];
    /*
    [travelPeriodFrom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(travelPeriodLabel.mas_bottom);
        make.left.equalTo(vertLine.mas_right).offset(10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
    }];
    */
    
    [travelPeriodTo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(travelPeriodLabel.mas_bottom);
        make.left.equalTo(travelPeriodFrom.mas_right);
        make.bottom.equalTo(travelPeriodFrom);
    }];
}

- (void)setNeedsLayout {
    [super setNeedsLayout];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    if(selected) {
        [flightOptions setHidden:NO];
        
        [flightOptions mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vertLine.mas_right);
            make.right.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@50);
        }];
        
        [travelPeriodFrom mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(travelPeriodLabel.mas_bottom);
            make.left.equalTo(vertLine.mas_right).offset(10);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-50);
        }];
        
    } else {
        [flightOptions setHidden:YES];
        
        [travelPeriodFrom mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(travelPeriodLabel.mas_bottom);
            make.left.equalTo(vertLine.mas_right).offset(10);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
        }];
    }
    // Configure the view for the selected state
}

@end
