//
//  BaseViewController.h
//  VideoClub
//
//  Created by Alexandra Kouzeli on 30/01/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DbContent.h"
#import "CustomTextField.h"

@interface BaseViewController : UIViewController

@property (strong, nonatomic, readonly) DbContent *resourceDb;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UITextField *activeTextField;

- (BOOL)errorMessagesForFields:(NSArray *)allFields;

- (void)registerForKeyboardNotifications;
- (void)unregisterForKeyboardNotifications;
@end