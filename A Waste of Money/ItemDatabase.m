//
//  ItemDatabase.m
//  A Waste of Money
//
//  Created by Sally Pang on 2016-04-22.
//  Copyright © 2016 Sally Pang. All rights reserved.
//

#import "ItemDatabase.h"
#import "ItemDoc.h"

@implementation ItemDatabase

+ (NSString *)getPrivateDocsDir {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    documentsDirectory = [documentsDirectory stringByAppendingPathComponent:@"Private Documents"];
    
    NSError *error;
    [[NSFileManager defaultManager] createDirectoryAtPath:documentsDirectory withIntermediateDirectories:YES attributes:nil error:&error];
    
    return documentsDirectory;
}

+ (NSMutableArray *) loadItemDocs {
    NSString *documentsDirectory = [ItemDatabase getPrivateDocsDir];
    NSError *error;
    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsDirectory error:&error];
    
    if (files == nil) {
        return nil;
    }
    NSMutableArray *retval = [NSMutableArray arrayWithCapacity:files.count];
    for (NSString *file in files) {
        if ([file.pathExtension compare:@"item" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:file];
            ItemDoc *doc = [[ItemDoc alloc] initWithDocPath:fullPath];
            [retval addObject:doc];
        }
    }
    return retval;
}

+ (NSString *)nextDocPath {
    NSString *documentsDirectory = [ItemDatabase getPrivateDocsDir];
    NSError *error;
    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsDirectory error:&error];
    if (files == nil) {
        NSLog(@"Error reading contents of documents directory: %@", [error localizedDescription]);
        return nil;
    }
    
    int maxNumber = 0;
    for (NSString *file in files) {
        if ([file.pathExtension compare:@"item" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            NSString *fileName = [file stringByDeletingPathExtension];
            maxNumber = MAX(maxNumber, fileName.intValue);
        }
    }
    NSString *availableName = [NSString stringWithFormat:@"%d.item", maxNumber+1];
    return [documentsDirectory stringByAppendingPathComponent:availableName];
    
}

@end
