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
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        detailContainer = [[UIView alloc] init];
        [detailContainer setBackgroundColor:[UIColor flatBlueColor]];
        [self.contentView addSubview:detailContainer];
        
        divider = [[UIView alloc] init];
        [divider setBackgroundColor:[UIColor lightGrayColor]];
        [self.contentView addSubview:divider];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [detailContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    [divider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(detailContainer.mas_bottom);
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.height.equalTo(@1);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
