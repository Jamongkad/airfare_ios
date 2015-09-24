//
//  FilterViewController.m
//  Promo Pod
//
//  Created by Mathew Wong on 9/19/15.
//  Copyright © 2015 YidgetSoft. All rights reserved.
//

#import "FilterViewController.h"

@interface FilterViewController ()
@property (nonatomic, strong) NSMutableArray *providers;
@property (nonatomic, strong) NSMutableArray *selected;
@end

@implementation FilterViewController

extern NSString * const FilterCell = @"FilterCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
    [self.tableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [self.tableView setBackgroundColor:[UIColor flatSkyBlueColorDark]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:FilterCell];
    self.selected = [[NSMutableArray alloc] init];
    [self pullProviders];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    switch (section) {
        case 0:
            return [self.providers count];
        default:
            return 0;
    }
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return @"Providers";
        default:
            return nil;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 56.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:FilterCell];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell setBackgroundColor:[UIColor whiteColor]];
    
    switch (indexPath.section) {
        case 0:
            if([self.providers count] > 0) {
                NSDictionary *providerData = [self.providers objectAtIndex:indexPath.row];
                NSString *airline;
                
                if([[providerData objectForKey:@"provider"] isEqualToString:@"airasia"]) {
                    airline = @"Air Asia";
                }
                
                if([[providerData objectForKey:@"provider"] isEqualToString:@"cebupac"]) {
                
                    airline = @"Cebu Pacific";
                }
                
                if([[providerData objectForKey:@"provider"] isEqualToString:@"jetstar"]) {
                    airline = @"JetStar";
                }
                
                if([[providerData objectForKey:@"provider"] isEqualToString:@"tigerair"]) {
                    airline = @"Tiger Air";
                }
                
                [cell.textLabel setText:airline];
            }
            break;
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch(indexPath.section) {
        case 0:
            if([self.providers count] > 0) {
                NSDictionary *providerData = [self.providers objectAtIndex:indexPath.row];
                NSString *filterChoices = [providerData objectForKey:@"provider"];
                
                UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
                if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
                    cell.accessoryType = UITableViewCellAccessoryNone;
                    [self.selected removeObject:filterChoices];
                    
                } else if (cell.accessoryType == UITableViewCellAccessoryNone) {
                    cell.accessoryType = UITableViewCellAccessoryCheckmark;
                    [self.selected addObject:filterChoices];
                    
                }
            }
            break;
        default:
            break;
    }
}


-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    FilterHeaderView * headerView;
    headerView =  [[FilterHeaderView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.bounds), 56.0)];
    [headerView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    [headerView setTitle:[tableView.dataSource tableView:tableView titleForHeaderInSection:section]];
    
    return headerView;
}

- (void)pullProviders {
    self.providers = [[NSMutableArray alloc] init];
    NSString *url = @"http://promopod.gearfish.com/provider";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        for (NSDictionary *provider in responseObject) {
            [self.providers addObject:provider];
        }

        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]
         postNotificationName:@"filteredFlights"
         object:self
       userInfo:@{@"name": @"Mathew rocks!", @"filters": self.selected}
     ];
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
