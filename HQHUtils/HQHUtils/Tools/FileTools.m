//
//  FileTools.m
//  常用工具类
//
//  Created by quanhao huang on 2019/12/10.
//  Copyright © 2019 quanhao huang. All rights reserved.
//

#import "FileTools.h"

@implementation FileTools

+ (NSString *)getTmpFilePath
{
    return NSTemporaryDirectory();
}

+ (NSString *)getCacheFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return [paths firstObject];
}

+ (NSString *)getDocumentsFailePath
{
    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths firstObject];
}

+ (unsigned long long)getFileSize:(NSString *)url
{
    NSFileManager *file = [NSFileManager defaultManager];
    NSDictionary *dict = [file attributesOfItemAtPath:url error:nil];
    unsigned long long size = [dict fileSize];
    return size;
}

+ (NSString *)bundleFile:(NSString *)file;
{
    return [[NSBundle mainBundle] pathForResource:[file stringByDeletingPathExtension] ofType:[file pathExtension]];
}

+ (BOOL)isExistWithFile:(NSString *)filePath
{
    if (filePath && filePath.length > 0) {
        
      return   [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    }
    else
    {
        return NO;
    }
}

+ (BOOL)deleteTheFileWithFilePath:(NSString *)filepath
{
    if (filepath && filepath.length > 0) {
        return [[NSFileManager defaultManager] removeItemAtPath:filepath error:nil];
    }
    else
    {   // 文件不存在的情况下不需要删除
        return YES;
    }
}

@end
