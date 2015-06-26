//
//  DepartureViewController.m
//  Promo Pod
//
//  Created by Mathew Wong on 6/22/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import "DepartureViewController.h"
#include <stdlib.h>

@interface DepartureViewController ()
@property (nonatomic, strong) SearchResultsTableViewController *srtvc;
@end

@implementation DepartureViewController

@synthesize flightIdentifier;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Flight Identity %ld", self.flightIdentifier);
    
    // Do any additional setup after loading the view.
    if(self.flightIdentifier == 0) {
        self.title = @"Select Departure";
    } else {
        self.title = @"Select Arrival";
    }
   
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UITextField *tf = [[UITextField alloc] init];
    [self.view addSubview:tf];
    [tf setBorderStyle:UITextBorderStyleRoundedRect];
    [tf becomeFirstResponder];
    
    //[tf addTarget:self action:@selector(updateTextLabel:) forControlEvents:UIControlEventEditingChanged];
    [tf addTarget:self action:@selector(enterSearch:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [tf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@60);
    }];
    
    self.srtvc = [[SearchResultsTableViewController alloc] init];
    [self.srtvc setFlightIdentifier:self.flightIdentifier];
    
    [self addChildViewController:self.srtvc];
    [self.view addSubview:self.srtvc.view];
    [self.srtvc didMoveToParentViewController:self];
    
    [self.srtvc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tf.mas_bottom);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
}

- (void)enterSearch:(id)sender {
    
    UITextField *tf = ((UITextField *) sender);
    [self RESTLocationSearch:tf];
    [tf resignFirstResponder];
    
}

- (void)updateTextLabel:(id)sender {
    
    UITextField *tf = ((UITextField *) sender);
    [self RESTLocationSearch:tf];
    
}

- (void)RESTLocationSearch:(UITextField *)tf {

    if([tf.text length] > 0) {
        NSString *url = [NSString stringWithFormat:@"%@%@", @"http://promopod.gearfish.com/location/", [[tf text] stringByReplacingOccurrencesOfString:@" " withString:@""]];
        
        NSLog(@"url %@", url);

        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [self.srtvc setSearchCount:(int)[responseObject count]];
            [self.srtvc setSearchResults:responseObject];
            [self.srtvc.tableView reloadData];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
    
    } else {
        [self.srtvc setSearchCount:0];
    }
    
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
