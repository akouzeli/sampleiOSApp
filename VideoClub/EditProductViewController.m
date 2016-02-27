//
//  EditProductViewController.m
//  VideoClub
//
//  Created by Alexandra Kouzeli on 17/02/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "EditProductViewController.h"

@interface EditProductViewController ()

@property (strong, nonatomic) NSArray *availableProductTypes;

@end

@implementation EditProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.availableProductTypes = [[NSArray alloc] initWithObjects:@"Rent", @"Sale", nil];
    
    self.textFieldName.text = self.existingProduct.name;
    self.textFieldCategory.text = self.existingProduct.category;
    self.textFieldCode.text = self.existingProduct.code;
    self.textFieldPrice.text = self.existingProduct.price;
    self.textFieldInfo.text = self.existingProduct.extraInfo;
    self.textFieldCardinality.text = self.existingProduct.cardinality;
    
    // View the product type of the selected product
    NSInteger row = [self.availableProductTypes indexOfObject:self.existingProduct.type];
    [self.pkvProductType selectRow:row inComponent:0 animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


# pragma mark - Picker View

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// Returns the number of rows.
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.availableProductTypes.count;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.availableProductTypes[row];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view {
    UILabel* typeLabel = (UILabel *)view;
    if (!typeLabel) {
        // Change the font size of the pickerview content.
        typeLabel = [[UILabel alloc] init];
        [typeLabel setFont:[UIFont fontWithName:@"Helvetica" size:14.0]];
        typeLabel.numberOfLines=1;
    }
    // Fill the label text here.
    typeLabel.text=[self.availableProductTypes objectAtIndex:row];
    return typeLabel;
}


# pragma mark - Validating product's properties

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    // Get the present ViewController.
    self.vc = [self.navigationController visibleViewController];
    NSString *viewControllerClass = NSStringFromClass(self.vc.class);
    
    // Display an alert for invalid entries, while adding a customer.
    if ([viewControllerClass isEqualToString:@"EditProductViewController"]) {
        if (textField == self.textFieldCode) {
            [self validateNumEntry:self.textFieldCode.text withAlertMessage:@"Please enter a valid code"];
        } else if (textField == self.textFieldPrice) {
            [self validateNumEntry:self.textFieldPrice.text withAlertMessage:@"Please enter a valid price"];
        } else if (textField == self.textFieldCardinality) {
            [self validateNumEntry:self.textFieldCardinality.text withAlertMessage:@"Please enter a valid cardinality"];
        }
    }
    return YES;
}


# pragma mark - Navigation

// Check if there are any empty or invalid entries before saving data.
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    if ([identifier isEqualToString:@"productsView"]) {
        NSArray *allFields = @[self.textFieldName.text, self.textFieldCategory.text, self.textFieldCode.text,
                               self.textFieldPrice.text, self.textFieldCardinality.text];
        for (NSString *entry in allFields) {
            // Check if there is an empty textfield.
            if ([entry isEqualToString:@""]) {
                [self displayAlert:@"Please fill in all required fields"];
                return NO;
            }
        }
        
        // Check if all entries are valid.
        NSArray *allValidFields = @[
                                    [NSNumber numberWithBool:[self validateNumEntry:self.textFieldCode.text withAlertMessage:@"Please enter a valid code"]],
                                    [NSNumber numberWithBool:[self validateNumEntry:self.textFieldPrice.text withAlertMessage:@"Please enter a valid price"]],
                                    [NSNumber numberWithBool:[self validateNumEntry:self.textFieldCardinality.text withAlertMessage:@"Please enter a valid cardinality"]]
                                    ];
        for (NSString *validEntry in allValidFields) {
            if (![validEntry boolValue]) {
                return NO;
            }
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
        self.existingProduct.type = self.availableProductTypes[selectedType];
        
        [self.resourceDb updateProduct:self.existingProduct];
    }
}



@end