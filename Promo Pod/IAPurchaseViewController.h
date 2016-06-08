//
//  IAPurchaseViewController.h
//  Promo Pod
//
//  Created by Mathew Wong on 06/06/2016.
//  Copyright © 2016 YidgetSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>
#import <ChameleonFramework/Chameleon.h>
#import "UIColor+HTMLColors.h"
#import "Masonry.h"
#import "Common.h"

@interface IAPurchaseViewController : UIViewController <SKProductsRequestDelegate, SKPaymentTransactionObserver> {
    NSArray *productsArray;
    BOOL transactionInProgress;
    UILabel *loadingText;
}
@end
