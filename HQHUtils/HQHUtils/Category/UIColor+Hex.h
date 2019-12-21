//
//  UIColor+Hex.h
//  常用工具类
//
//  Created by quanhao huang on 2019/12/10.
//  Copyright © 2019 quanhao huang. All rights reserved.
//

/*

（1）16进制转换为颜色值
（2）颜色值转换为16进制
（3）16进制转换为颜色值（带有不同透明度）
（4）字符串的16进制转换成颜色
（5）获取16进制中的R颜色
（6）获取16进制中的G色
（7）获取16进制中的B色
*/

#import <UIKit/UIKit.h>

#if TARGET_OS_IOS

@interface UIColor (Hex)

#pragma mark - 根据16进制生成颜色
/**
 根据16进制生成颜色
 */
+ (UIColor *)UIColorFromHex:(NSUInteger)rgb alpha:(CGFloat)alpha;

#pragma mark - 根据16进制生成颜色
/**
 根据16进制生成颜色（透明度为1）
 */
+ (UIColor *)UIColorFromHex:(NSUInteger)rgb;

#pragma mark - 根据颜色生成16进制
/**
 根据颜色生成16进制
 返回值： #FFFFFF
 */
+ (NSString *)HexFromUIColor:(UIColor *)color;

#pragma mark - 字符串的16进制转换成字符串
/*
 字符串的16进制转换成字符串
 如：0x125678
 **/
+ (UIColor *)UIColorFormHexString:(NSString *)hexString;

#pragma mark - 获取16进制中的R颜色
/*
 获取16进制中的R颜色
 **/
+ (NSString *)getRColorFromHex:(NSString *)hexString;

#pragma mark - 获取16进制中的G色
/*
 获取16进制中的G色
 **/
+ (NSString *)getGColorFromHex:(NSString *)hexString;

#pragma mark - 获取16进制中的B色
/*
 获取16进制中的B色
 **/
+ (NSString *)getBColorFromHex:(NSString *)hexString;

@end

#endif
