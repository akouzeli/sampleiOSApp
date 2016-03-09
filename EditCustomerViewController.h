//
//  EditCustomerViewController.h
//  VideoClub
//
//  Created by Alexandra Kouzeli on 31/01/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "ViewController.h"

@interface EditCustomerViewController : ViewController

@property(strong, nonatomic) Customer *customer;

@property (weak, nonatomic) IBOutlet UITextField *textFieldName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSurname;
@property (weak, nonatomic) IBOutlet UITextField *textFieldAddress;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPhoneNum;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEmail;

@property (strong, nonatomic) IBOutletCollection(CustomTextField) NSArray *textFields;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;

@end