//
//  NSString+Helper.h
//  常用工具类
//
//  Created by quanhao huang on 2019/12/10.
//  Copyright © 2019 quanhao huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*
（1） 判断当前字符串是否为纯数字
（2） 判断当前字符串是否为纯字母
（3） 判断当前字符串是否符合某种规则
（4） 判断当前字符串是否为空
（5） 判断当前字符串是否有空格
（6） 计算当前字符串的宽度
（7） 删除字符串中的某些字符（比如空字符）(备注：单个字符可采用替换的方式进行，本方法针需要替换多个字符的情况)
（8） 获取字符串的长度（区分中英文）N （备注：这个暂时觉得没有什么必要做）
（9） 判断两个字符串的大小 N (备注：这个原本就有方法，所以不需要使用分类的方式进行重新写入)
（10）判断两个纯数字字符串的大小
（11）校验字符串是否满足某个规则下的某个位数（大于，小于，等于）
（12）将字符串反转
（13）字符串替换 (备注：字符串的替换系统有提供对应的方法，不需要再进行一次转调)
（14）16进制转换成2进制
（15）2进制转换成16进制
（16）计算当前字符串的高度
（17）计算当前字符串的宽高
（18）复制字符串
*/

typedef NS_ENUM(NSUInteger, ComparSize) {
    ComparSizeMore, // 大于
    ComparSizeEqual, // 等于
    ComparSizeLess,  // 小于
};

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Helper)

#pragma mark - 判断当前的字符串是否为纯数字
/**
 判断当前的字符串是否为纯数字
 */
- (BOOL)isDigital;

#pragma mark - 判断字符串是否为纯数字
/**
 判断字符串是否为纯数字
 */
+ (BOOL)isDigtalWithString:(NSString *)string;

#pragma mark - 判断当前的字符串是否为纯字母
/**
 判断当前的字符串是否为纯字母
 */
- (BOOL)isLetter;

#pragma mark - 判断字符串是否为纯字母
/**
 判断字符串是否为纯字母
 */
+ (BOOL)isLetterWithString:(NSString *)string;

#pragma mark - 判断当前字符串是否符合某种规则，规则必须使用正则表达式
/**
 判断当前字符串是否符合某种规则，规则必须使用正则表达式
 */
- (BOOL)isMeetTheRules:(NSString *)rules;

#pragma mark - 判断字符串是否符合某种规则，规则必须使用正则表达式
/**
 判断字符串是否符合某种规则，规则必须使用正则表达式
 */
+ (BOOL)isMeetTheRules:(NSString *)rules String:(NSString *)string;

#pragma mark - 判断当前字符串是否为空
/**
 判断当前字符串是否为空
 */
- (BOOL)isEmpty;

#pragma mark - 判断字符串是否为空
/**
 判断字符串是否为空
 */
+ (BOOL)isEmptyWithString:(NSString *)string;

#pragma mark - 判断当前字符串是否有空格
/**
 判断当前字符串是否有空格
 */
- (BOOL)isContainsSpaces;

#pragma mark - 判断字符串是否有空格
/**
 判断字符串是否有空格
 */
+ (BOOL)isContainsSpacesWithString:(NSString *)string;

#pragma mark - 比较当前纯数字字符串和另一个数字字符串的大小
/**
 比较当前纯数字字符串和另一个数字字符串的大小 (备注：这个地方必须保证两个字符串均为纯数字，若不为纯数字，则按照正常的比对方式进行比对即可)
 */
- (NSComparisonResult)compareWithOtherNumberString:(NSString *)numberString;

#pragma mark - 比较两个数字字符串的大小
/**
 比较两个数字字符串的大小 (备注：这个地方必须保证两个字符串均为纯数字，若不为纯数字，则按照正常的比对方式进行比对即可)
 */
- (NSComparisonResult)compareNumberString:(NSString *)oneString  OtherNumberString:(NSString *)twoString;

#pragma mark - 校验当前字符串是否满足某个规则下的某个位数 (返回大于，小于，等于)
/**
 校验当前字符串是否满足某个规则下的某个位数 (返回大于，小于，等于)
 */
- (BOOL)stringLength:(NSUInteger)length compare:(ComparSize)compareRule;

#pragma mark - 校验字符串是否满足某个规则下的某个位数 (返回大于，小于，等于)
/**
 校验字符串是否满足某个规则下的某个位数 (返回大于，小于，等于)
 */
+ (BOOL)string:(NSString *)string
        length:(NSUInteger)length
       compare:(ComparSize)compareRule;


#pragma mark -  删除当前字符串中的某些字符
/**
 删除当前字符串中的某些字符（比如空格）
 */
- (NSString *)deleteCharacters:(NSArray <NSString *>*)characters;

#pragma mark - 删除字符串中的某些字符
/**
 删除字符串中的某些字符（比如空格）
 */
+ (NSString *)deleteCharacters:(NSArray <NSString *>*)characters String:(NSString *)string;

#pragma mark - 将当前字符串反转
/**
 将当前字符串反转
 */
- (NSString *)reversal;

#pragma mark - 将字符串反转
/**
 将字符串反转
 */
+ (NSString *)stringReversalWithString:(NSString *)string;

#pragma mark - 将当前字符串由16进制转换成2进制
/**
 将当前字符串由16进制转换成2进制
 */
- (NSData *)hexConversionToBinary;

#pragma mark - 将字符串由16进制转换成2进制
/**
 将字符串由16进制转换成2进制
 */
+ (NSData *)hexConversionToBinaryWithString:(NSString *)string;

#pragma mark - 将当前字符串由2进制转换成16进制
/**
 将当前字符串由2进制转换成16进制
 */
+ (NSString *)binaryConversionToHexWithData:(NSData *)data;

#pragma mark - 计算当前字符串的宽度
/**
 计算当前字符串的宽度
 */
- (CGFloat)calculateWidthWithMaxHeight:(CGFloat)height font:(UIFont *)font;

#pragma mark - 计算字符串的高度
/**
 计算字符串的高度
 */
+ (CGFloat)calculateWidthWithString:(NSString *)string
                          maxHeight:(CGFloat)height
                               font:(UIFont *)font;

#pragma mark - 计算当前字符串的高度
/**
 计算当前字符串的高度
 */
- (CGFloat)calculateHeightWithMaxWidth:(CGFloat)width font:(UIFont *)font;

#pragma mark - 计算字符串的高度
/**
 计算字符串的高度
 */
+ (CGFloat)calculateHeightWithString:(NSString *)string
                            maxWidth:(CGFloat)width
                                font:(UIFont *)font;

#pragma mark - 计算当前字符串的宽高
/**
 计算当前字符串的宽高
 */
- (CGSize)calculateSizeWithFont:(UIFont *)font;

#pragma mark - 计算字符串的宽高
/**
 计算字符串的宽高
 */
+ (CGSize)calculateSizeWithString:(NSString *)string
                             font:(UIFont *)font;

#pragma mark - 复制当前字符串
/**
 复制当前字符串
 */
- (void)paster;

#pragma mark - 复制字符串
/**
 复制字符串
 */
+ (void)pasterString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
