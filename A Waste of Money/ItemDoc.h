//
//  ItemDoc.h
//  A Waste of Money
//
//  Created by Sally Pang on 2016-04-22.
//  Copyright © 2016 Sally Pang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Item;

@interface ItemDoc : NSObject {
    Item *_data;
    NSString *_docPath;
}

@property(retain) Item *data;
@property(copy) NSString *docPath;

- (id)init;
- (id)initWithDocPath:(NSString *)docPath;
- (id)initWithName:(NSString *)name : (NSDecimalNumber *)price :(NSString *)card;
- (void)saveData;
- (void)deleteDoc;

@end
