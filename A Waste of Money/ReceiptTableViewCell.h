//
//  ReceiptTableViewCell.h
//  A Waste of Money
//
//  Created by Sally Pang on 2016-04-22.
//  Copyright © 2016 Sally Pang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReceiptTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *cardLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end
