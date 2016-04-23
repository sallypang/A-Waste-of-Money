//
//  ItemDatabase.h
//  A Waste of Money
//
//  Created by Sally Pang on 2016-04-22.
//  Copyright © 2016 Sally Pang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemDatabase : NSObject {
    
}

+ (NSMutableArray *)loadItemDocs;
+ (NSString *)nextDocPath;

@end
