//
//  Rent.h
//  VideoClub
//
//  Created by Alexandra Kouzeli on 24/01/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "Transaction.h"

@interface Rental : Transaction

@property (strong, nonatomic) NSDate *fromDate;
@property(strong, nonatomic) NSDate *toDate;

@end