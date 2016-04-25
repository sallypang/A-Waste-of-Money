//
//  SortItemViewController.m
//  A Waste of Money
//
//  Created by Sally Pang on 2016-04-25.
//  Copyright © 2016 Sally Pang. All rights reserved.
//

#import "SortItemViewController.h"
#import "Colors.h"
#import "ItemDoc.h"
#import "ItemDatabase.h"

@implementation SortItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    [self.nameButton.layer setBackgroundColor:[UIColor whiteColor].CGColor];
    [self.priceButton.layer setBackgroundColor:[UIColor whiteColor].CGColor];
    [self.dateButton.layer setBackgroundColor:[UIColor whiteColor].CGColor];
}

#pragma mark - Private Functionss

- (IBAction)dismissAction:(id)sender {
    [self dismissViewControllerAnimated:self completion:nil];
}

- (IBAction)sortByName:(id)sender {
    NSMutableArray *loadItems = [ItemDatabase loadItemDocs];

    for (int i = 0; i < loadItems.count; i++) {
        NSLog(@"%@", loadItems[i]);
    }
}

- (IBAction)sortByPrice:(id)sender {
}


- (IBAction)sortByDate:(id)sender {
}

@end
