//
//  AddProductViewController.h
//  VideoClub
//
//  Created by Alexandra Kouzeli on 05/02/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "ViewController.h"
#import "CustomPickerView.h"

@interface AddProductViewController : ViewController

@property (strong, nonatomic) Product *product;

@property (weak, nonatomic) IBOutlet UITextField *textFieldName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCategory;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCode;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPrice;
@property (weak, nonatomic) IBOutlet CustomPickerView *pkvProductType;
@property (weak, nonatomic) IBOutlet UITextField *textFieldInfo;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCardinality;

@property (strong, nonatomic) IBOutletCollection(CustomTextField) NSArray *textFields;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;

@end