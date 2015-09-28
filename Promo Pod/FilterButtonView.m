//
//  FilterButtonView.m
//  Promo Pod
//
//  Created by Mathew Wong on 9/28/15.
//  Copyright © 2015 YidgetSoft. All rights reserved.
//

#import "FilterButtonView.h"

@interface FilterButtonView()
@property (nonatomic, strong) UILabel *label;
@end

@implementation FilterButtonView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor flatOrangeColor]];
        
        _label = [[UILabel alloc] init];
        [_label setTextColor:[UIColor whiteColor]];
        [_label setFont:[UIFont boldSystemFontOfSize:20]];
        [_label setText:@"Apply"];
        [self addSubview:_label];
    }
    
    return self;
}

- (void)layoutSubviews {
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
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
