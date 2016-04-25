//
//  CalendarViewController.m
//  A Waste of Money
//
//  Created by Sally Pang on 2016-04-20.
//  Copyright © 2016 Sally Pang. All rights reserved.
//

#import "CalendarViewController.h"


@interface CalendarViewController () {
    NSDate *_dateSelected;
}

@end

@implementation CalendarViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(!self){
        return nil;
    }
    
    self.title = @"Calendar";
    
    return self;
}

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

#pragma mark - CalenderManagerDelegate

- (void)calendar:(JTCalendarManager *)calendar didTouchDayView:(UIView<JTCalendarDay> *)dayView {
    _dateSelected = dayView.date;
    
}

@end
