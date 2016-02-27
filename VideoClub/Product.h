//
//  Product.h
//  VideoClub
//
//  Created by Alexandra Kouzeli on 24/01/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "Entity.h"

@interface Product : Entity
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *code;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *category;
@property (strong, nonatomic) NSString *extraInfo;
@property (strong, nonatomic) NSString *cardinality;


@end