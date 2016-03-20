//
//  Products.m
//  VideoClub
//
//  Created by Alexandra Kouzeli on 19/03/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface Products : XCTestCase

@end

@implementation Products

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

// Verify that required fields shouldn't be empty.
- (void)testIndicationForEmptyFields {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.tabBars.buttons[@"Products"] tap];
    [app.tables.staticTexts[@"Products"] tap];
    [[[app.navigationBars[@"Products"] childrenMatchingType:XCUIElementTypeButton] elementBoundByIndex:2] tap];
    
    XCUIElement *addProductScrollView = [app.scrollViews containingType:XCUIElementTypeTextField identifier:@"productQuantity"].element;
    [addProductScrollView tap];
    
    // Save emtpy product details.
    XCUIElement *saveButton = app.buttons[@"save"];
    [saveButton tap];
    
    // Verify that exclamation marks are displayed in all required empty fields.
    XCUIElement *nameExclamation = app.textFields[@"productName"].buttons[@"exclamation"];
    XCUIElement *categoryExclamation = app.textFields[@"productCategory"].buttons[@"exclamation"];
    XCUIElement *codeExclamation = app.textFields[@"productCode"].buttons[@"exclamation"];
    XCUIElement *priceExclamation = app.textFields[@"productPrice"].buttons[@"exclamation"];
    XCUIElement *quantityExclamation = app.textFields[@"productQuantity"].buttons[@"exclamation"];
    
    XCTAssertEqual(nameExclamation.exists, 1);
    XCTAssertEqual(categoryExclamation.exists, 1);
    XCTAssertEqual(codeExclamation.exists, 1);
    XCTAssertEqual(priceExclamation.exists, 1);
    XCTAssertEqual(quantityExclamation.exists, 1);
    
    // Check that the new Product was not added.
    XCUIElement *newProduct = app.tables.staticTexts[@""];
    XCTAssertEqual(newProduct.exists, 0);
}



// Verify that when an invalid name is added,
// the error is indicated with an exclamation mark contained in the relevant textfield.
- (void)testAddProduct {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.tabBars.buttons[@"Products"] tap];
    [app.tables.staticTexts[@"Products"] tap];
    [[[app.navigationBars[@"Products"] childrenMatchingType:XCUIElementTypeButton] elementBoundByIndex:2] tap];
    
    // Add a name.
    XCUIElement *productNameTextField = app.textFields[@"productName"];
    [productNameTextField tap];

    [productNameTextField typeText:@"Pro Evolution Soccer PES "];
    XCUIElement *moreNumbersKey = app.keys[@"more, numbers"];
    [moreNumbersKey tap];
    [productNameTextField typeText:@"2012"];
    
    // Add a category.
    XCUIElement *productCategoryTextField = app.textFields[@"productCategory"];
    [productCategoryTextField tap];
    [productCategoryTextField typeText:@"CD"];
    
    // Add a code.
    XCUIElement *productCodeTextField = app.textFields[@"productCode"];
    [productCodeTextField tap];
    [productCodeTextField typeText:@"23"];
    
    // Add a price.
    XCUIElement *productPriceTextField = app.textFields[@"productPrice"];
    [productPriceTextField tap];
    [productPriceTextField typeText:@"23"];
    
    // Choose a product type
    XCUIElement *productTypePicker = app.pickers[@"productType"];
    XCUIElement *rentOrSalePickerWheel = productTypePicker.pickerWheels[@"Rent, 1 of 2"];
    [rentOrSalePickerWheel tap];
    
    // Add info.
    XCUIElement *productInfoTextField = app.textFields[@"productInfo"];
    [productInfoTextField tap];
    [productInfoTextField typeText:@"some text here"];
    
    // Add valid quantity.
    XCUIElement *productQuantityTextField = app.textFields[@"productQuantity"];
    [productQuantityTextField tap];
    [productQuantityTextField typeText:@"12"];
    
    // Save product details.
    XCUIElement *saveButton = app.buttons[@"save"];
    [saveButton tap];
    
    // Verify that all fields are valid.
    XCUIElement *nameExclamation = productNameTextField.buttons[@"exclamation"];
    XCUIElement *categoryExclamation = productCategoryTextField.buttons[@"exclamation"];
    XCUIElement *codeExclamation = productCodeTextField.buttons[@"exclamation"];
    XCUIElement *priceExclamation = productPriceTextField.buttons[@"exclamation"];
    XCUIElement *quantityExclamation = productQuantityTextField.buttons[@"exclamation"];

    
    XCTAssertEqual(nameExclamation.exists, 0);
    XCTAssertEqual(categoryExclamation.exists, 0);
    XCTAssertEqual(codeExclamation.exists, 0);
    XCTAssertEqual(priceExclamation.exists, 0);
    XCTAssertEqual(quantityExclamation.exists, 0);
    
    // Check that the new product was added.
    XCUIElement *newProduct = app.tables.staticTexts[@"Pro Evolution Soccer PES 2012"];
    XCTAssertEqual(newProduct.exists, 1);
    
    // Tap on the new product.
    [app.tables.staticTexts[@"Pro Evolution Soccer PES 2012"] tap];
    
    // Verify that all textfields contain the correct values.
    XCTAssertEqualObjects(productNameTextField.value, @"Pro Evolution Soccer PES 2012");
    XCTAssertEqualObjects(productCategoryTextField.value, @"CD");
    XCTAssertEqualObjects(productCodeTextField.value, @"23");
    XCTAssertEqualObjects(productPriceTextField.value, @"23");
    XCTAssertEqualObjects(rentOrSalePickerWheel.value, @"Rent, 1 of 2");
    XCTAssertEqualObjects(productInfoTextField.value, @"some text here");
    XCTAssertEqualObjects(productQuantityTextField.value, @"12");

}

// Test that required fields during "Edit" should be valid,
// in order a product's details to be saved.
- (void)testIndicationForInvalidDetailsOnEdit {
    // Add a new product.
    [self testAddProduct];
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    XCUIElement *productNameTextField = app.textFields[@"productName"];
    XCUIElement *productCategoryTextField = app.textFields[@"productCategory"];
    XCUIElement *productCodeTextField = app.textFields[@"productCode"];
    XCUIElement *productPriceTextField = app.textFields[@"productPrice"];
    XCUIElement *productQuantityTextField = app.textFields[@"productQuantity"];
    
    // Edit product's details.
    [productNameTextField tap];
    [productNameTextField.buttons[@"Clear text"] tap];
    [productCategoryTextField tap];
    [productCategoryTextField.buttons[@"Clear text"] tap];
    [productCodeTextField tap];
    [productCodeTextField.buttons[@"Clear text"] tap];
    [productPriceTextField tap];
    [productPriceTextField.buttons[@"Clear text"] tap];
    [productQuantityTextField tap];
    [productQuantityTextField.buttons[@"Clear text"] tap];
    
    XCUIElement *editProductScrollView = [app.scrollViews containingType:XCUIElementTypeTextField identifier:@"productName"].element;
    [editProductScrollView tap];
    
    // Save product details.
    XCUIElement *saveButton = app.buttons[@"save"];
    
    [saveButton tap];
    
    [editProductScrollView tap];
    [editProductScrollView tap];
    
    // Verify that an exclamation mark is displayed in the invalid textfield.
    XCUIElement *nameExclamation = productNameTextField.buttons[@"exclamation"];
    XCUIElement *categoryExclamation = productCategoryTextField.buttons[@"exclamation"];
    XCUIElement *codeExclamation = productCodeTextField.buttons[@"exclamation"];
    XCUIElement *priceExclamation = productPriceTextField.buttons[@"exclamation"];
    XCUIElement *quantityExclamation = productQuantityTextField.buttons[@"exclamation"];
    
    XCTAssertEqual(nameExclamation.exists, 1);
    XCTAssertEqual(categoryExclamation.exists, 1);
    XCTAssertEqual(codeExclamation.exists, 1);
    XCTAssertEqual(priceExclamation.exists, 1);
    XCTAssertEqual(quantityExclamation.exists, 1);
    
    // Check that the current product was not updated.
    XCUIElement *newProduct = app.tables.staticTexts[@""];
    XCTAssertEqual(newProduct.exists, 0);
}

// Edit a product's details.
- (void)testEditProduct {
    [self testAddProduct];
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    XCUIElement *productNameTextField = app.textFields[@"productName"];
    XCUIElement *productCategoryTextField = app.textFields[@"productCategory"];
    XCUIElement *productCodeTextField = app.textFields[@"productCode"];
    XCUIElement *productPriceTextField = app.textFields[@"productPrice"];
    XCUIElement *productInfoTextField = app.textFields[@"productInfo"];
    XCUIElement *productQuantityTextField = app.textFields[@"productQuantity"];
    
    // Edit product's details.
    [productNameTextField tap];
    [productNameTextField.buttons[@"Clear text"] tap];
    [productNameTextField typeText:@"Legends of Troy"];
    
    [productCategoryTextField tap];
    [productCategoryTextField.buttons[@"Clear text"] tap];
    [productCategoryTextField typeText:@"DVD"];
    
    [productCodeTextField tap];
    [productCodeTextField.buttons[@"Clear text"] tap];
    [productCodeTextField typeText:@"12"];
    
    [productPriceTextField tap];
    [productPriceTextField.buttons[@"Clear text"] tap];
    [productPriceTextField typeText:@"22"];
    
    [productInfoTextField tap];
    [productInfoTextField.buttons[@"Clear text"] tap];
    [productInfoTextField typeText:@"new text"];
    
    [productQuantityTextField tap];
    [productQuantityTextField.buttons[@"Clear text"] tap];
    [productQuantityTextField typeText:@"1"];
    
    // Save product details.
    XCUIElement *saveButton = app.buttons[@"save"];
    [saveButton tap];
    
    // Verify that all fields are valid.
    XCUIElement *nameExclamation = productNameTextField.buttons[@"exclamation"];
    XCUIElement *categoryExclamation = productCategoryTextField.buttons[@"exclamation"];
    XCUIElement *codeExclamation = productCodeTextField.buttons[@"exclamation"];
    XCUIElement *priceExclamation = productPriceTextField.buttons[@"exclamation"];
    XCUIElement *quantityExclamation = productQuantityTextField.buttons[@"exclamation"];
    
    XCTAssertEqual(nameExclamation.exists, 0);
    XCTAssertEqual(categoryExclamation.exists, 0);
    XCTAssertEqual(codeExclamation.exists, 0);
    XCTAssertEqual(priceExclamation.exists, 0);
    XCTAssertEqual(quantityExclamation.exists, 0);
    
    // Check that the product was updated.
    XCUIElement *newProduct = app.tables.staticTexts[@"Legends of Troy"];
    XCTAssertEqual(newProduct.exists, 1);
    
    // Tap on the new product.
    [app.tables.staticTexts[@"Legends of Troy"] tap];
    
    // Verify that all textfields contain the correct values.
    XCTAssertEqualObjects(productNameTextField.value, @"Legends of Troy");
    XCTAssertEqualObjects(productCategoryTextField.value, @"DVD");
    XCTAssertEqualObjects(productCodeTextField.value, @"12");
    XCTAssertEqualObjects(productPriceTextField.value, @"22");
    XCTAssertEqualObjects(productInfoTextField.value, @"new text");
    XCTAssertEqualObjects(productQuantityTextField.value, @"1");

    
}
@end
