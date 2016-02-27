//
//  ConsumableProduct.h
//  VideoClub
//
//  Created by Alexandra Kouzeli on 24/01/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "Product.h" 

@interface ConsumableProduct : Product

@property (strong, nonatomic) NSString *movieName;
@property (strong, nonatomic) NSString *movieYear;
@property (strong, nonatomic) NSString *movieCategory;

@end