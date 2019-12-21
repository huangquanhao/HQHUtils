//
//  NSAttributedString+Helpers.h
//  常用工具类
//
//  Created by quanhao huang on 2019/12/10.
//  Copyright © 2019 quanhao huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*
 NSAttributeString:   富文本处理类
（1）计算富文本字符串的大小
 1.1 计算富文本字符串宽度
 1.2 计算富文本字符串高度
（2）字符串转换成富文本（带入不同的转换参数）
 2.1 改变指定字体的大小
 2.2 改变指定字体的颜色
 2.3 改变行间距
 2.4 给目标字符串增加下划线
 2.5 设置字符串的首行缩进
 2.6 对目标字符串进行多属性的设置
*/
#if TARGET_OS_IOS

@interface NSAttributedString (Helpers)

#pragma mark - 改变指定字的大小
/**
 改变指定字的大小
 originString -> 原字符串
 targetString -> 目标字符串
 font -> 目标大小
 */
+ (NSAttributedString *)changeFontWithOriginString:(NSString *)originString
                                         orginFont:(UIFont *)originFont
                                      targetString:(NSString *)targetString
                                        targetFont:(UIFont *)targetFont;

#pragma mark - 改变指定字的颜色
/**
 改变指定字的颜色
 originString -> 原字符串
 targetString -> 目标字符串
 color -> 目标颜色
 */
+ (NSAttributedString *)changeColorWithOriginString:(NSString *)originString
                                        originColor:(UIColor *)originColor
                                       targetString:(NSString *)targetString
                                        targetColor:(UIColor *)targetColor;

#pragma mark - 改变行间距
/**
 改变行间距
 */
+ (NSAttributedString *)changeSpaceWithString:(NSString *)string
                                        space:(CGFloat)space;

#pragma mark - 给目标字符串增加下划线 颜色自定义
/**
 给目标字符串增加下划线 颜色自定义
 */
+ (NSAttributedString *)addUnderLineWithOriginString:(NSString *)originString
                                        targetString:(NSString *)targetString
                                      underLineColor:(UIColor *)underLineColor;

#pragma mark - 给目标字符串增加下划线 颜色跟随字体
/**
 给目标字符串增加下划线 颜色跟随字体
 */
+ (NSAttributedString *)addUnderLineWithOriginString:(NSString *)originString
                                        targetString:(NSString *)targetString;

#pragma mark - 设置字符串的首行缩进
/**
 设置字符串的首行缩进
 */
+ (NSAttributedString *)firstLineHeaderIndent:(CGFloat)headerIndent
                                       string:(NSString *)string;

#pragma mark - 对目标字符串进行多属性的设置
/**
 对目标字符串进行多属性的设置
 */
+ (NSAttributedString *)changeAttributeWithOriginString:(NSString *)originString
                                       originAttributes:(NSDictionary<NSString *, id> *)originAttributes
                                           targetString:(NSString *)targetString
                                       targetattributes:(NSDictionary<NSString *, id> *)targetattributes;

#pragma mark - 计算当前富文本字符串的大小
/**
 计算当前富文本字符串的大小
 */
- (CGSize)calculateSize;

#pragma mark - 计算富文本字符串的大小
/**
 计算富文本字符串的大小
 */
+ (CGSize)calculateSizeWithAttributeString:(NSAttributedString *)attributeString;

#pragma mark - 计算当前富文本字符串宽度
/**
 计算当前富文本字符串宽度
 */
- (CGFloat)calculateWidthWithMaxHeight:(CGFloat)height;

#pragma mark - 计算富文本字符串宽度
/**
 计算富文本字符串宽度
 */
+ (CGFloat)calculateWidthWithAttributeString:(NSAttributedString *)attriString
                                   maxHeight:(CGFloat)height;

#pragma mark - 计算当前富文本字符串高度
/**
 计算当前富文本字符串高度
 */
- (CGFloat)calculateHeightWithMaxWidth:(CGFloat)width;

#pragma mark - 计算富文本字符串高度
/**
 计算富文本字符串高度
 */
- (CGFloat)calculateWidthWithAttributeString:(NSAttributedString *)attriString
                                    maxWidth:(CGFloat)width;

@end


@interface NSMutableAttributedString (Helpers)

#pragma mark - 设置颜色字体
/**
 设置颜色字体
 */
- (void)setAttributeStringColor:(NSString *)string
                          color:(UIColor *)color;

#pragma mark - 设置大小
/**
 设置大小
 */
- (void)setAttributeStringFont:(NSString *)string
                          font:(UIFont *)font;

#pragma mark - 设置行间距
/**
 设置行间距
 */
- (void)setLineSpace:(CGFloat)lineSpace;

#pragma mark - 设置下划线
/**
 设置下划线
 */
- (void)setUnderLineWithString:(NSString *)targetString;

#pragma mark - 设置下划线颜色
/**
 设置下划线颜色
 */
- (void)setUnderLineColorWithString:(NSString *)targetString
                              color:(UIColor *)targetColor;

#pragma mark - 设置页面风格：比如行间距，首行缩进，断行模式
/**
 设置页面风格：比如行间距，首行缩进，断行模式
 */
- (void)setParagraphStyle:(NSParagraphStyle *)style;

@end

#endif
