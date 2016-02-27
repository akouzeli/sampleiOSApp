//
//  DbContent.h
//  VideoClub
//
//  Created by Alexandra Kouzeli on 27/01/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Customer.h"
#import "Product.h"

@interface DbContent : NSObject

+ (DbContent *)sharedDbContent;

@property (strong, nonatomic, readonly) NSMutableArray *customers;
@property (strong, nonatomic, readonly) NSMutableArray *products;

// Methods for managing customers.
- (void)saveCustomer:(Customer *)newCustomer;
- (void)updateCustomer:(Customer *)existingCustomer;
- (void)deleteCustomer:(Customer *)existingCustomer;

// Methods for managing products.
- (void)saveProduct:(Product *)newProduct;
- (void)updateProduct:(Product *)existingProduct;
- (void)deleteProduct:(Product *)existingProduct;

// Select products based on their type (Rent or Sale).
- (NSArray *)products:(NSMutableArray *)products for:(NSString *)use;

@end