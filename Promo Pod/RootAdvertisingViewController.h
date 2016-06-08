//
//  RootAdvertisingViewController.h
//  Promo Pod
//
//  Created by Mathew Wong on 08/06/2016.
//  Copyright © 2016 YidgetSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "Common.h"
#import <iAd/iAd.h>
@import GoogleMobileAds;

@interface RootAdvertisingViewController : UIViewController <GADBannerViewDelegate> {
    GADBannerView *gbannerView;
}

- (void)showAds;
@end