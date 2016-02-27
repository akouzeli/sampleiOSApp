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

# pragma mark - Methods for validating textfields.

// Validate a customer's name or surname.
- (BOOL)validateNameOrSurname:(NSString *)nameOrSurname withAlertMessage:(NSString *)message {
    NSString *letterRegEx = @"[a-zA-Z]+";
    NSPredicate *letterTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", letterRegEx];
    
    if ([letterTest evaluateWithObject:nameOrSurname]) {
        return YES;
    }
    
    [self displayAlert:message];
    return NO;
}

// Validate a customer's address.
- (BOOL)validateAddress:(NSString *)address withAlertMessage:(NSString *)message {
    NSString *letterAndNumberRegEx = @"[a-zA-Z0-9\\s]+";
    NSPredicate *letterAndNumberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", letterAndNumberRegEx];
    
    if ([letterAndNumberTest evaluateWithObject:address]) {
        return YES;
    }
    
    [self displayAlert:message];
    return NO;
}

// Validate a customer's e-mail address.
- (BOOL)validateEmail:(NSString *)email withAlertMessage:(NSString *)message {
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,10}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    if ([emailTest evaluateWithObject:email]) {
        return YES;
    }
    
    [self displayAlert:message];
    return NO;
}

// Validate a customer's phone number.
- (BOOL)validatePhoneNumber:(NSString *)phone withAlertMessage:(NSString *)message {
    // Regular expression for international phone numbers is used below.
    // source: http://blog.stevenlevithan.com/archives/validate-phone-Numberber#r4-3
    NSString *phoneRegEx = @"^\\+(?:[0-9] ?){6,14}[0-9]$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegEx];
    
    if ([phoneTest evaluateWithObject:phone]) {
        return YES;
    }
    
    [self displayAlert:message];
    return NO;
}

// Validate a product's code, cardinality or price using a numeric value.
- (BOOL)validateNumEntry:(NSString *)number withAlertMessage:(NSString *)message {
    NSString *numRegEx = @"^[0-9]*$";
    NSPredicate *numTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numRegEx];
    
    if ([numTest evaluateWithObject:number]) {
        return YES;
    }

    [self displayAlert:message];
    return NO;
}

// Display an alert.
- (void)displayAlert:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


@end