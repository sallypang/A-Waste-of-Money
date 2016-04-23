//
//  ItemDoc.m
//  A Waste of Money
//
//  Created by Sally Pang on 2016-04-22.
//  Copyright © 2016 Sally Pang. All rights reserved.
//

#import "ItemDoc.h"
#import "Item.h"
#import "ItemDatabase.h"

#define kDataKey @"Data"
#define KDataFile @"data.plist"

@implementation ItemDoc

@synthesize data = _data;
@synthesize docPath = _docPath;

- (id)init {
    if ((self = [super init])) {
        
    }
    return self;
}

- (id)initWithDocPath:(NSString *)docPath {
    if ((self = [super init])) {
        _docPath = [docPath copy];
    }
    return self;
}

- (id)initWithName:(NSString *)name :(NSDecimalNumber *)price :(NSString *)card {
    if ((self = [super init])) {
        _data = [[Item alloc] initWithName:name :price :card];
        
    }
    return self;
}

- (void)dealloc {
    _data = nil;
    _docPath = nil;
}

- (BOOL)createDatePath {
    if (_docPath == nil) {
        self.docPath = [ItemDatabase nextDocPath];
    }
    NSError *error;
    BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:_docPath withIntermediateDirectories:YES attributes:nil error:&error];
    if (!success) {
        NSLog(@"Error creating data path: %@", [error localizedDescription]);
    }
    return success;
}

- (Item *)data {
    if (_data != nil) {
        return _data;
    }
    NSString *dataPath = [_docPath stringByAppendingPathComponent:KDataFile];
    NSData *codedData = [[NSData alloc] initWithContentsOfFile:dataPath];
    if (codedData == nil) {
        return nil;
    }
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:codedData];
    _data = [unarchiver decodeObjectForKey:kDataKey];
    [unarchiver finishDecoding];
    return _data;
}

- (void)saveData {
    if (_data == nil) {
        return;
    }
    [self createDatePath];
    NSString *dataPath = [_docPath stringByAppendingPathComponent:KDataFile];
    NSMutableArray *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:_data forKey:kDataKey];
    [archiver finishEncoding];
    [data writeToFile:dataPath atomically:YES];
}

- (void)deleteDoc {
    
    NSError *error;
    BOOL success = [[NSFileManager defaultManager] removeItemAtPath:_docPath error:&error];
    if (!success) {
        NSLog(@"Error removing document path: %@", error.localizedDescription);
    }
    
}


@end
