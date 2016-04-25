//
//  CalendarViewController.h
//  A Waste of Money
//
//  Created by Sally Pang on 2016-04-20.
//  Copyright © 2016 Sally Pang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JTCalendar/JTCalendar.h>

@interface CalendarViewController : UIViewController <JTCalendarDelegate>

@property (nonatomic, strong) JTCalendarManager *calendarManager;
@property (weak, nonatomic) IBOutlet JTCalendarMenuView *calendarMenuView;
@property (weak, nonatomic) IBOutlet JTHorizontalCalendarView *calendarContentView;

@end
