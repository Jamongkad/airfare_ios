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
@property (nonatomic, strong) DatabaseController *dbc;
@property (nonatomic, strong) UIView *departureView;
@property (nonatomic, strong) UIView *arrivalView;
@property (nonatomic, strong) UIView *departureLabelContainer;
@property (nonatomic, strong) UIView *arrivalLabelContainer;
@property (nonatomic, strong) UIButton *searchBtn;

@property (nonatomic, strong) UILabel *departureLabel;
@property (nonatomic, strong) UILabel *departureLabelIATA;
@property (nonatomic, strong) UILabel *arrivalLabel;
@property (nonatomic, strong) UILabel *arrivalLabelIATA;

@property (nonatomic, strong) NSDictionary *departureData;
@property (nonatomic, strong) NSDictionary *arrivalData;

@end

@implementation SearchViewController

- (id)init {
    if(self = [super init]) {
        self.dbc = [[DatabaseController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Search Promo Flights";
    
    UIBarButtonItem *dismiss = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
    
    [dismiss setTintColor:[UIColor whiteColor]];
    [self.navigationItem setLeftBarButtonItem:dismiss];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.searchBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.searchBtn setTitle:@"Search" forState:UIControlStateNormal];
    [self.searchBtn setBackgroundColor:[UIColor colorWithComplementaryFlatColorOf:[UIColor flatSkyBlueColor]]];
    [self.searchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.searchBtn addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.searchBtn];
    
    [self.searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@50);
        make.bottom.equalTo(self.view);
        make.width.equalTo(self.view);
    }];
    
    self.departureView = [[UIView alloc] init];
    [self.departureView setBackgroundColor:[UIColor colorWithCSS:@"#2F4F4F"]];
    [self.view addSubview:self.departureView];

    self.arrivalView = [[UIView alloc] init];
    [self.arrivalView setBackgroundColor:[UIColor colorWithCSS:@"#2F4F4F"]];
    [self.view addSubview:self.arrivalView];
    
    [self.departureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(30);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.height.mas_equalTo(130);
        make.width.mas_equalTo(([[UIScreen mainScreen] bounds].size.width/2) - 14);
    }];
    
    [self.arrivalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(30);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.height.equalTo(self.departureView);
        make.width.equalTo(self.departureView);
    }];
    
    UITapGestureRecognizer *departureTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openDeparture:)];
    [self.departureView addGestureRecognizer:departureTap];
    
    UITapGestureRecognizer *arrivalTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openArrival:)];
    [self.arrivalView addGestureRecognizer:arrivalTap];
    
    self.departureLabelContainer = [[UIView alloc] init];
    [self.departureLabelContainer setBackgroundColor:[UIColor colorWithContrastingBlackOrWhiteColorOn:[UIColor colorWithCSS:@"#2F2F2F"] isFlat:YES]];
    [self.departureView addSubview:self.departureLabelContainer];
    
    self.arrivalLabelContainer = [[UIView alloc] init];
    [self.arrivalLabelContainer setBackgroundColor:[UIColor colorWithContrastingBlackOrWhiteColorOn:[UIColor colorWithCSS:@"#2F2F2F"] isFlat:YES]];
    [self.arrivalView addSubview:self.arrivalLabelContainer];
    
    UILabel *arrivalLabel = [[UILabel alloc] init];
    [arrivalLabel setText:@"ARRIVAL"];
    [arrivalLabel setTextAlignment:NSTextAlignmentCenter];
    [arrivalLabel setTextColor:[UIColor colorWithCSS:@"#000"]];
    [self.arrivalLabelContainer addSubview:arrivalLabel];
    
    [arrivalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.arrivalLabelContainer);
    }];
    
    UILabel *departureLabel = [[UILabel alloc] init];
    [departureLabel setText:@"DEPARTURE"];
    [departureLabel setTextAlignment:NSTextAlignmentCenter];
    [departureLabel setTextColor:[UIColor colorWithCSS:@"#000"]];
    [self.departureLabelContainer addSubview:departureLabel];
    
    [departureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.departureLabelContainer);
    }];
    
    [self.departureLabelContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.departureView);
        make.left.equalTo(self.departureView);
        make.right.equalTo(self.departureView);
        make.height.equalTo(@30);
    }];
    
    [self.arrivalLabelContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.arrivalView);
        make.left.equalTo(self.arrivalView);
        make.right.equalTo(self.arrivalView);
        make.height.equalTo(self.departureLabelContainer);
    }];
    
    self.departureLabel = [[UILabel alloc] init];
    self.departureLabelIATA = [[UILabel alloc] init];
    
    self.arrivalLabel = [[UILabel alloc] init];
    self.arrivalLabelIATA = [[UILabel alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSMutableArray *d = [self.dbc getFlightData];
    if([d count] > 0) {
        UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 5);
        
        UIView *departureLabelContainer = [[UIView alloc] init];
        [departureLabelContainer addSubview:self.departureLabel];
        
        UIView *departureIATAContainer = [[UIView alloc] init];
        [departureIATAContainer addSubview:self.departureLabelIATA];
        
        UIView *arrivalLabelContainer = [[UIView alloc] init];
        [arrivalLabelContainer addSubview:self.arrivalLabel];
        
        UIView *arrivalIATAContainer = [[UIView alloc] init];
        [arrivalIATAContainer addSubview:self.arrivalLabelIATA];
        
        [self.departureView addSubview:departureLabelContainer];
        [self.departureView addSubview:departureIATAContainer];
        
        [self.arrivalView addSubview:arrivalLabelContainer];
        [self.arrivalView addSubview:arrivalIATAContainer];
        
        for(id flight in d) {
            if([flight[@"currentFlight"] isEqualToString:@"1"]) {
                
                self.departureData = flight;

                [self.departureLabel setText:flight[@"airport"]];
                [self.departureLabel setNumberOfLines:0];
                [self.departureLabel setTextColor:[UIColor flatSkyBlueColor]];
                [self.departureLabel setFont:[UIFont boldSystemFontOfSize:16]];
                [self.departureLabel setNeedsDisplay];
                
                [self.departureLabelIATA setText:flight[@"iata"]];
                [self.departureLabelIATA setFont:[UIFont systemFontOfSize:14]];
                [self.departureLabelIATA setNumberOfLines:0];
                [self.departureLabelIATA setTextColor:[UIColor flatWhiteColor]];
                [self.departureLabelIATA setTextAlignment:NSTextAlignmentCenter];
            
                [departureLabelContainer mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.departureLabelContainer.mas_bottom);
                    make.left.equalTo(self.departureView);
                    make.bottom.equalTo(self.departureView);
                    make.width.mas_equalTo(self.departureView.frame.size.width * 0.75);
                }];
                
                [departureIATAContainer mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.departureLabelContainer.mas_bottom);
                    make.right.equalTo(self.departureView);
                    make.left.equalTo(departureLabelContainer.mas_right);
                    make.bottom.equalTo(self.departureView);
                }];
            
                [self.departureLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.edges.equalTo(departureLabelContainer).insets(padding);
                }];
                
                [self.departureLabelIATA mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.edges.equalTo(departureIATAContainer).insets(padding);
                }];
            }
           
            if([flight[@"currentFlight"] isEqualToString:@"2"]) {
                
                self.arrivalData = flight;
    
                [self.arrivalLabel setText:flight[@"airport"]];
                [self.arrivalLabel setNumberOfLines:0];
                [self.arrivalLabel setTextColor:[UIColor flatSkyBlueColor]];
                [self.arrivalLabel setFont:[UIFont boldSystemFontOfSize:16]];
                [self.arrivalLabel setNeedsDisplay];
                
                [self.arrivalLabelIATA setText:flight[@"iata"]];
                [self.arrivalLabelIATA setFont:[UIFont systemFontOfSize:14]];
                [self.arrivalLabelIATA setNumberOfLines:0];
                [self.arrivalLabelIATA setTextColor:[UIColor flatWhiteColor]];
                [self.arrivalLabelIATA setTextAlignment:NSTextAlignmentCenter];
                
                [arrivalLabelContainer mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.departureLabelContainer.mas_bottom);
                    make.left.equalTo(self.arrivalView);
                    make.bottom.equalTo(self.arrivalView);
                    make.width.mas_equalTo(self.arrivalView.frame.size.width * 0.75);
                }];
                
                [arrivalIATAContainer mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.departureLabelContainer.mas_bottom);
                    make.right.equalTo(self.arrivalView);
                    make.left.equalTo(arrivalLabelContainer.mas_right);
                    make.bottom.equalTo(self.arrivalView);
                }];
            
                [self.arrivalLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.edges.equalTo(arrivalLabelContainer).insets(padding);
                }];
                
                [self.arrivalLabelIATA mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.edges.equalTo(arrivalIATAContainer).insets(padding);
                }];
                
            }
        }
    }
}

- (void)openDeparture:(id)sender {
    DepartureViewController *dvc = [[DepartureViewController alloc] init];
    [dvc setFlightIdentifier:0];
    [self.navigationController pushViewController:dvc animated:YES];
}

- (void)openArrival:(id)sender {
    DepartureViewController *dvc = [[DepartureViewController alloc] init];
    [dvc setFlightIdentifier:1];
    [self.navigationController pushViewController:dvc animated:YES];
}

- (void)search:(id)sender {
    if(self.departureData && self.arrivalData) {
        NSString *url = [NSString stringWithFormat:@"http://promopod.gearfish.com/departing/%@/arriving/%@", self.departureData[@"location"], self.arrivalData[@"location"]];
        NSString *escapedString = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:escapedString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"%@", responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
    }
    //[self.dbc clearAllFlights];
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
