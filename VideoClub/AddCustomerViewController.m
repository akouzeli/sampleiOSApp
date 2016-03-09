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
@dynamic scrollView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"customersView"]) {
        // Validate textfields.
        if ([self errorMessagesForFields:self.textFields]) {
            return NO;
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