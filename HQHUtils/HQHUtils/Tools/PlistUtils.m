//
//  PlistUtils.m
//  HQHUtils
//
//  Created by quanhao huang on 2020/1/7.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

#import "PlistUtils.h"

@implementation PlistUtils

+ (void)savePlistFile:(NSDictionary *)userInfo withFileName:(NSString *)fileName
{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    NSString *filepath = [docPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", fileName]];
    [userInfo writeToFile:filepath atomically:YES];
}

+ (NSDictionary *)loadPlistFilewithFileName:(NSString *)fileName
{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    NSString *filepath = [docPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", fileName]];
    NSDictionary *data = [NSDictionary dictionaryWithContentsOfFile:filepath];
    return data;
}

@end
