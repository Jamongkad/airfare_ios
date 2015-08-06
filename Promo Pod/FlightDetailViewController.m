//
//  FlightDetailViewController.m
//  Promo Pod
//
//  Created by Mathew Wong on 7/10/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import "FlightDetailViewController.h"

@interface FlightDetailViewController ()

@end

@implementation FlightDetailViewController

@synthesize flightDetails;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Flight Details";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    NSLog(@"Flight Details Pwet: %@", self.flightDetails);
    
    NSLog(@"Origin IATA: %@", self.flightDetails[@"org_iata"]);
    NSLog(@"Destination IATA: %@", self.flightDetails[@"des_iata"]);

    // Do any additional setup after loading the view.
}

- (void)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
