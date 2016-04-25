//
//  SortItemNavigationController.m
//  A Waste of Money
//
//  Created by Sally Pang on 2016-04-25.
//  Copyright © 2016 Sally Pang. All rights reserved.
//

#import "SortItemNavigationController.h"
#import "SortItemViewController.h"

@implementation SortItemNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Table" bundle:nil];
    SortItemViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"SortItemViewController"];
    [self setViewControllers:@[controller] animated:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
