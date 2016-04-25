//
//  CalendarViewController.m
//  A Waste of Money
//
//  Created by Sally Pang on 2016-04-20.
//  Copyright © 2016 Sally Pang. All rights reserved.
//

#import "CalendarViewController.h"
#import <JTCalendar/JTCalendar.h>

@interface CalendarViewController () <JTCalendarDelegate>

@property (nonatomic, strong) JTCalendarManager *calendarManager;
@property (weak, nonatomic) IBOutlet JTCalendarMenuView *calendarMenuView;
@property (weak, nonatomic) IBOutlet JTVerticalCalendarView *calendarContentView;

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _calendarManager = [JTCalendarManager new];
    _calendarManager.delegate = self;
    
    [_calendarManager setMenuView:_calendarMenuView];
    [_calendarManager setContentView:_calendarContentView];
    [_calendarManager setDate:[NSDate date]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
