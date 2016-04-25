//
//  AddItemViewController.m
//  A Waste of Money
//
//  Created by Sally Pang on 2016-04-25.
//  Copyright © 2016 Sally Pang. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController() <UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate> {
    UIBarButtonItem *_nextToolBarButton;
    UIBarButtonItem *_previousToolBarButton;
}

@property (nonatomic, weak) UITextField *activeTextField;
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) UIToolbar *inputToolBar;

@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameTextField.inputAccessoryView = self.inputToolBar;
    self.priceTextField.inputAccessoryView = self.inputToolBar;
    self.cardTextField.inputAccessoryView = self.inputToolBar;
    
    self.nameTextField.userInteractionEnabled = YES;
    self.priceTextField.userInteractionEnabled = YES;
    self.cardTextField.userInteractionEnabled = YES;
    
    self.cardTextField.rightView.frame = CGRectMake(0.0, 0.0, 25.0, 20.0);
    self.cardTextField.rightViewMode = UITextFieldViewModeAlways;
    self.cardTextField.rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ArrowDownIcon"]];
    self.cardTextField.rightView.contentMode = UIViewContentModeScaleAspectFit;
    self.cardTextField.inputView = self.pickerView;
}

#pragma mark - Getters / Setters

- (UIPickerView *)pickerView {
    if (!_pickerView) {
        _pickerView = [[UIPickerView alloc] init];
        _pickerView.showsSelectionIndicator = YES;
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
    }
    return _pickerView;
}

- (UIToolbar *)inputToolBar {
    if (!_inputToolBar) {
        _inputToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width, 44.0)];
        _nextToolBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ForwardIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(nextInputViewAction:)];
        _nextToolBarButton.width = 25.0;
        _previousToolBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"BackIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(previousInputViewAction:)];
        _previousToolBarButton.width = 25.0;
        UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissPickerViewAction:)];
        [_inputToolBar setItems:@[_previousToolBarButton, _nextToolBarButton, flexibleSpace, doneButton]];
    }
    return _inputToolBar;
}

- (NSInteger)indexOfParentCell:(UITextField *)textField {
    if (textField == self.nameTextField) {
        return 0;
    }
    else if (textField == self.priceTextField) {
        return 1;
    }
    else if (textField == self.cardTextField) {
        return 2;
    }
    return -1;
}


- (UITextField *)textFieldAtIndex:(NSInteger)index {
    switch (index) {
        case 0:
            return self.nameTextField;
            break;
            
        case 1:
            return self.priceTextField;
            break;
            
        case 2:
            return self.cardTextField;
            break;
            
        default:
            break;
    }
    
    return nil;
}

#pragma mark - Private Functions

- (void)dismissPickerViewAction:(id)sender {
    [self.activeTextField resignFirstResponder];
}

- (void)previousInputViewAction:(id)sender {
    NSInteger index = [self indexOfParentCell:self.activeTextField];
    if (index > 0) {
        UITextField *textField = [self textFieldAtIndex:index-1];
        [textField becomeFirstResponder];
    }
}


- (void)nextInputViewAction:(id)sender {
    NSInteger index = [self indexOfParentCell:self.activeTextField];
    if (index < 2) {
        UITextField *textField = [self textFieldAtIndex:index+1];
        [textField becomeFirstResponder];
    }
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (row == 0) {
        return @"Mastercard";
    } else if (row == 1) {
        return @"Visa";
    } else if (row == 2) {
        return @"Debit";
    }
    return @"Other";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (row == 0) {
        self.cardTextField.text = @"Mastercard";
        return;
    } else if (row == 1) {
        self.cardTextField.text = @"Visa";
        return;
    } else if (row == 2) {
        self.cardTextField.text = @"Debit";
        return;
    }
    self.cardTextField.text = @"None";
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 3;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSInteger index = [self indexOfParentCell:textField];
        _nextToolBarButton.enabled = index < 2;
        _previousToolBarButton.enabled = index > 0;
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        
        if (textField == self.cardTextField) {
            [self.pickerView reloadAllComponents];
            [self.pickerView selectRow:0 inComponent:0 animated:NO];
        }
    });
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.activeTextField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.activeTextField = nil;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.nameTextField) {
        [self.priceTextField becomeFirstResponder];
    }
    else if (textField == self.priceTextField) {
        [self.cardTextField becomeFirstResponder];
    }
    else if (textField == self.cardTextField) {
        [textField resignFirstResponder];
    }
    return YES;
}



@end
