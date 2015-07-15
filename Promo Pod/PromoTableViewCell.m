//
//  PromoTableViewCell.m
//  Promo Pod
//
//  Created by Mathew Wong on 7/13/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import "PromoTableViewCell.h"

@implementation PromoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        _flightLabel = [[UILabel alloc] init];
        [_flightLabel setFont:[UIFont boldSystemFontOfSize:18]];
        [_flightLabel setTextColor:[UIColor flatBlackColor]];
        [self.contentView addSubview:_flightLabel];
        
        _providerFrom = [[UILabel alloc] init];
        [_providerFrom setFont:[UIFont systemFontOfSize:13]];
        [_providerFrom setTextColor:[UIColor flatGrayColor]];
        [_providerFrom setText:@"by "];
        [self.contentView addSubview:_providerFrom];
        
        _cheapestProvider = [[UILabel alloc] init];
        [_cheapestProvider setFont:[UIFont systemFontOfSize:15]];
        [self.contentView addSubview:_cheapestProvider];
        
        _priceStartFrom = [[UILabel alloc] init];
        [_priceStartFrom setFont:[UIFont systemFontOfSize:13]];
        [_priceStartFrom setTextColor:[UIColor flatGrayColor]];
        [_priceStartFrom setText:@"lowest promo for "];
        [self.contentView addSubview:_priceStartFrom];
        
        _startingPrice = [[UILabel alloc] init];
        [_startingPrice setFont:[UIFont boldSystemFontOfSize:20]];
        [_startingPrice setTextColor:[UIColor flatBlueColor]];
        [self.contentView addSubview:_startingPrice];
        
        _numberOfFlights = [[UILabel alloc] init];
        [_numberOfFlights setFont:[UIFont systemFontOfSize:15]];
        [_numberOfFlights setTextColor:[UIColor flatGrayColor]];
        [self.contentView addSubview:_numberOfFlights];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
     
    [_flightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(10);
    }];
    
    [_numberOfFlights mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_flightLabel.mas_bottom);
        make.left.equalTo(self.contentView).offset(10);
    }];
    
    [_providerFrom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.baseline.equalTo(_cheapestProvider);
        make.right.equalTo(_cheapestProvider.mas_left);
    }];
    
    [_cheapestProvider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_startingPrice.mas_bottom);
        make.right.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(self.contentView).offset(-5);
    }];
    
    [_priceStartFrom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_startingPrice.mas_left);
        make.baseline.equalTo(_startingPrice);
    }];
    
    [_startingPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
    }];
}

@end
