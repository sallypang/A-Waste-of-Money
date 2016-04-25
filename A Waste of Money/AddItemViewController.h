//
//  AddItemViewController.h
//  A Waste of Money
//
//  Created by Sally Pang on 2016-04-25.
//  Copyright © 2016 Sally Pang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddItemViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UITextField *cardTextField;

@end
