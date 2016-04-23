//
//  Item.m
//  A Waste of Money
//
//  Created by Sally Pang on 2016-04-22.
//  Copyright © 2016 Sally Pang. All rights reserved.
//

#import "Item.h"

@implementation Item

@synthesize name = _name;
@synthesize price = _price;
@synthesize card = _card;

- (id)initWithName:(NSString *)name :(NSDecimalNumber *)price :(NSString *)card {
    self = [super init];
    
    if (self) {
        _name = [name copy];
        _price = [price copy];
        _card = [card copy];
    }
    
    return self;
}

#pragma mark - NSCoding

#define kNameKey @"NameKey"
#define kPriceKey @"PriceKey"
#define kCardKey @"CardKey"

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_name forKey:kNameKey];
    [aCoder encodeObject:_price forKey:kPriceKey];
    [aCoder encodeObject:_card forKey:kCardKey];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    NSString *name = [aDecoder decodeObjectForKey:kNameKey];
    NSString *price = [aDecoder decodeObjectForKey:kPriceKey];
    NSString *card = [aDecoder decodeObjectForKey:kCardKey];
    return [self initWithName:name :price :card];
}


@end
