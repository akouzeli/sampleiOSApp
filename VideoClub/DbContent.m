//
//  DbContent.m
//  VideoClub
//
//  Created by Alexandra Kouzeli on 27/01/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "DbContent.h"

@interface DbContent()

@property (strong, nonatomic) NSMutableArray *customers;
@property (strong, nonatomic) NSMutableArray *products;


@end

@implementation DbContent

+ (DbContent *)sharedDbContent {
    static DbContent *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] init];
        _sharedInstance.customers = [[NSMutableArray alloc] init];
        _sharedInstance.products = [[NSMutableArray alloc] init];
    });
    
    return _sharedInstance;
}

# pragma mark - Methods for managing Customers

// Add a new customer.
- (void)saveCustomer:(Customer *)newCustomer {
    [self.customers addObject:newCustomer];
}

// Edit an existing customer.
- (void)updateCustomer:(Customer *)existingCustomer {
    NSUInteger index = [self.customers indexOfObject:existingCustomer];
    if (index != NSNotFound) {
        [self.customers replaceObjectAtIndex:index withObject:existingCustomer];
    }
}

// Delete an existing customer.
- (void)deleteCustomer:(Customer *)existingCustomer {
    NSUInteger index = [self.customers indexOfObject:existingCustomer];
    if (index != NSNotFound) {
        [self.customers removeObjectAtIndex:index];
    }
}

# pragma mark - Methods for managing Products

// Add a new product.
- (void)saveProduct:(Product *)newProduct {
    [self.products addObject:newProduct];
}

// Edit an existing product.
- (void)updateProduct:(Product *)existingProduct {
    NSUInteger index = [self.products indexOfObject:existingProduct];
    if (index != NSNotFound) {
        [self.products replaceObjectAtIndex:index withObject:existingProduct];
    }
}

// Delete an existing product.
- (void)deleteProduct:(Product *)existingProduct {
    NSUInteger index = [self.products indexOfObject:existingProduct];
    if (index != NSNotFound) {
        [self.products removeObjectAtIndex:index];
    }
}

// Select products based on their type (Rent or Sale).
- (NSArray *)products:(NSMutableArray *)products for:(NSString *)use {
    NSString *filter = @"%K CONTAINS %@";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:filter, @"type", use];
    NSArray *filteredData = [self.products filteredArrayUsingPredicate:predicate];
    return filteredData;
}

@end