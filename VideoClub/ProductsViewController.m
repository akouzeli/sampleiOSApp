//
//  ProductsViewController.m
//  VideoClub
//
//  Created by Alexandra Kouzeli on 04/02/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//

#import "ProductsViewController.h"
#import "EditProductViewController.h"

@interface ProductsViewController ()

@property (strong, nonatomic) Product *selectedProduct;


@end

@implementation ProductsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.productsTable.dataSource = self;
//    self.productsTable.delegate = self;
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    


}


#pragma mark - Table View Methods

// Return the number of rows in a particular section.

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = 0;
    if (self.availableFor) {
        // Return the number of products available for Rent or Sale, based on the user's choice.
        NSArray *subsetOfProducts = [self.resourceDb products:self.resourceDb.products for:self.availableFor];
        count = subsetOfProducts.count;
    } else {
        // Return the number of all products.
        count = self.resourceDb.products.count;
    }
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"productCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"productCell"];
    }
    
    Product *p = [[Product alloc] init];
    // Display products based on the user's choice.
    if (self.availableFor) {
        NSArray *subsetOfProducts = [self.resourceDb products:self.resourceDb.products for:self.availableFor];
        p = subsetOfProducts[indexPath.row];
    } else {
        p = self.resourceDb.products[indexPath.row];
    }
    cell.textLabel.text = p.name;
    return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.availableFor) {
        NSArray *subsetOfProducts = [self.resourceDb products:self.resourceDb.products for:self.availableFor];
        self.selectedProduct = subsetOfProducts[indexPath.row];
    } else {
        self.selectedProduct = self.resourceDb.products[indexPath.row];
    }
    return indexPath;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if (self.availableFor) {
            NSArray *subsetOfProducts = [self.resourceDb products:self.resourceDb.products for:self.availableFor];
            self.selectedProduct = subsetOfProducts[indexPath.row];
        } else {
            self.selectedProduct = self.resourceDb.products[indexPath.row];
        }
        // Delete selected product and reload data.
        [self.resourceDb deleteProduct:self.selectedProduct];
        [self.productsTable reloadData];
    }
}


# pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Pass the selected product to the editProduct view controller.
    if ([segue.identifier isEqualToString:@"editProduct"]) {
        EditProductViewController *editProductViewController = segue.destinationViewController;
        editProductViewController.existingProduct = self.selectedProduct;
    }
}

- (IBAction)unwindToProductsView:(UIStoryboardSegue *)sender {
    [self.productsTable reloadData];
}

@end