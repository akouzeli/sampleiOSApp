//
//  Person.h
//  VideoClub
//
//  Created by Alexandra Kouzeli on 24/01/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "Entity.h"

@interface Person : Entity

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *surname;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *phoneNum;
@property (strong, nonatomic) NSString *email;

@property (strong, nonatomic, readonly) NSString *fullname;

@end