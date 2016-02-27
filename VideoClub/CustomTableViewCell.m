//
//  CustomTableViewCell.m
//  VideoClub
//
//  Created by Alexandra Kouzeli on 26/02/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        UIFont *custom = [[UIFont alloc] init];
        custom = [UIFont fontWithName:@"Helvetica" size:14];
        self.textLabel.font = custom;
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
