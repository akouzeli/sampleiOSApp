//
//  AddProductViewController.h
//  VideoClub
//
//  Created by Alexandra Kouzeli on 05/02/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "ViewController.h"

@interface AddProductViewController : ViewController <UITextFieldDelegate>

@property (strong, nonatomic) Product *product;

@property (weak, nonatomic) IBOutlet UITextField *textFieldName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCategory;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCode;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPrice;
@property (weak, nonatomic) IBOutlet UIPickerView *pkvProductType;
@property (weak, nonatomic) IBOutlet UITextField *textFieldInfo;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCardinality;

@property (strong, nonatomic) UIViewController *vc;

@end
