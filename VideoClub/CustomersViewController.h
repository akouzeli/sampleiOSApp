//
//  ViewController.h
//  VideoClub
//
//  Created by Alexandra Kouzeli on 23/01/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "ViewController.h"

@interface CustomersViewController : ViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *customersTableView;


@end