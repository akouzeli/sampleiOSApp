//
//  CustomTextField.m
//  VideoClub
//
//  Created by Alexandra Kouzeli on 26/02/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "CustomTextField.h"

@implementation CustomTextField

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        UIFont *custom = [[UIFont alloc] init];
        custom = [UIFont fontWithName:@"Helvetica" size:14];
        self.font = custom;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
