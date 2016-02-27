//
//  CustomPickerView.m
//  VideoClub
//
//  Created by Alexandra Kouzeli on 26/02/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "CustomPickerView.h"

@implementation CustomPickerView

//- (void)setUp {
//  //  super.d
////    super.dataSource = self;
////    super.delegate = self;

//}

//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:<#frame#>];
////    if ((self = [super initWithFrame:frame])) {
////        [self setUp];
////    }
//    return self;
//}

//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    self = [super initWithCoder:<#aDecoder#>];
//    if ((self) {
//        [self setUp];
//    }
//    return self;
//}

//+ (NSArray *)productTypes {
//    NSArray *availableProductTypes = [[NSArray alloc] initWithObjects:@"Rent", @"Sale", nil];
//    return availableProductTypes;
//
//}
# pragma mark - Picker View

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// Returns the number of rows.
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.availableProductTypes.count;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.availableProductTypes[row];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view {
    UILabel *typeLabel = (UILabel *)view;
        if (!typeLabel) {
            // Change the font size of the pickerview content.
            typeLabel = [[UILabel alloc] init];
            [typeLabel setFont:[UIFont fontWithName:@"Helvetica" size:14.0]];
            typeLabel.numberOfLines=1;
        }
    // Fill the label text here.
    typeLabel.text = [self.availableProductTypes objectAtIndex:row];
    return typeLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



@end
