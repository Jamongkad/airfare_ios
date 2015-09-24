//
//  FIlterHeaderView.h
//  Promo Pod
//
//  Created by Mathew Wong on 9/22/15.
//  Copyright © 2015 YidgetSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import <ChameleonFramework/Chameleon.h>
#import "UIColor+HTMLColors.h"

@interface FilterHeaderView : UIView
@property (nonatomic, copy) NSString *title;
-(void)setTitle:(NSString *)title;
@end
