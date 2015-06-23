//
//  SearchViewController.m
//  Promo Pod
//
//  Created by Mathew Wong on 6/21/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()
@property (nonatomic, strong) SearchFormViewController *sfvc;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [searchBtn setTitle:@"Search" forState:UIControlStateNormal];
    [searchBtn setBackgroundColor:[UIColor colorWithComplementaryFlatColorOf:[UIColor flatSkyBlueColor]]];
    [searchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchBtn];
    
    self.sfvc = [[SearchFormViewController alloc] init];
    [self addChildViewController:self.sfvc];
    [self.view addSubview:self.sfvc.view];
    [self.sfvc didMoveToParentViewController:self];
    
    [self.sfvc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(searchBtn.mas_top);
    }];
   
    [searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@50);
        make.bottom.equalTo(self.view);
        make.width.equalTo(self.view);
    }];
}

- (void)search:(id)sender {
    NSLog(@"Searching");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
