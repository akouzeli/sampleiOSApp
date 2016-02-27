//
//  VCLabel.m
//  VideoClub
//
//  Created by Alexandra Kouzeli on 30/01/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "CustomLabel.h"

@implementation CustomLabel

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.numberOfLines = 0;
        
        UIFont *custom = [[UIFont alloc] init];
        custom = [UIFont fontWithName:@"Helvetica-Bold" size:14];
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
