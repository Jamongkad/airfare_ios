//
//  FlightHeaderDetailView.m
//  Promo Pod
//
//  Created by Mathew Wong on 8/14/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import "FlightHeaderDetailView.h"

@implementation FlightHeaderDetailView {
    UIView *originView;
    UIView *destinationView;
    UIView *divider;
    
    UILabel *departingLabel;
    UILabel *arrivingLabel;
    UILabel *originAirportLabel;
    UILabel *destinationAirportLabel;
}

@synthesize originLabel, destinationLabel, originAirportLabel, destinationAirportLabel;

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        
        originView = [[UIView alloc] init];
        [originView setBackgroundColor:[UIColor flatSkyBlueColorDark]];
        
        departingLabel = [[UILabel alloc] init];
        [departingLabel setTextColor:[UIColor flatWhiteColorDark]];
        [departingLabel setFont:[UIFont systemFontOfSize:14]];
        [departingLabel setText:@"Departing Flight"];
        [originView addSubview:departingLabel];
        
        originAirportLabel = [[UILabel alloc] init];
        [originAirportLabel setTextColor:[UIColor whiteColor]];
        [originAirportLabel setFont:[UIFont boldSystemFontOfSize:19]];
        [originView addSubview:originAirportLabel];
        
        destinationView = [[UIView alloc] init];
        [destinationView setBackgroundColor:[UIColor flatSkyBlueColorDark]];
        
        destinationAirportLabel = [[UILabel alloc] init];
        [destinationAirportLabel setTextColor:[UIColor whiteColor]];
        [destinationAirportLabel setFont:[UIFont boldSystemFontOfSize:19]];
        [destinationView addSubview:destinationAirportLabel];
        [self addSubview:destinationView];
        
        arrivingLabel = [[UILabel alloc] init];
        [arrivingLabel setTextColor:[UIColor flatWhiteColorDark]];
        [arrivingLabel setFont:[UIFont systemFontOfSize:14]];
        [arrivingLabel setText:@"Arriving Flight"];
        [destinationView addSubview:arrivingLabel];
        
        divider = [[UIView alloc] init];
        [divider setBackgroundColor:[UIColor lightGrayColor]];
        
        [self addSubview:originView];
        [self addSubview:divider];
        [self addSubview:destinationView];
    }
    
    return self;
}


- (void)layoutSubviews {
    
    id height = @80;
    
    [originView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(divider.mas_top);
        make.height.equalTo(height);
    }];
    
    [divider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.left.equalTo(self);
        make.right.equalTo(self);
    }];
    
    [destinationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(divider.mas_bottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(height);
    }];
    
    [departingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(originView.mas_top).offset(20);
        make.left.equalTo(originView.mas_left).offset(15);
    }];
    
    [arrivingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(destinationView.mas_top).offset(20);
        make.left.equalTo(destinationView.mas_left).offset(15);
    }];
    
    [originAirportLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(departingLabel.mas_bottom);
        make.left.equalTo(departingLabel.mas_left);
    }];
    
    [destinationAirportLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(arrivingLabel.mas_bottom);
        make.left.equalTo(arrivingLabel.mas_left);
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
