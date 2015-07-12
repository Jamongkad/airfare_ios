//
//  CompareFlightsViewController.m
//  Promo Pod
//
//  Created by Mathew Wong on 7/10/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import "CompareFlightsViewController.h"

@interface CompareFlightsViewController ()

@end

@implementation CompareFlightsViewController

@synthesize flightData;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Compare Flights";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    NSDictionary *flights = self.flightData;
    
    PromosTableViewController *ptvc = [[PromosTableViewController alloc] init];
    [ptvc setSimilarFlights:self.flightData[@"similar_flights"]];
    
    [self addChildViewController:ptvc];
    [self.view addSubview:ptvc.view];
    [ptvc didMoveToParentViewController:self];
    
    NSNumberFormatter *currencyFormat = [[NSNumberFormatter alloc] init];
    [currencyFormat setNumberStyle:NSNumberFormatterCurrencyStyle];
    [currencyFormat setCurrencySymbol:@""];
    
    NSNumber *rate  = [NSNumber numberWithFloat:[flights[@"price"] floatValue]];
    NSString *price = [NSString stringWithFormat:@"%@%@", @"PHP", [currencyFormat stringFromNumber:rate]];
    
    UILabel *priceLabel = [[UILabel alloc] init];
    [priceLabel setText:price];
    [priceLabel setFont:[UIFont systemFontOfSize:40]];
    [self.view addSubview:priceLabel];
    
    UILabel *carrierLabel = [[UILabel alloc] init];
    [carrierLabel setText:flights[@"provider"]];
    [carrierLabel setFont:[UIFont systemFontOfSize:13]];
    [self.view addSubview:carrierLabel];
    
    UILabel *originLabel = [[UILabel alloc] init];
    [originLabel setText:flights[@"origin"]];
    [originLabel setFont:[UIFont systemFontOfSize:32]];
    [self.view addSubview:originLabel];
    
    UILabel *originAirport = [[UILabel alloc] init];
    [originAirport setText:flights[@"origin_airport"]];
    [originAirport setFont:[UIFont systemFontOfSize:13]];
    [self.view addSubview:originAirport];
    
    UILabel *destinationLabel = [[UILabel alloc] init];
    [destinationLabel setText:flights[@"destination"]];
    [destinationLabel setFont:[UIFont systemFontOfSize:32]];
    [self.view addSubview:destinationLabel];
    
    UILabel *destinationAirport = [[UILabel alloc] init];
    [destinationAirport setText:flights[@"destination_airport"]];
    [destinationAirport setFont:[UIFont systemFontOfSize:13]];
    [self.view addSubview:destinationAirport];
    
    UILabel *toLabel = [[UILabel alloc] init];
    [toLabel setText:@"to"];
    [self.view addSubview:toLabel];
    
    UILabel *similarFlights = [[UILabel alloc] init];
    [similarFlights setText:@"Similar Promos"];
    [self.view addSubview:similarFlights];
    
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(50);
        make.centerX.equalTo(self.view);
    }];
    
    [carrierLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(priceLabel.mas_bottom);
        make.centerX.equalTo(priceLabel);
    }];
    
    [originLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(carrierLabel.mas_bottom).offset(20);
        make.centerX.equalTo(priceLabel);
    }];
    
    [originAirport mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(originLabel.mas_bottom);
        make.centerX.equalTo(originLabel);
    }];
    
    [toLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(originAirport.mas_bottom).offset(15);
        make.centerX.equalTo(originAirport);
    }];
    
    [destinationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(toLabel.mas_bottom).offset(10);
        make.centerX.equalTo(toLabel);
    }];
    
    [destinationAirport mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(destinationLabel.mas_bottom);
        make.centerX.equalTo(destinationLabel);
    }];
    
    [similarFlights mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(destinationAirport.mas_bottom).offset(30);
        make.left.equalTo(self.view.mas_left).offset(10);
    }];
    
    [ptvc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(similarFlights.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
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
