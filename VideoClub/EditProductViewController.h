//
//  EditProductViewController.h
//  VideoClub
//
//  Created by Alexandra Kouzeli on 17/02/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "ViewController.h"

@interface EditProductViewController : ViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) Product *existingProduct;

@property (weak, nonatomic) IBOutlet UITextField *textFieldName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCategory;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCode;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPrice;
@property (weak, nonatomic) IBOutlet UIPickerView *pkvProductType;

@property (weak, nonatomic) IBOutlet UITextField *textFieldInfo;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCardinality;

@property (strong, nonatomic) UIViewController *vc;

@end