//
//  AddCustomerViewController.m
//  VideoClub
//
//  Created by Alexandra Kouzeli on 27/01/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "AddCustomerViewController.h"
#import "CustomersViewController.h"
#import "Customer.h"

@implementation AddCustomerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


# pragma mark - Validating customer's properties

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    // Get the present ViewController.
    self.vc = [self.navigationController visibleViewController];
    NSString *viewControllerClass = NSStringFromClass(self.vc.class);
    
    // Display an alert for invalid entries, while adding a customer.
    if ([viewControllerClass isEqualToString:@"AddCustomerViewController"]) {
        if (textField == self.textFieldName) {
            [self validateNameOrSurname:self.textFieldName.text withAlertMessage:@"Please enter a valid name"];
        } else if (textField == self.textFieldSurname) {
            [self validateNameOrSurname:self.textFieldSurname.text withAlertMessage:@"Please enter a valid surname"];
        } else if (textField == self.textFieldAddress) {
            [self validateAddress:self.textFieldAddress.text withAlertMessage:@"Please enter a valid address"];
        } else if (textField == self.textFieldPhoneNum) {
            [self validatePhoneNumber:self.textFieldPhoneNum.text withAlertMessage:@"Please enter a valid phone number"];
        } else if (textField == self.textFieldEmail) {
            [self validateEmail:self.textFieldEmail.text withAlertMessage:@"Please enter a valid email"];
        }
    }
    return YES;
}


# pragma mark - Navigation

// Check if there are any empty or invalid entries before saving data.
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"customersView"]) {
        // Check if there is an empty textfield.
        NSArray *allFields = @[self.textFieldName.text, self.textFieldSurname.text, self.textFieldAddress.text,
                               self.textFieldPhoneNum.text, self.textFieldEmail.text];
        for (NSString *entry in allFields) {
            if ([entry isEqualToString:@""]) {
                [self displayAlert:@"Please fill in all fields"];
                return NO;
            }
        }
        
        // Check if all entries are valid.
        NSArray *allValidFields = @[
                                    [NSNumber numberWithBool:[self validateNameOrSurname:self.textFieldName.text withAlertMessage:@"Please enter a valid name"]],
                                    [NSNumber numberWithBool:[self validateNameOrSurname:self.textFieldSurname.text withAlertMessage:@"Please enter a valid surname"]],
                                    [NSNumber numberWithBool:[self validateAddress:self.textFieldAddress.text withAlertMessage:@"Please enter a valid address"]],
                                    [NSNumber numberWithBool:[self validatePhoneNumber:self.textFieldPhoneNum.text withAlertMessage:@"Please enter a valid phone number"]],
                                    [NSNumber numberWithBool:[self validateEmail:self.textFieldEmail.text withAlertMessage:@"Please enter a valid email"]]
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
    if ([segue.identifier isEqualToString:@"customersView"]) {
        
        Customer *newCustomer = [[Customer alloc] init];
        newCustomer.name = self.textFieldName.text;
        newCustomer.surname = self.textFieldSurname.text;
        newCustomer.address = self.textFieldAddress.text;
        newCustomer.phoneNum = self.textFieldPhoneNum.text;
        newCustomer.email = self.textFieldEmail.text;
        
        // Save the new customer as soon as the "Save" button is pressed.
        [self.resourceDb saveCustomer:newCustomer];
        self.customer = newCustomer;
    }
}

@end