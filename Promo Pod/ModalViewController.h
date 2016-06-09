//
//  ModalViewController.h
//  Promo Pod
//
//  Created by Mathew Wong on 09/06/2016.
//  Copyright © 2016 YidgetSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+HTMLColors.h"
#import "Masonry.h"
#import "Chameleon.h"
#import "Common.h"

@interface ModalViewController : UIViewController {
    UIView *dimBG;
    UIView *modalView;
}

- (void)hideModal:(id)sender;
@end
