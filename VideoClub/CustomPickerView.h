//
//  CustomPickerView.h
//  VideoClub
//
//  Created by Alexandra Kouzeli on 26/02/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomPickerView : UIPickerView <UIPickerViewDelegate, UIPickerViewDataSource>
+ (NSArray *)productTypes;

@property (strong, nonatomic) NSArray *availableProductTypes;


@end