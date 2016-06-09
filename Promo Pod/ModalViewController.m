//
//  ModalViewController.m
//  Promo Pod
//
//  Created by Mathew Wong on 09/06/2016.
//  Copyright © 2016 YidgetSoft. All rights reserved.
//

#import "ModalViewController.h"

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *closeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideModal:)];
    
    dimBG = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [dimBG setBackgroundColor:[[UIColor flatBlackColorDark] colorWithAlphaComponent:.5f]];
    [dimBG addGestureRecognizer:closeTap];
    [self.view addSubview:dimBG];
    
    modalView = [[UIView alloc] init];
    [modalView setBackgroundColor:[UIColor flatWhiteColor]];
    [modalView.layer setCornerRadius:10.0f];
    [modalView.layer setMasksToBounds:YES];
    [self.view addSubview:modalView];     
}

- (void)hideModal:(id)sender {
    [self.view removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
