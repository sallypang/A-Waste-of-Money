//
//  Item.h
//  A Waste of Money
//
//  Created by Sally Pang on 2016-04-22.
//  Copyright © 2016 Sally Pang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject <NSCoding> {
    NSString *_name;
    NSDecimalNumber *_price;
    NSString *_card;
}

@property(copy) NSString *name;
@property(copy) NSDecimalNumber *price;
@property(copy) NSString *card;

- (id)initWithName:(NSString *)name :(NSDecimalNumber *)price :(NSString *)card;

@end
