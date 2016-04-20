//
//  ReceiptTableNavigationController.m
//  A Waste of Money
//
//  Created by Sally Pang on 2016-04-20.
//  Copyright © 2016 Sally Pang. All rights reserved.
//

#import "ReceiptTableNavigationController.h"
#import "ReceiptTableViewController.h"

@implementation ReceiptTableNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Table" bundle:nil];
    ReceiptTableViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"ReceiptTableViewController"];
    [self setViewControllers:@[controller] animated:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
