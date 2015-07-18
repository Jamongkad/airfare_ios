//
//  FlightHeaderView.m
//  Promo Pod
//
//  Created by Mathew Wong on 7/18/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import "FlightHeaderView.h"

@interface FlightHeaderView () {
    UIView *airportView;
    UIView *tripView;
    UIView *vertLine;
    UIView *perPersonView;
}

@end;

@implementation FlightHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor flatWhiteColor]];
        
        airportView = [[UIView alloc] init];
        [airportView setBackgroundColor:[UIColor flatSkyBlueColor]];
        
        tripView = [[UIView alloc] init];
        [tripView setBackgroundColor:[UIColor colorWithCSS:@"#F7F7F7"]];
        
        vertLine = [[UIView alloc] init];
        [vertLine setBackgroundColor:[UIColor flatBlueColor]];
        
        perPersonView = [[UIView alloc] init];
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
    
    [tripView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(airportView.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(self.mas_height).dividedBy(2);
    }];
    
    [perPersonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tripView.mas_top);
        make.left.equalTo(tripView.mas_left);
        make.bottom.equalTo(tripView.mas_bottom);
        make.width.equalTo(@120);
    }];
    
    [vertLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@1);
        make.left.equalTo(perPersonView.mas_right);
        make.top.equalTo(perPersonView.mas_top);
        make.bottom.equalTo(perPersonView.mas_bottom);
    }];
}

@end
