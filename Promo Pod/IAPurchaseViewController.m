//
//  IAPurchaseViewController.m
//  Promo Pod
//
//  Created by Mathew Wong on 06/06/2016.
//  Copyright © 2016 YidgetSoft. All rights reserved.
//

#import "IAPurchaseViewController.h"

@implementation IAPurchaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Settings";
    UIBarButtonItem *dismiss = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                             target:self
                                                                             action:@selector(cancel:)];
    [dismiss setTintColor:[UIColor whiteColor]];
    [self.navigationItem setLeftBarButtonItem:dismiss];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    [self requestProductInfo];
    
    productsArray = [[NSArray alloc] init];
    
    UILabel *tipTitle = [[UILabel alloc] init];
    [tipTitle setText:@"Tip Jar"];
    [tipTitle setNumberOfLines:0];
    [tipTitle setFont:[UIFont boldSystemFontOfSize:20]];
    [tipTitle setTextAlignment:NSTextAlignmentCenter];
    [tipTitle setLineBreakMode:NSLineBreakByWordWrapping];
    [self.view addSubview:tipTitle];
    
    UILabel *tipText = [[UILabel alloc] init];
    [tipText setText:@"Promo Pod relies on your support to fund its development. If you find it useful and has helped you save money "
                      "by finding the best flight promos, please consider supporting the app by leaving a tip in our Tip Jar. "
                      "Any tip given will also remove all advertisements from the app. "
     ];
    [tipText setNumberOfLines:0];
    [tipText setTextAlignment:NSTextAlignmentCenter];
    [tipText setLineBreakMode:NSLineBreakByWordWrapping];
    [self.view addSubview:tipText];
    
    UIButton *genTip = [UIButton buttonWithType:UIButtonTypeCustom];
    [genTip setTitle:@"Tip of US$0.99" forState:UIControlStateNormal];
    [genTip setBackgroundColor:[UIColor flatPowderBlueColorDark]];
    [genTip addTarget:self action:@selector(enableTip:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:genTip];
    
    UIButton *massTip = [UIButton buttonWithType:UIButtonTypeCustom];
    [massTip setTitle:@"Generous Tip of US$1.99" forState:UIControlStateNormal];
    [massTip setBackgroundColor:[UIColor flatForestGreenColor]];
    [massTip addTarget:self action:@selector(enableTip:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:massTip];
    
    [tipTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(40);
        make.centerX.equalTo(self.view);
    }];
    
    [tipText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tipTitle.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
    }];
    
    [genTip mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(massTip.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@55);
    }];
    
    [massTip mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom);
        make.right.equalTo(self.view.mas_right);
        make.left.equalTo(self.view.mas_left);
        make.height.equalTo(@55);
    }];
    
    transactionInProgress = NO;
}

- (void)requestProductInfo {
    if([SKPaymentQueue canMakePayments]) {
        SKProductsRequest *productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:generousTipID]];
        productsRequest.delegate = self;
        [productsRequest start];
    } else {
        NSLog(@"User cannot make payments due to parental controls");
    }
}

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response {
    SKProduct *validProduct = nil;
    
    if([response.products count] > 0) {
        productsArray = response.products;
    } else if(!validProduct) {
        NSLog(@"No products available");
    }
    
    if([response.invalidProductIdentifiers count] > 0) {
        NSLog(@"Invalid Products %@", response.invalidProductIdentifiers.description);
    }
}

- (void)enableTip:(UIButton *)btn {
    if([productsArray count] > 0) {
        if([[btn currentTitle] isEqualToString:@"Tip of US$0.99"]) {
            NSLog(@"Generous Tip");
            [self showActions];
        }
        
        if([[btn currentTitle] isEqualToString:@"Generous Tip of US$1.99"]) {
            NSLog(@"Massive Tip");
            [self showActions];
        }
    }
    
    transactionInProgress = YES;
}

- (void)showActions {

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Thank You!"
                         message:@"Thank you for patronage. Your generosity will go a long way to help further the development of Promo Pod."
                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *buy = [UIAlertAction actionWithTitle:@"Donate" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self purchase:[productsArray objectAtIndex:0]];
    }];
    UIAlertAction *noThanks = [UIAlertAction actionWithTitle:@"No Thanks" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:buy];
    [alertController addAction:noThanks];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)purchase:(SKProduct *)product{
    SKPayment *payment = [SKPayment paymentWithProduct:product];
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions{
    for(SKPaymentTransaction *transaction in transactions){
        switch(transaction.transactionState){
            case SKPaymentTransactionStatePurchasing: NSLog(@"Transaction state -> Purchasing");
                //called when the user is in the process of purchasing, do not add any of your own code here.
                break;
            case SKPaymentTransactionStatePurchased:
                //this is called when the user has successfully purchased the package (Cha-Ching!)
                //[self doRemoveAds]; //you can add your code for what you want to happen when the user buys the purchase here, for this tutorial we use removing ads
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                NSLog(@"Transaction state -> Purchased");
                transactionInProgress = NO;
                break;
            case SKPaymentTransactionStateRestored:
                NSLog(@"Transaction state -> Restored");
                //add the same code as you did from SKPaymentTransactionStatePurchased here
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                transactionInProgress = NO;
                break;
            case SKPaymentTransactionStateFailed:
                //called when the transaction does not finish
                if(transaction.error.code == SKErrorPaymentCancelled){
                    NSLog(@"Transaction state -> Cancelled");
                    //the user cancelled the payment ;(
                }
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                break;
        }
    }
}


- (void)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end