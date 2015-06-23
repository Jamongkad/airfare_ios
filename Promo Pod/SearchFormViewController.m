//
//  SearchFormViewController.m
//  Promo Pod
//
//  Created by Mathew Wong on 6/21/15.
//  Copyright (c) 2015 YidgetSoft. All rights reserved.
//

#import "SearchFormViewController.h"

@interface SearchFormViewController ()

@end

@implementation SearchFormViewController

- (instancetype)init {
    if(self = [super init]) {
        XLFormDescriptor *formDescriptor = [XLFormDescriptor formDescriptor];
        XLFormSectionDescriptor *section;
        XLFormRowDescriptor *row;
        
        // Basic Information - Section
        section = [XLFormSectionDescriptor formSection];
        [formDescriptor addFormSection:section];
        
        row = [XLFormRowDescriptor formRowDescriptorWithTag:@"Departure" rowType:XLFormRowDescriptorTypeButton title:@"Departure"];
        row.action.viewControllerClass = [DepartureViewController class];
        [section addFormRow:row];
        
        row = [XLFormRowDescriptor formRowDescriptorWithTag:@"Arrival" rowType:XLFormRowDescriptorTypeButton title:@"Arrival"];
        [section addFormRow:row];
        
        return [super initWithForm:formDescriptor];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
