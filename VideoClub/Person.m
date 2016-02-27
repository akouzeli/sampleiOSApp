//
//  Person.m
//  VideoClub
//
//  Created by Alexandra Kouzeli on 24/01/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)fullname {
    return [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ - %@", self.entityId, self.fullname];
}

@end