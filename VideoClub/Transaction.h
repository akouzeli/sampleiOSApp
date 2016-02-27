//
//  Transaction.h
//  VideoClub
//
//  Created by Alexandra Kouzeli on 24/01/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "Entity.h"

@interface Transaction : Entity

@property (strong, nonatomic) NSNumber *customerId;
@property (strong, nonatomic) NSNumber *productId;
@property (strong, nonatomic) NSDate *date;

@end