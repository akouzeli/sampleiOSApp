//
//  BaseViewController.h
//  VideoClub
//
//  Created by Alexandra Kouzeli on 30/01/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DbContent.h"

@interface BaseViewController : UIViewController

@property (nonatomic, strong, readonly) DbContent *resourceDb;

// Methods for validating a customer's properties.
- (BOOL)validateNameOrSurname:(NSString *)nameOrSurname withAlertMessage:(NSString *)message;
- (BOOL)validateAddress:(NSString *)address withAlertMessage:(NSString *)message;
- (BOOL)validateEmail:(NSString *)email withAlertMessage:(NSString *)message;
- (BOOL)validatePhoneNumber:(NSString *)phone withAlertMessage:(NSString *)message;

// Methods for validating a product's properties.
- (BOOL)validateNumEntry:(NSString *)number withAlertMessage:(NSString *)message;

- (void)displayAlert:(NSString *)message;
@end
