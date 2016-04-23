//
//  ReceiptTableViewController.m
//  A Waste of Money
//
//  Created by Sally Pang on 2016-04-20.
//  Copyright © 2016 Sally Pang. All rights reserved.
//

#import "ReceiptTableViewController.h"
#import "ReceiptTableViewCell.h"
#import "Colors.h"
#import "Item.h"
#import "ItemDoc.h"
#import "ItemDatabase.h"


@interface ReceiptTableViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property(nonatomic, strong) UIRefreshControl *refresh;

@end

@implementation ReceiptTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *loadItems = [ItemDatabase loadItemDocs];
    self.items = loadItems;
    
    self.refresh = [[UIRefreshControl alloc] init];
    [self.tableView addSubview:self.refresh];
    [self.refresh addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSMutableArray *loadedItems = [ItemDatabase loadItemDocs];
    self.items = loadedItems;
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Functions

- (IBAction)addItem:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"What did you spent this time"
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.textAlignment = NSTextAlignmentCenter;
        textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
        textField.autocorrectionType = UITextAutocorrectionTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.placeholder = NSLocalizedString(@"Name", @"Name");
    }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.textAlignment = NSTextAlignmentCenter;
        textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
        textField.autocorrectionType = UITextAutocorrectionTypeYes;
        textField.returnKeyType = UIReturnKeyDone;
        textField.placeholder = NSLocalizedString(@"Price", @"Price");
    }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.textAlignment = NSTextAlignmentCenter;
        textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
        textField.autocorrectionType = UITextAutocorrectionTypeYes;
        textField.returnKeyType = UIReturnKeyDone;
        textField.placeholder = NSLocalizedString(@"Card", @"Card");
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel")
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction *action) {
                                                         }];
    [alertController addAction:cancelAction];
    
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Add", @"Add")
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction *action) {
                                                           NSLocale *locale = [NSLocale currentLocale];
                                                           NSDate *date = [[NSDate date] descriptionWithLocale:locale];
                                                           ItemDoc *item = [[ItemDoc alloc] initWithName:alertController.textFields[0].text :alertController.textFields[1].text :alertController.textFields[2].text];
                                                           [self.items addObject:item];
                                                           [item saveData];
                                                           NSLog(@"%@", alertController.textFields[0].text);
                                                           [self.tableView reloadData];
                                                       }];
    [alertController addAction:saveAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)refreshTable {
    [self.refresh endRefreshing];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ReceiptTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell" forIndexPath:indexPath];
    ItemDoc *currentItem = [self.items objectAtIndex:indexPath.row];
    cell.nameLabel.text = currentItem.data.name;
    cell.priceLabel.text = currentItem.data.price;
    cell.cardLabel.text = currentItem.data.card;
    
    NSDateFormatter *formatter;
    NSString *dateString;
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM-dd-yyyy"];
    dateString = [formatter stringFromDate:[NSDate date]];
    cell.dateLabel.text = dateString;
    if (!cell) {
        
    }
    if( [indexPath row] % 2)
        [cell setBackgroundColor:[UIColor whiteColor]];
    else
        [cell setBackgroundColor:[UIColor colorFromHexString:@"#c4edc6"]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        ItemDoc *doc = [self.items objectAtIndex:indexPath.row];
        [doc deleteDoc];
        [self.items removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject: indexPath] withRowAnimation:UITableViewRowAnimationBottom];
        [tableView reloadData];
    }
}

@end
