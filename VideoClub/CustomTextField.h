//
//  CustomTextField.h
//  VideoClub
//
//  Created by Alexandra Kouzeli on 26/02/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Protocols.h"

@interface CustomTextField : UITextField <ValidationProtocol, UITextFieldDelegate>

@property(nonatomic, strong, readonly) NSString *regex;
@property(nonatomic, strong, readonly) NSString *errorMessage;


@end