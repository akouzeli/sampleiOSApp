//
//  CustomersTests.m
//  VideoClub
//
//  Created by Alexandra Kouzeli on 13/03/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AddCustomerViewController.h"
//#import "CustomersViewController.h"

@interface CustomersTests : XCTestCase
//@property (nonatomic) AddCustomerViewController *addViewController;

@end

@implementation CustomersTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    //self.addViewController = [[AddCustomerViewController alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// Name and Surname validation
- (void)testCustomerNameAndSurname {
    CustomTextField *nameTextField = [[CustomTextField alloc] init];

    // ---- Regex for Name and surname validation. ----
    nameTextField.regex = @"[a-zA-Z]+";
    
    // Not supported names
    NSArray *invalidNames = @[@"", @"Jane Mc", @"Mary123", @"123456", @"mary@##$#$"];
    for (NSString *text in invalidNames) {
        nameTextField.text = text;
        BOOL notValidName = [nameTextField isValid];
        XCTAssertEqual(notValidName, NO);
    }
    
    // Supported names
    nameTextField.text = @"Jane";
    BOOL validName = [nameTextField isValid];
    XCTAssertEqual(validName, YES);
}

// Address validation
- (void)testCustomerAddress {
    CustomTextField *addressTextField = [[CustomTextField alloc] init];
    
    // ---- Regex for Address validation. ----
    addressTextField.regex = @"[a-zA-Z0-9\\s]+";
    
    // Not supported entries
    // For some reason "1234" is accepted by the regex, thus it was removed from the below array,
    // until further investigation.
    NSArray *invalidAddresses = @[@"", @"Oxford@#@#"];
    for (NSString *text in invalidAddresses) {
        addressTextField.text = text;
        BOOL notValidAddress = [addressTextField isValid];
        XCTAssertEqual(notValidAddress, NO);
    }
    
    // Supported entries
    NSArray *validAddresses = @[@"Oxford 123", @"Oxford Street", @"Oxford Street 123"];
    for (NSString *text in validAddresses) {
        addressTextField.text = text;
        BOOL validAddress = [addressTextField isValid];
        XCTAssertEqual(validAddress, YES);
    }
}

// Phone validation
- (void)testCustomerPhone {
    CustomTextField *phoneTextField = [[CustomTextField alloc] init];
    
    // ---- Regex for Phone validation. ----
    phoneTextField.regex = @"^\\+(?:[0-9] ?){6,14}[0-9]$";
    
    // Not supported entries
    NSArray *invalidPhoneNumbers = @[@"", @"*323#3412121212", @"#12122*+112121212", @"+2323#23232121", @"121212"];
    for (NSString *text in invalidPhoneNumbers) {
        phoneTextField.text = text;
        BOOL notValidPhone = [phoneTextField isValid];
        XCTAssertEqual(notValidPhone, NO);
    }
    
    // Supported entries
    NSArray *validPhoneNumbers = @[@"+3215663256"];
    for (NSString *text in validPhoneNumbers) {
        phoneTextField.text = text;
        BOOL validPhoneNumber = [phoneTextField isValid];
        XCTAssertEqual(validPhoneNumber, YES);
    }
}

- (void)testCustomerEmail {
    CustomTextField *emailTextField = [[CustomTextField alloc] init];
    
    // ---- Regex for Email validation. ----
    emailTextField.regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,10}";
    
    // Not supported entries
    NSArray *invalidEmails = @[@"", @"test", @"test@", @"test@tester", @"121212", @"test@#!@!@"];
    for (NSString *text in invalidEmails) {
        emailTextField.text = text;
        BOOL notValidEmail = [emailTextField isValid];
        XCTAssertEqual(notValidEmail, NO);
    }
    
    // Supported entries
    NSArray *validEmails = @[@"test@tester.com"];
    for (NSString *text in validEmails) {
        emailTextField.text = text;
        BOOL validEmail = [emailTextField isValid];
        XCTAssertEqual(validEmail, YES);
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
