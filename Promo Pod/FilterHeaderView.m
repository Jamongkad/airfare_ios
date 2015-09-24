//
//  FIlterHeaderView.m
//  Promo Pod
//
//  Created by Mathew Wong on 9/22/15.
//  Copyright © 2015 YidgetSoft. All rights reserved.
//

#import "FilterHeaderView.h"

@interface FilterHeaderView()
@property (nonatomic, strong) UILabel *label;
@end

@implementation FilterHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        _label = [[UILabel alloc] init];
        [_label setTextColor:[UIColor whiteColor]];
        [_label setFont:[UIFont systemFontOfSize:14]];
        [self addSubview:_label];
    }
    
    return self;
}

- (void)setTitle:(NSString *)title {
    [_label setText:[title uppercaseString]];
}

- (void)layoutSubviews {
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(self).offset(15);
    }];
}

@end
