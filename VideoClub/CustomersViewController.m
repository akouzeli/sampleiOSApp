//
//  ViewController.m
//  VideoClub
//
//  Created by Alexandra Kouzeli on 23/01/16.
//  Copyright © 2016 Alexandra Kouzeli. All rights reserved.
//


#import "CustomersViewController.h"
#import "EditCustomerViewController.h"
#import "AddCustomerViewController.h"

@interface CustomersViewController ()

@property (strong, nonatomic) Customer *selectedCustomer;

@end

@implementation CustomersViewController

#pragma mark - UIViewController Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.resourceDb.customers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customerCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"customerCell"];
    }
    Customer *c = self.resourceDb.customers[indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:14.0];
    cell.textLabel.text = c.fullname;
    return cell;
}

- (NSIndexPath *)tableView: (UITableView *)tableView willSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    self.selectedCustomer = self.resourceDb.customers[indexPath.row];
    return indexPath;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES, since we want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete selected customer and reload data
        self.selectedCustomer = self.resourceDb.customers[indexPath.row];
        [self.resourceDb deleteCustomer:self.selectedCustomer];
        [self.customersTableView reloadData];
    }
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"editCustomer"]) {
        EditCustomerViewController *editCustomerVC = segue.destinationViewController;
        editCustomerVC.customer = self.selectedCustomer;
    }
}

- (IBAction)unwindToCustomersMainView:(UIStoryboardSegue *)sender {
    [self.customersTableView reloadData];
}


@end