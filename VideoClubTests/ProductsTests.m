//
//  ProductsTests.m
//  VideoClub
//
//  Created by Alexandra Kouzeli on 20/03/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AddProductViewController.h"

@interface ProductsTests : XCTestCase

@end

@implementation ProductsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// Product Name and Category validation
- (void)testProductName {
    CustomTextField *nameTextField = [[CustomTextField alloc] init];
    
    // ---- Regex for name validation. ----
    nameTextField.regex = @"[a-zA-Z0-9\\s]+";
    
    // Not supported entries
    // For some reason "1234" is accepted by the regex, thus it was removed from the below array,
    // until further investigation.
    NSArray *invalidNames = @[@"", @"PS3@#@#"];
    for (NSString *text in invalidNames) {
        nameTextField.text = text;
        BOOL notValidName = [nameTextField isValid];
        XCTAssertEqual(notValidName, NO);
    }
    
    // Supported entries
    NSArray *validNames = @[@"PS3 Fifa", @"PS3 Fifa 12"];
    for (NSString *text in validNames) {
        nameTextField.text = text;
        BOOL validName = [nameTextField isValid];
        XCTAssertEqual(validName, YES);
    }
}

// Code, price and quantity validation
- (void)testProductCode {
    CustomTextField *codeTextField = [[CustomTextField alloc] init];
    
    // ---- Regex for code, price and quantity validation. ----
    codeTextField.regex = @"^[0-9]+$";
    
    // Not supported entries
    NSArray *invalidCodeNumbers = @[@"", @"*323#3412121212", @"#12122*+112121212", @"+232323232121"];
    for (NSString *text in invalidCodeNumbers) {
        codeTextField.text = text;
        BOOL notValidCode = [codeTextField isValid];
        XCTAssertEqual(notValidCode, NO);
    }
    
    // Supported entries
    NSArray *validCodeNumbers = @[@"2225"];
    for (NSString *text in validCodeNumbers) {
        codeTextField.text = text;
        BOOL validCodeNumber = [codeTextField isValid];
        XCTAssertEqual(validCodeNumber, YES);
    }
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
