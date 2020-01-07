//
//  FileTools.h
//  常用工具类
//
//  Created by quanhao huang on 2019/12/10.
//  Copyright © 2019 quanhao huang. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 文件管理类
（1）获取Tmp文件夹的路径
（2）获取Cache文件夹的路径
（3）获取Documents文件夹的路径
 (4) 判断文件是否存在
（5）根据文件路径删除文件
*/
NS_ASSUME_NONNULL_BEGIN

@interface FileTools : NSObject

#pragma mark - 获取Tmp文件夹的路径
/**
 获取Tmp文件夹的路径
 */
+ (NSString *)getTmpFilePath;

#pragma mark - 获取Cache文件夹的路径
/**
 获取Cache文件夹的路径
 */
+ (NSString *)getCacheFilePath;

#pragma mark - 获取Documents文件夹的路径
/**
 获取Documents文件夹的路径
 */
+ (NSString *)getDocumentsFailePath;

#pragma mark - 获取文件大小
+ (unsigned long long)getFileSize:(NSString *)url;

#pragma mark - 判断文件是否存在
/**
 判断文件是否存在
 */
+ (BOOL)isExistWithFile:(NSString *)filePath;

#pragma mark - 根据文件路径删除文件
/**
 根据文件路径删除文件
 */
+ (BOOL)deleteTheFileWithFilePath:(NSString *)filepath;

@end

NS_ASSUME_NONNULL_END
