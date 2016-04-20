//
//  ViewController.h
//  A Waste of Money
//
//  Created by Sally Pang on 2016-04-20.
//  Copyright © 2016 Sally Pang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SSTabBarIndex) {
    CalendarViewController = 0,
    ReceiptTableViewController = 1,
    SettingsViewController = 2,
};

@interface MainViewController : UITabBarController

- (BOOL)revertSelectedIndex;
- (void)setTabBarHidden:(BOOL)hidden;
- (void)setTabBarHidden:(BOOL)hidden animated:(BOOL)animated;


@end

