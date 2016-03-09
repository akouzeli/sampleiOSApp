//
//  AddProductViewController.m
//  VideoClub
//
//  Created by Alexandra Kouzeli on 05/02/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "AddProductViewController.h"

@interface AddProductViewController ()
@end

@implementation AddProductViewController
@dynamic scrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pkvProductType.availbleOptions = @[@"Rent", @"Sale"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self registerForKeyboardNotifications];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self unregisterForKeyboardNotifications];
}

#pragma mark - Navigation

// Check if there are any empty or invalid entries before saving data.
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"productsView"]) {
        // Validate textfields.
        if ([self errorMessagesForFields:self.textFields]) {
            return NO;
        }
    }
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"productsView"]) {
        Product *newProduct = [[Product alloc] init];
        newProduct.name = self.textFieldName.text;
        newProduct.category = self.textFieldCategory.text;
        newProduct.code = self.textFieldCode.text;
        newProduct.price = self.textFieldPrice.text;
        newProduct.extraInfo = self.textFieldInfo.text;
        newProduct.cardinality = self.textFieldCardinality.text;
        
        // Set the selected type from the UIPicker view.
        NSInteger selectedType = [self.pkvProductType selectedRowInComponent:0];
        newProduct.type = self.pkvProductType.availbleOptions[selectedType];
        
        // Save the new product
        [self.resourceDb saveProduct:newProduct];
        self.product = newProduct;
    }
}

@end