//
//  EditCustomerViewController.m
//  VideoClub
//
//  Created by Alexandra Kouzeli on 31/01/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "EditCustomerViewController.h"
#import "CustomersViewController.h"

@interface EditCustomerViewController ()

@end

@implementation EditCustomerViewController
@dynamic scrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textFieldName.text = self.customer.name;
    self.textFieldSurname.text = self.customer.surname;
    self.textFieldAddress.text = self.customer.address;
    self.textFieldPhoneNum.text = self.customer.phoneNum;
    self.textFieldEmail.text = self.customer.email;
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
    if ([identifier isEqualToString:@"customersView"]) {
        if ([self errorMessagesForFields:self.textFields]) {
            return NO;
        }
    }
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"customersView"]) {
        self.customer.name = self.textFieldName.text;
        self.customer.surname = self.textFieldSurname.text;
        self.customer.address = self.textFieldAddress.text;
        self.customer.phoneNum = self.textFieldPhoneNum.text;
        self.customer.email = self.textFieldEmail.text;
        
        [self.resourceDb updateCustomer:self.customer];
    }
}
@end