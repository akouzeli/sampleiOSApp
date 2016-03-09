//
//  EditProductViewController.m
//  VideoClub
//
//  Created by Alexandra Kouzeli on 17/02/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "EditProductViewController.h"

@interface EditProductViewController ()

@end

@implementation EditProductViewController
@dynamic scrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pkvProductType.availbleOptions = @[@"Rent", @"Sale"];
    
    self.textFieldName.text = self.existingProduct.name;
    self.textFieldCategory.text = self.existingProduct.category;
    self.textFieldCode.text = self.existingProduct.code;
    self.textFieldPrice.text = self.existingProduct.price;
    self.textFieldInfo.text = self.existingProduct.extraInfo;
    self.textFieldCardinality.text = self.existingProduct.cardinality;
    
    // View the product type of the selected product
    NSInteger row = [self.pkvProductType.availbleOptions indexOfObject:self.existingProduct.type];
    [self.pkvProductType selectRow:row inComponent:0 animated:YES];
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

# pragma mark - Navigation

// Check if there are any empty or invalid entries before saving data.
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    // Validate textfields.
    if ([identifier isEqualToString:@"productsView"]) {
        if ([self errorMessagesForFields:self.textFields]) {
            return NO;
        }
    }
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"productsView"]) {
        self.existingProduct.name = self.textFieldName.text;
        self.existingProduct.category = self.textFieldCategory.text;
        self.existingProduct.code = self.textFieldCode.text;
        self.existingProduct.price = self.textFieldPrice.text;
        self.existingProduct.extraInfo = self.textFieldInfo.text;
        self.existingProduct.cardinality = self.textFieldCardinality.text;
        
        // Set the selected type from the UIPicker view.
        NSInteger selectedType = [self.pkvProductType selectedRowInComponent:0];
        self.existingProduct.type = self.pkvProductType.availbleOptions[selectedType];
        
        [self.resourceDb updateProduct:self.existingProduct];
    }
}



@end