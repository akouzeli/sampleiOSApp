//
//  AddCustomer.m
//  VideoClub
//
//  Created by Alexandra Kouzeli on 14/03/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface Customers : XCTestCase

@end

@implementation Customers

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// Verify that when an invalid name is added,
// the error is indicated with an exclamation mark contained in the relevant textfield.
- (void)testIndicationForInvalidNameOnAdd {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[app.navigationBars[@"Customers"] childrenMatchingType:XCUIElementTypeButton] elementBoundByIndex:1] tap];
    
    // Add invalid name.
    XCUIElement *customerNameTextField = app.textFields[@"customerName"];
    [customerNameTextField tap];
    [customerNameTextField typeText:@"Mary Jones"];
    
    // Add valid surname.
    XCUIElement *customerSurnameTextField = app.textFields[@"customerSurname"];
    [customerSurnameTextField tap];
    [customerSurnameTextField typeText:@"Salivan"];
    
    // Add valid address.
    XCUIElement *customerAddressTextField = app.textFields[@"customerAddress"];
    [customerAddressTextField tap];
    [customerAddressTextField typeText:@"Cambridge Rd 23"];
    
    // Add valid phone.
    XCUIElement *customerPhoneTextField = app.textFields[@"customerPhone"];
    [customerPhoneTextField tap];
    XCUIElement *shiftKey = app.keys[@"Shift"];
    [shiftKey tap];
    [shiftKey tap];
    [customerPhoneTextField typeText:@"+306323656963"];

    // Add valid email.
    XCUIElement *customerEmailTextField = app.textFields[@"customerEmail"];
    [customerEmailTextField tap];
    [customerEmailTextField typeText:@"mary@jones.com"];
    
    // Save customer details.
    XCUIElement *saveButton = app.buttons[@"save"];
    [saveButton tap];
    
    XCUIElement *addCustomerScrollView = [app.scrollViews containingType:XCUIElementTypeTextField identifier:@"customerName"].element;
    [addCustomerScrollView tap];
    
    // Verify that an exclamation mark appears inside the name field.
    XCUIElement *nameExclamation = customerNameTextField.buttons[@"exclamation"];
    XCUIElement *surnameExclamation = customerSurnameTextField.buttons[@"exclamation"];
    XCUIElement *addressExclamation = customerAddressTextField.buttons[@"exclamation"];
    XCUIElement *phoneExclamation = customerPhoneTextField.buttons[@"exclamation"];
    XCUIElement *emailExclamation = customerEmailTextField.buttons[@"exclamation"];
    
    XCTAssertEqual(nameExclamation.exists, 1);
    XCTAssertEqual(surnameExclamation.exists, 0);
    XCTAssertEqual(addressExclamation.exists, 0);
    XCTAssertEqual(phoneExclamation.exists, 0);
    XCTAssertEqual(emailExclamation.exists, 0);
    
    // Check that the new customer was not added.
    XCUIElement *newCustomer = app.tables.staticTexts[@"Mary Jones Salivan"];
    XCTAssertEqual(newCustomer.exists, 0);
}

// Verify that when an invalid surname is added,
// the error is indicated with an exclamation mark contained in the relevant textfield.
- (void)testIndicationForInvalidSurnameOnAdd {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[app.navigationBars[@"Customers"] childrenMatchingType:XCUIElementTypeButton] elementBoundByIndex:1] tap];
    
    // Add valid name.
    XCUIElement *customerNameTextField = app.textFields[@"customerName"];
    [customerNameTextField tap];
    [customerNameTextField typeText:@"Mary"];
    
    // Add invalid surname.
    XCUIElement *customerSurnameTextField = app.textFields[@"customerSurname"];
    [customerSurnameTextField tap];
    [customerSurnameTextField typeText:@"Salivan123"];
    
    // Add valid address.
    XCUIElement *customerAddressTextField = app.textFields[@"customerAddress"];
    [customerAddressTextField tap];
    [customerAddressTextField typeText:@"Cambridge Rd 23"];
    
    // Add valid phone.
    XCUIElement *customerPhoneTextField = app.textFields[@"customerPhone"];
    [customerPhoneTextField tap];
    XCUIElement *shiftKey = app.keys[@"Shift"];
    [shiftKey tap];
    [shiftKey tap];
    [customerPhoneTextField typeText:@"+306323656963"];
    
    // Add valid email.
    XCUIElement *customerEmailTextField = app.textFields[@"customerEmail"];
    [customerEmailTextField tap];
    [customerEmailTextField typeText:@"mary@jones.com"];
    
    // Save customer details.
    XCUIElement *saveButton = app.buttons[@"save"];
    [saveButton tap];
    
    XCUIElement *addCustomerScrollView = [app.scrollViews containingType:XCUIElementTypeTextField identifier:@"customerSurname"].element;
    [addCustomerScrollView tap];
    
    
    // Verify that an exclamation mark appears inside the surname field.
    XCUIElement *nameExclamation = customerNameTextField.buttons[@"exclamation"];
    XCUIElement *surnameExclamation = customerSurnameTextField.buttons[@"exclamation"];
    XCUIElement *addressExclamation = customerAddressTextField.buttons[@"exclamation"];
    XCUIElement *phoneExclamation = customerPhoneTextField.buttons[@"exclamation"];
    XCUIElement *emailExclamation = customerEmailTextField.buttons[@"exclamation"];
    
    XCTAssertEqual(nameExclamation.exists, 0);
    XCTAssertEqual(surnameExclamation.exists, 1);
    XCTAssertEqual(addressExclamation.exists, 0);
    XCTAssertEqual(phoneExclamation.exists, 0);
    XCTAssertEqual(emailExclamation.exists, 0);
    
    // Check that the new customer was not added.
    XCUIElement *newCustomer = app.tables.staticTexts[@"Mary Salivan123"];
    XCTAssertEqual(newCustomer.exists, 0);
}

// Verify that when an invalid address is added,
// the error is indicated with an exclamation mark contained in the relevant textfield.
- (void)testIndicationForInvalidAddressOnAdd {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[app.navigationBars[@"Customers"] childrenMatchingType:XCUIElementTypeButton] elementBoundByIndex:1] tap];
    
    // Add valid name.
    XCUIElement *customerNameTextField = app.textFields[@"customerName"];
    [customerNameTextField tap];
    [customerNameTextField typeText:@"Mary"];
    
    // Add valid surname.
    XCUIElement *customerSurnameTextField = app.textFields[@"customerSurname"];
    [customerSurnameTextField tap];
    [customerSurnameTextField typeText:@"Salivan"];
    
    // Add invalid address.
    XCUIElement *customerAddressTextField = app.textFields[@"customerAddress"];
    [customerAddressTextField tap];
    [customerAddressTextField typeText:@"Cambridge 1.2"];
    
    // Add valid phone.
    XCUIElement *customerPhoneTextField = app.textFields[@"customerPhone"];
    [customerPhoneTextField tap];
    XCUIElement *shiftKey = app.keys[@"Shift"];
    [shiftKey tap];
    [shiftKey tap];
    [customerPhoneTextField typeText:@"+306323656963"];
    
    // Add valid email.
    XCUIElement *customerEmailTextField = app.textFields[@"customerEmail"];
    [customerEmailTextField tap];
    [customerEmailTextField typeText:@"mary@jones.com"];
    
    // Save customer details.
    XCUIElement *saveButton = app.buttons[@"save"];
    [saveButton tap];
    
    XCUIElement *addCustomerScrollView = [app.scrollViews containingType:XCUIElementTypeTextField identifier:@"customerAddress"].element;
    [addCustomerScrollView tap];
    
    // Verify that an exclamation mark appears inside the address field.
    XCUIElement *nameExclamation = customerNameTextField.buttons[@"exclamation"];
    XCUIElement *surnameExclamation = customerSurnameTextField.buttons[@"exclamation"];
    XCUIElement *addressExclamation = customerAddressTextField.buttons[@"exclamation"];
    XCUIElement *phoneExclamation = customerPhoneTextField.buttons[@"exclamation"];
    XCUIElement *emailExclamation = customerEmailTextField.buttons[@"exclamation"];
    
    XCTAssertEqual(nameExclamation.exists, 0);
    XCTAssertEqual(surnameExclamation.exists, 0);
    XCTAssertEqual(addressExclamation.exists, 1);
    XCTAssertEqual(phoneExclamation.exists, 0);
    XCTAssertEqual(emailExclamation.exists, 0);
    
    // Check that the new customer was not added.
    XCUIElement *newCustomer = app.tables.staticTexts[@"Mary Salivan"];
    XCTAssertEqual(newCustomer.exists, 0);
}

// Verify that when an invalid phone is added,
// the error is indicated with an exclamation mark contained in the relevant textfield.
- (void)testIndicationForInvalidPhoneOnAdd {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[app.navigationBars[@"Customers"] childrenMatchingType:XCUIElementTypeButton] elementBoundByIndex:1] tap];
    
    // Add valid name.
    XCUIElement *customerNameTextField = app.textFields[@"customerName"];
    [customerNameTextField tap];
    [customerNameTextField typeText:@"Mary"];
    
    // Add valid surname.
    XCUIElement *customerSurnameTextField = app.textFields[@"customerSurname"];
    [customerSurnameTextField tap];
    [customerSurnameTextField typeText:@"Jones"];
    
    // Add valid address.
    XCUIElement *customerAddressTextField = app.textFields[@"customerAddress"];
    [customerAddressTextField tap];
    [customerAddressTextField typeText:@"Cambridge Street"];
    
    // Add invalid phone.
    XCUIElement *customerPhoneTextField = app.textFields[@"customerPhone"];
    [customerPhoneTextField tap];
    [customerPhoneTextField typeText:@"6323656963"];
    
    // Add valid email.
    XCUIElement *customerEmailTextField = app.textFields[@"customerEmail"];
    [customerEmailTextField tap];
    [customerEmailTextField typeText:@"mary@jones.com"];
    
    // Save customer details.
    XCUIElement *saveButton = app.buttons[@"save"];
    [saveButton tap];
    
    XCUIElement *addCustomerScrollView = [app.scrollViews containingType:XCUIElementTypeTextField identifier:@"customerPhone"].element;
    [addCustomerScrollView tap];
    
    // Verify that an exclamation mark appears inside the phone field.
    XCUIElement *nameExclamation = customerNameTextField.buttons[@"exclamation"];
    XCUIElement *surnameExclamation = customerSurnameTextField.buttons[@"exclamation"];
    XCUIElement *addressExclamation = customerAddressTextField.buttons[@"exclamation"];
    XCUIElement *phoneExclamation = customerPhoneTextField.buttons[@"exclamation"];
    XCUIElement *emailExclamation = customerEmailTextField.buttons[@"exclamation"];
    
    XCTAssertEqual(nameExclamation.exists, 0);
    XCTAssertEqual(surnameExclamation.exists, 0);
    XCTAssertEqual(addressExclamation.exists, 0);
    XCTAssertEqual(phoneExclamation.exists, 1);
    XCTAssertEqual(emailExclamation.exists, 0);
    
    // Check that the new customer was not added.
    XCUIElement *newCustomer = app.tables.staticTexts[@"Mary Jones"];
    XCTAssertEqual(newCustomer.exists, 0);
}

// Verify that when an invalid email is added,
// the error is indicated with an exclamation mark contained in the relevant textfield.
- (void)testIndicationForInvalidEmailOnAdd {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[app.navigationBars[@"Customers"] childrenMatchingType:XCUIElementTypeButton] elementBoundByIndex:1] tap];
    
    // Add valid name.
    XCUIElement *customerNameTextField = app.textFields[@"customerName"];
    [customerNameTextField tap];
    [customerNameTextField typeText:@"Mary"];
    
    // Add valid surname.
    XCUIElement *customerSurnameTextField = app.textFields[@"customerSurname"];
    [customerSurnameTextField tap];
    [customerSurnameTextField typeText:@"Jones"];
    
    // Add valid address.
    XCUIElement *customerAddressTextField = app.textFields[@"customerAddress"];
    [customerAddressTextField tap];
    [customerAddressTextField typeText:@"Cambridge Street"];
    
    // Add valid phone.
    XCUIElement *customerPhoneTextField = app.textFields[@"customerPhone"];
    [customerPhoneTextField tap];
    XCUIElement *shiftKey = app.keys[@"Shift"];
    [shiftKey tap];
    [shiftKey tap];
    [customerPhoneTextField typeText:@"+306323656963"];
    
    // Add invalid email.
    XCUIElement *customerEmailTextField = app.textFields[@"customerEmail"];
    [customerEmailTextField tap];
    [customerEmailTextField typeText:@"maryjones.com"];
    
    // Save customer details.
    XCUIElement *saveButton = app.buttons[@"save"];
    [saveButton tap];
    
    XCUIElement *addCustomerScrollView = [app.scrollViews containingType:XCUIElementTypeTextField identifier:@"customerEmail"].element;
    [addCustomerScrollView tap];
    
    // Verify that an exclamation mark appears inside the email field.
    XCUIElement *nameExclamation = customerNameTextField.buttons[@"exclamation"];
    XCUIElement *surnameExclamation = customerSurnameTextField.buttons[@"exclamation"];
    XCUIElement *addressExclamation = customerAddressTextField.buttons[@"exclamation"];
    XCUIElement *phoneExclamation = customerPhoneTextField.buttons[@"exclamation"];
    XCUIElement *emailExclamation = customerEmailTextField.buttons[@"exclamation"];
    
    XCTAssertEqual(nameExclamation.exists, 0);
    XCTAssertEqual(surnameExclamation.exists, 0);
    XCTAssertEqual(addressExclamation.exists, 0);
    XCTAssertEqual(phoneExclamation.exists, 0);
    XCTAssertEqual(emailExclamation.exists, 1);
    
    // Check that the new customer was not added.
    XCUIElement *newCustomer = app.tables.staticTexts[@"Mary Jones"];
    XCTAssertEqual(newCustomer.exists, 0);
}

// Verify that no empty fiels are allowed.
- (void)testIndicationForEmptyFields {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[app.navigationBars[@"Customers"] childrenMatchingType:XCUIElementTypeButton] elementBoundByIndex:1] tap];
    
    XCUIElement *addCustomerScrollView = [app.scrollViews containingType:XCUIElementTypeTextField identifier:@"customerEmail"].element;
    [addCustomerScrollView tap];
    
    // Save emtpy customer details.
    XCUIElement *saveButton = app.buttons[@"save"];
    [saveButton tap];
    
    // Verify that exclamation marks are displayed in all empty fields.
    XCUIElement *nameExclamation = app.textFields[@"customerName"].buttons[@"exclamation"];
    XCUIElement *surnameExclamation = app.textFields[@"customerSurname"].buttons[@"exclamation"];
    XCUIElement *addressExclamation = app.textFields[@"customerAddress"].buttons[@"exclamation"];
    XCUIElement *phoneExclamation = app.textFields[@"customerPhone"].buttons[@"exclamation"];
    XCUIElement *emailExclamation = app.textFields[@"customerEmail"].buttons[@"exclamation"];

    XCTAssertEqual(nameExclamation.exists, 1);
    XCTAssertEqual(surnameExclamation.exists, 1);
    XCTAssertEqual(addressExclamation.exists, 1);
    XCTAssertEqual(phoneExclamation.exists, 1);
    XCTAssertEqual(emailExclamation.exists, 1);
    
    // Check that the new customer was not added.
    XCUIElement *newCustomer = app.tables.staticTexts[@""];
    XCTAssertEqual(newCustomer.exists, 0);
}

// Add a new customer.
- (void)testAddCustomer {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[app.navigationBars[@"Customers"] childrenMatchingType:XCUIElementTypeButton] elementBoundByIndex:1] tap];
    
    // Add valid name.
    XCUIElement *customerNameTextField = app.textFields[@"customerName"];
    [customerNameTextField tap];
    [customerNameTextField typeText:@"Mary"];
    
    // Add valid surname.
    XCUIElement *customerSurnameTextField = app.textFields[@"customerSurname"];
    [customerSurnameTextField tap];
    [customerSurnameTextField typeText:@"Jones"];
    
    // Add valid address.
    XCUIElement *customerAddressTextField = app.textFields[@"customerAddress"];
    [customerAddressTextField tap];
    [customerAddressTextField typeText:@"Cambridge Street"];
    
    // Add valid phone.
    XCUIElement *customerPhoneTextField = app.textFields[@"customerPhone"];
    [customerPhoneTextField tap];
    XCUIElement *shiftKey = app.keys[@"Shift"];
    [shiftKey tap];
    [shiftKey tap];
    [customerPhoneTextField typeText:@"+306323656963"];
    
    // Add invalid email.
    XCUIElement *customerEmailTextField = app.textFields[@"customerEmail"];
    [customerEmailTextField tap];
    [customerEmailTextField typeText:@"mary@jones.com"];
    
    // Save customer details.
    XCUIElement *saveButton = app.buttons[@"save"];
    [saveButton tap];
    
    // Verify that no exclamation marks are displayed in the valid textfields fields.
    XCUIElement *nameExclamation = customerNameTextField.buttons[@"exclamation"];
    XCUIElement *surnameExclamation = customerSurnameTextField.buttons[@"exclamation"];
    XCUIElement *addressExclamation = customerAddressTextField.buttons[@"exclamation"];
    XCUIElement *phoneExclamation = customerPhoneTextField.buttons[@"exclamation"];
    XCUIElement *emailExclamation = customerEmailTextField.buttons[@"exclamation"];
    
    XCTAssertEqual(nameExclamation.exists, 0);
    XCTAssertEqual(surnameExclamation.exists, 0);
    XCTAssertEqual(addressExclamation.exists, 0);
    XCTAssertEqual(phoneExclamation.exists, 0);
    XCTAssertEqual(emailExclamation.exists, 0);
    
    // Check that the new customer was added.
    XCUIElement *newCustomer = app.tables.staticTexts[@"Mary Jones"];
    XCTAssertEqual(newCustomer.exists, 1);
    
    // Tap on the new customer.
    [app.tables.staticTexts[@"Mary Jones"] tap];
    
    // Verify that all textfields contain the correct values.
    XCTAssertEqualObjects(customerNameTextField.value, @"Mary");
    XCTAssertEqualObjects(customerSurnameTextField.value, @"Jones");
    XCTAssertEqualObjects(customerAddressTextField.value, @"Cambridge Street");
    XCTAssertEqualObjects(customerPhoneTextField.value, @"+306323656963");
    XCTAssertEqualObjects(customerEmailTextField.value, @"mary@jones.com");
}

// Test that fields during "Edit" should be valid in order a customer's details to be saved.
- (void)testIndicationForInvalidDetailsOnEdit {
    // Add a new customer.
    [self testAddCustomer];
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    XCUIElement *customerNameTextField = app.textFields[@"customerName"];
    XCUIElement *customerSurnameTextField = app.textFields[@"customerSurname"];
    XCUIElement *customerAddressTextField = app.textFields[@"customerAddress"];
    XCUIElement *customerPhoneTextField = app.textFields[@"customerPhone"];
    XCUIElement *customerEmailTextField = app.textFields[@"customerEmail"];
    
    // Edit customer's details.
    [customerNameTextField tap];
    [customerNameTextField.buttons[@"Clear text"] tap];
    [customerSurnameTextField tap];
    [customerSurnameTextField.buttons[@"Clear text"] tap];
    [customerAddressTextField tap];
    [customerAddressTextField.buttons[@"Clear text"] tap];
    [customerPhoneTextField tap];
    [customerPhoneTextField.buttons[@"Clear text"] tap];
    [customerEmailTextField tap];
    [customerEmailTextField.buttons[@"Clear text"] tap];
    
    XCUIElement *editCustomerScrollView = [app.scrollViews containingType:XCUIElementTypeTextField identifier:@"customerName"].element;
    [editCustomerScrollView tap];
    
    // Save customer details.
    XCUIElement *saveButton = app.buttons[@"save"];
    
    [saveButton tap];
    
    [editCustomerScrollView tap];
    [editCustomerScrollView tap];
    
    // Verify that an exclamation mark is displayed in the invalid textfield.
    XCUIElement *nameExclamation = customerNameTextField.buttons[@"exclamation"];
    XCUIElement *surnameExclamation = customerSurnameTextField.buttons[@"exclamation"];
    XCUIElement *addressExclamation = customerAddressTextField.buttons[@"exclamation"];
    XCUIElement *phoneExclamation = customerPhoneTextField.buttons[@"exclamation"];
    XCUIElement *emailExclamation = customerEmailTextField.buttons[@"exclamation"];
    
    XCTAssertEqual(nameExclamation.exists, 1);
    XCTAssertEqual(surnameExclamation.exists, 1);
    XCTAssertEqual(addressExclamation.exists, 1);
    XCTAssertEqual(phoneExclamation.exists, 1);
    XCTAssertEqual(emailExclamation.exists, 1);
    
    // Check that the current customer was not updated.
    XCUIElement *newCustomer = app.tables.staticTexts[@""];
    XCTAssertEqual(newCustomer.exists, 0);
}

// Edit a customer's details.
- (void)testEditCustomer {
    // Add a new customer.
    [self testAddCustomer];
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    XCUIElement *customerNameTextField = app.textFields[@"customerName"];
    XCUIElement *customerSurnameTextField = app.textFields[@"customerSurname"];
    XCUIElement *customerAddressTextField = app.textFields[@"customerAddress"];
    XCUIElement *customerPhoneTextField = app.textFields[@"customerPhone"];
    XCUIElement *customerEmailTextField = app.textFields[@"customerEmail"];
    
    // Edit customer's name.
    [customerNameTextField tap];
    [customerNameTextField.buttons[@"Clear text"] tap];
    [customerNameTextField typeText:@"Elle"];
    
    // Edit customer's surname.
    [customerSurnameTextField tap];
    [customerSurnameTextField.buttons[@"Clear text"] tap];
    [customerSurnameTextField typeText:@"Salivan"];
     
    // Edit customer's address.
    [customerAddressTextField tap];
    [customerAddressTextField.buttons[@"Clear text"] tap];
    [customerAddressTextField typeText:@"Oxford Street"];
     
    // Edit customer's phone.
    [customerPhoneTextField tap];
    [customerPhoneTextField.buttons[@"Clear text"] tap];
    XCUIElement *shiftKey = app.keys[@"Shift"];
    [shiftKey tap];
    [shiftKey tap];
    [customerPhoneTextField typeText:@"+334343433433"];
     
    // Edit customer's email.
    [customerEmailTextField tap];
    [customerEmailTextField.buttons[@"Clear text"] tap];
    [customerEmailTextField typeText:@"elle@salivan.com"];

    XCUIElement *editCustomerScrollView = [app.scrollViews containingType:XCUIElementTypeTextField identifier:@"customerName"].element;
    [editCustomerScrollView tap];
    
    // Save customer details.
    XCUIElement *saveCustomerButton = app.buttons[@"save"];
    [saveCustomerButton tap];
    
    // Check that the customer's name changed.
    XCUIElement *updatedCustomer = app.tables.staticTexts[@"Elle Salivan"];
    XCTAssertEqual(updatedCustomer.exists, 1);
    
    // Tap on the updated customer.
    [app.tables.staticTexts[@"Elle Salivan"] tap];
    
    // Verify that all textfields contain the correct values.
    XCTAssertEqualObjects(customerNameTextField.value, @"Elle");
    XCTAssertEqualObjects(customerSurnameTextField.value, @"Salivan");
    XCTAssertEqualObjects(customerAddressTextField.value, @"Oxford Street");
    XCTAssertEqualObjects(customerPhoneTextField.value, @"+334343433433");
    XCTAssertEqualObjects(customerEmailTextField.value, @"elle@salivan.com");
    
    // Verify that there are no exclamation marks.
    XCUIElement *nameExclamation = customerNameTextField.buttons[@"exclamation"];
    XCUIElement *surnameExclamation = customerSurnameTextField.buttons[@"exclamation"];
    XCUIElement *addressExclamation = customerAddressTextField.buttons[@"exclamation"];
    XCUIElement *phoneExclamation = customerPhoneTextField.buttons[@"exclamation"];
    XCUIElement *emailExclamation = customerEmailTextField.buttons[@"exclamation"];
    
    XCTAssertEqual(nameExclamation.exists, 0);
    XCTAssertEqual(surnameExclamation.exists, 0);
    XCTAssertEqual(addressExclamation.exists, 0);
    XCTAssertEqual(phoneExclamation.exists, 0);
    XCTAssertEqual(emailExclamation.exists, 0);
}
@end
