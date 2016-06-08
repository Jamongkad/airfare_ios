//

//  RootAdvertisingViewController.m
//  Promo Pod
//
//  Created by Mathew Wong on 08/06/2016.
//  Copyright © 2016 YidgetSoft. All rights reserved.
//

#import "RootAdvertisingViewController.h"

static NSString *const kBannerAdUnitID = @"ca-app-pub-9326129526361363/2430107131";

@implementation RootAdvertisingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)showAds {
    bool isAdRemoved = [[NSUserDefaults standardUserDefaults] boolForKey:@"isAdRemoved"];
    NSLog(isAdRemoved ? @"Ad is removed" : @"Ad is not removed");
    
    if(!isAdRemoved) {
        dispatch_async(dispatch_get_main_queue(), ^{
            gbannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeSmartBannerLandscape];
            gbannerView.delegate = self;
            gbannerView.adUnitID = kBannerAdUnitID;
            gbannerView.rootViewController = self;
            
            GADRequest *request = [GADRequest request];
            [request setTestDevices:@[ @"2cce8e1c993d381a0f2e42c8c1eac7f5" ]];
            [gbannerView loadRequest:request];
            [gbannerView setTag:20];
            [self.view addSubview:gbannerView];
            
            [gbannerView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.view);
                make.right.equalTo(self.view);
                make.bottom.equalTo(self.view);
                make.height.equalTo(@50);
            }];
        });
    } else {
        UIView *viewToRemove = [self.view viewWithTag:20];
        [viewToRemove removeFromSuperview];
    }
}

- (void)adViewDidReceiveAd:(GADBannerView *)bannerView {
    bannerView.hidden = NO;
}

- (void)adView:(GADBannerView *)bannerView didFailToReceiveAdWithError:(GADRequestError *)error {
    if(error.localizedDescription) {
        NSLog(@"adView:didFailToReceiveAdWithError: %@", error.localizedDescription);
    } else {
        self.canDisplayBannerAds = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end