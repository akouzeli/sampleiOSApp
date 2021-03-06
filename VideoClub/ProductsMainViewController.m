//
//  ProductsMainViewController.m
//  VideoClub
//
//  Created by Alexandra Kouzeli on 09/02/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "ProductsMainViewController.h"
#import "ProductsViewController.h"

@interface ProductsMainViewController ()

@property (strong, nonatomic) NSString *selectedMenuOption;

@end

@implementation ProductsMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.menu = @[@"Products", @"Products for Sale", @"Products for Rent"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Choose which products to display, based on the selected menu option.
    ProductsViewController *viewProducts = segue.destinationViewController;
    // Create a new array similar to the self.menu with the keywords "Sale" and "Rent".
    NSArray *productsFor = @[@"All", @"Sale", @"Rent"];
    viewProducts.indexPath = self.selectedIndexPath;
    viewProducts.availableFor = productsFor[self.selectedIndexPath.row];
}


#pragma mark - Table View Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menu.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"menuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.menu[indexPath.row];
    return cell;
}


- (NSIndexPath *)tableView: (UITableView *)tableView willSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    self.selectedMenuOption = self.menu[indexPath.row];
    self.selectedIndexPath = indexPath;
    return self.selectedIndexPath;
}


@end