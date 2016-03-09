//
//  BaseViewController.m
//  VideoClub
//
//  Created by Alexandra Kouzeli on 30/01/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Create the resourceDb singleton object.
- (DbContent *)resourceDb {
    return [DbContent sharedDbContent];
}

# pragma mark - Methods used in form validation.

// Return YES, if there are any invalid fields
- (BOOL)errorMessagesForFields:(NSArray *)allFields {
    NSString *allErrors = [[NSString alloc] init];
    for (CustomTextField *field in allFields) {
        if (![field isValid]) {
            NSString *errorForInvalidField = field.errorMessage;
            allErrors = [allErrors stringByAppendingString:errorForInvalidField];
        }
    }
    if (!allErrors.length) {
        return NO;
    }
    return YES;
}


# pragma mark - Moving Content That Is Located Under the Keyboard.

- (void)keyboardWasShown:(NSNotification *)aNotification {
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, self.activeTextField.frame.origin) ) {
        [self.scrollView scrollRectToVisible:self.activeTextField.frame animated:YES];
    }
}

// Called when the UIKeyboardWillHideNotification is sent.
- (void)keyboardWillBeHidden:(NSNotification *)aNotification {
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}

- (void)registerForKeyboardNotifications {
    // Register for keyboard notifications.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardDidHideNotification object:nil];
    
}

- (void)unregisterForKeyboardNotifications {
    // Unregister for keyboard notifications.
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
    
}

@end