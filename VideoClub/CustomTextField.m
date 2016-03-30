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
        custom = [UIFont fontWithName:@"Helvetica" size:12];
        self.font = custom;
        // Customize the textfield's border.
        self.layer.cornerRadius=8.0f;
        self.layer.masksToBounds=YES;
        self.layer.borderWidth= 0.5f;
        self.layer.borderColor = [[UIColor grayColor]CGColor];
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        self.delegate = self;
    }
    return self;
}


// Check if the content of a textfield is valid, based on the associated regex.
- (BOOL)isValid {
    NSPredicate *validationPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", self.regex];
    if (![validationPredicate evaluateWithObject:self.text]) {
        // If the textfield's content is incorrect, paint its border's red.
        self.layer.borderColor=[[UIColor redColor]CGColor];
        
        // Display an exclamation mark button in the invalid textfield,
        // that does nothing when pressed (at the moment...).
        UIButton* overlayButton = [UIButton buttonWithType:UIButtonTypeCustom];
        overlayButton.accessibilityIdentifier = @"exclamation";
        [overlayButton setImage:[UIImage imageNamed:@"exclamation_mark.png"] forState:UIControlStateNormal];
        [overlayButton addTarget:self action:@selector(displayExplanatoryMessage:) forControlEvents:UIControlEventTouchUpInside];
        overlayButton.frame = CGRectMake(0, 0, 28, 28);
        
        // Place the exclamation mark on the right side of the textfield.
        self.rightView = overlayButton;
        self.rightViewMode = UITextFieldViewModeUnlessEditing;
        return NO;
    } else {
        // If the textfield's content is correct, revert its border's color.
        self.layer.borderColor = [[UIColor grayColor]CGColor];
        self.rightView = UITextFieldViewModeNever;
        return YES;
    }
    return YES;
}


- (NSString *)displayExplanatoryMessage: (UIButton *)sender {
    return self.errorMessage;
}


@end