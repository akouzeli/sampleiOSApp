//
//  ProductsMainViewController.h
//  VideoClub
//
//  Created by Alexandra Kouzeli on 09/02/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "BaseViewController.h"

@interface ProductsMainViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *menu;
@property (strong, nonatomic) NSIndexPath *selectedIndexPath;


@end