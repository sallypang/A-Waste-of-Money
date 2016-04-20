//
//  SettingsNavigationController.m
//  A Waste of Money
//
//  Created by Sally Pang on 2016-04-20.
//  Copyright © 2016 Sally Pang. All rights reserved.
//

#import "SettingsNavigationController.h"
#import "SettingsViewController.h"

@interface SettingsNavigationController ()

@end

@implementation SettingsNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Settings" bundle:nil];
    SettingsViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
    [self setViewControllers:@[controller] animated:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
