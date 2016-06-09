//
//  WhatsNewViewController.m
//  Promo Pod
//
//  Created by Mathew Wong on 09/06/2016.
//  Copyright © 2016 YidgetSoft. All rights reserved.
//

#import "WhatsNewViewController.h"

@implementation WhatsNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSNumber *logoSize = @70;
    
    UILabel *whatsNewLabel = [[UILabel alloc] init];
    NSString *currentVersion   = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    
    [whatsNewLabel setText:[NSString stringWithFormat:@"What's new in version %@", currentVersion]];
    [whatsNewLabel setTextColor:[UIColor flatBlackColor]];
    [whatsNewLabel setFont:[UIFont systemFontOfSize:20]];
    [modalView addSubview:whatsNewLabel];
    
    UIImageView *logo = [[UIImageView alloc] init];
    [logo setContentMode:UIViewContentModeScaleAspectFill];
    [logo setImage:[UIImage imageNamed:@"promopod-logo"]];
    [logo.layer setBackgroundColor:[[UIColor flatNavyBlueColorDark] CGColor]];
    [logo.layer setCornerRadius:30];
    [logo.layer setMasksToBounds:YES];
    [self.view addSubview:logo];
    
    NSString *newsString = [NSString new];
    NSArray *announcements = @[@"Added new Settings Screen w/ Tip Jar.",
                               @"Tip Jar allows you to pay a small fee for Promo Pod's development. Paying the fee will also deactivate all ads.",
                               ];
    
    for (NSString *news in announcements) {
        NSString *ourNews = [NSString stringWithFormat:@"\r\u2022 %@", news];
        newsString = [newsString stringByAppendingString:ourNews];
    }
    
    UILabel *news = [[UILabel alloc] init];
    [news setNumberOfLines:0];
    [news setText:newsString];
    [news setFont:[UIFont systemFontOfSize:14]];
    
    [news setTextColor:[UIColor flatBlackColor]];
    [modalView addSubview:news];
    
    UIView *line = [[UIView alloc] init];
    [line setBackgroundColor:[UIColor flatWhiteColorDark]];
    [modalView addSubview:line];
    
    UILabel *helpText = [[UILabel alloc] init];
    [helpText setText:@"Enjoying Promo Pod?"];
    [helpText setTextColor:[UIColor flatBlackColor]];
    [helpText setFont:[UIFont systemFontOfSize:18]];
    [modalView addSubview:helpText];
    
    UILabel *tellUs = [[UILabel alloc] init];
    [tellUs setText:@"Please tell us how we're doing."];
    [tellUs setTextColor:[UIColor flatBlackColor]];
    [modalView addSubview:tellUs];
    
    UIButton *reviewMe = [UIButton buttonWithType:UIButtonTypeCustom];
    [reviewMe addTarget:self action:@selector(openReview:) forControlEvents:UIControlEventTouchUpInside];
    [reviewMe setBackgroundColor:[UIColor flatSkyBlueColor]];
    [reviewMe setTitleColor:[UIColor flatWhiteColor] forState:UIControlStateNormal];
    [reviewMe setTitle:@"Rate us in the App Store" forState:UIControlStateNormal];
    [reviewMe.layer setCornerRadius:5];
    [modalView addSubview:reviewMe];
    
    UIButton *noThanks = [UIButton buttonWithType:UIButtonTypeCustom];
    [noThanks setTitleColor:[UIColor flatBlackColor] forState:UIControlStateNormal];
    [noThanks addTarget:self action:@selector(hideModal:) forControlEvents:UIControlEventTouchUpInside];
    [noThanks setTitle:@"No Thanks" forState:UIControlStateNormal];
    [modalView addSubview:noThanks];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.left.equalTo(modalView);
        make.right.equalTo(modalView);
        make.top.equalTo(news.mas_bottom).offset(10);
        make.bottom.equalTo(helpText.mas_top).offset(-10);
    }];
    
    [helpText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(modalView);
        make.bottom.equalTo(tellUs.mas_top).offset(-5);
    }];
    
    [tellUs mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(modalView);
        make.bottom.equalTo(reviewMe.mas_top).offset(-10);
    }];
    
    [reviewMe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(modalView);
        make.left.equalTo(modalView).offset(20);
        make.right.equalTo(modalView).offset(-20);
        make.height.equalTo(@40);
        make.bottom.equalTo(noThanks.mas_top);
    }];
    
    [noThanks mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(modalView);
        make.bottom.equalTo(modalView).offset(-10);
    }];
    
    [news mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(whatsNewLabel.mas_bottom);
        make.left.equalTo(modalView).offset(20);
        make.right.equalTo(modalView).offset(-20);
    }];
    
    [whatsNewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(logo.mas_bottom).offset(10);
        make.centerX.equalTo(modalView);
    }];
    
    [logo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(modalView);
        make.bottom.equalTo(modalView.mas_top).offset(35);
        make.width.equalTo(logoSize);
        make.height.equalTo(logoSize);
    }];
   
    [modalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@300);
        make.top.equalTo(self.view).offset(50);
        make.centerX.equalTo(self.view);
    }];
}

- (void)openReview:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"itms-apps://itunes.apple.com/app/id1031827041"]];
}

@end
