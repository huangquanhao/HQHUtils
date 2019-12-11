//
//  CodingTools.h
//  常用工具类
//
//  Created by quanhao huang on 2019/12/10.
//  Copyright © 2019 quanhao huang. All rights reserved.
//

/*
（1）MD5加密
（2）base64转换
（3）判断字符串是否为手机号
（4）判断字符串是否为邮箱
（5）身份证号码的匹配
（6）URL匹配
（7）银行卡号的匹配
（8）判断一个对象是否为空(NSNull)  备注：这个做的必要性貌似没有，也可能是这种说法有问题
（9）根据身份证号识别性别
（10）获取当前屏幕的宽度
（11）获取当前屏幕的高度
（12）对URL进行Encode
*/
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <Security/Security.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, IRGender) {
    IRGenderFemale, // 女性
    IRGenderMale,   // 男性
    IRGenderNone,   // 未知
};
NS_ASSUME_NONNULL_BEGIN

@interface CodingTools : NSObject

#pragma mark - MD5加密
/**
 MD5加密
 */
+ (NSString *)MD5WithString:(NSString *)string;

#pragma mark - base64编码 数据
/**
 base64编码 数据
 */
+ (NSString *)stringByEncodeData:(NSData *)data;

#pragma mark - base64解码 数据s
/**
 base64解码 数据
 */
+ (NSData *)decodeString:(NSString *)string;

#pragma mark - 判断字符串是否为手机号
/**
 判断字符串是否为手机号
 */
+ (BOOL)isAvailablePhone:(NSString *)phone;

#pragma mark - 判断字符串是否为邮箱
/**
 判断字符串是否为邮箱
 */
+ (BOOL)isAvailableEmail:(NSString *)email;

#pragma mark - 判断字符串是否为标准URL
/**
 判断字符串是否为标准URL
 */
+ (BOOL)isAvailableURL:(NSString *)URL;

#pragma mark - 银行卡号的匹配
/**
 银行卡号的匹配
 */
+ (BOOL)isAvailableBankcard:(NSString *)bankcard;

#pragma mark - 身份证号码的匹配
/**
 身份证号码的匹配
 */
+ (BOOL)isAvailableIDCard:(NSString *)idcard;

#pragma mark - 根据身份证号识别性别
/**
 根据身份证号识别性别
 */
+ (IRGender)identifyGenderWithIDCard:(NSString *)idcard;

#pragma mark - 获取当前屏幕的宽度
/**
 获取当前屏幕的宽度
 */
+ (CGFloat)getScreenWidth;

#pragma mark - 获取当前屏幕的高度
/**
 获取当前屏幕的高度
 */
+ (CGFloat)getScreenHeight;

#pragma mark - 对URL进行Encode
/**
 对URL进行Encode
 */
+ (NSString *)encoderURLWithURLString:(NSString *)urlString;

@end

NS_ASSUME_NONNULL_END
