//
//  ProductsViewController.h
//  VideoClub
//
//  Created by Alexandra Kouzeli on 04/02/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "ViewController.h"

@interface ProductsViewController : ViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *productsTable;
@property (strong, nonatomic) NSString *availableFor;

@end
