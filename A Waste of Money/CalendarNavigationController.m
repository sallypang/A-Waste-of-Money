//
//  CalendarNavigationController.m
//  A Waste of Money
//
//  Created by Sally Pang on 2016-04-20.
//  Copyright © 2016 Sally Pang. All rights reserved.
//

#import "CalendarNavigationController.h"
#import "CalendarViewController.h"

@implementation CalendarNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Calendar" bundle:nil];
    CalendarViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"CalendarViewController"];
    [self setViewControllers:@[controller] animated:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
