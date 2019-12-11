//
//  NSAttributedString+Helpers.m
//  常用工具类
//
//  Created by quanhao huang on 2019/12/10.
//  Copyright © 2019 quanhao huang. All rights reserved.
//

#import "NSAttributedString+Helpers.h"

@implementation NSAttributedString (Helpers)

+ (NSAttributedString *)changeFontWithOriginString:(NSString *)originString
                                         orginFont:(UIFont *)originFont
                                      targetString:(NSString *)targetString
                                        targetFont:(UIFont *)targetFont
{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:originString];
    [attributeString setAttributeStringFont:originString font:originFont];
    [attributeString setAttributeStringFont:targetString font:targetFont];
    return [attributeString copy];
}

+ (NSAttributedString *)changeColorWithOriginString:(NSString *)originString
                                        originColor:(UIColor *)originColor
                                       targetString:(NSString *)targetString
                                        targetColor:(UIColor *)targetColor
{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:originString];
    [attributeString setAttributeStringColor:originString color:originColor];
    [attributeString setAttributeStringColor:targetString color:targetColor];
    return [attributeString copy];
}

+ (NSAttributedString *)changeSpaceWithString:(NSString *)string
                                        space:(CGFloat)space
{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributeString setLineSpace:space];
    return [attributeString copy];
}

+ (NSAttributedString *)addUnderLineWithOriginString:(NSString *)originString
                                        targetString:(NSString *)targetString
                                      underLineColor:(UIColor *)underLineColor
{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:originString];
    [attributeString setUnderLineWithString:targetString];
    [attributeString setUnderLineColorWithString:targetString color:underLineColor];
    return [attributeString copy];
}

+ (NSAttributedString *)addUnderLineWithOriginString:(NSString *)originString
                                        targetString:(NSString *)targetString
{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:originString];
    [attributeString setUnderLineWithString:targetString];
    return [attributeString copy];
}

+ (NSAttributedString *)firstLineHeaderIndent:(CGFloat)headerIndent
                                      string:(NSString *)string
{
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.firstLineHeadIndent = headerIndent;
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributeString setParagraphStyle:[style copy]];
    return [attributeString copy];
}

+ (NSAttributedString *)changeAttributeWithOriginString:(NSString *)originString
                                       originAttributes:(NSDictionary<NSString *, id> *)originAttributes
                                           targetString:(NSString *)targetString
                                       targetattributes:(NSDictionary<NSString *, id> *)targetattributes
{
    NSMutableAttributedString *mutableAttributeString = [[NSMutableAttributedString alloc] initWithString:originString];
    if ([originString rangeOfString:targetString].location == NSNotFound) {
        [mutableAttributeString setAttributes:originAttributes range:NSMakeRange(0, originString.length)];
    }
    else
    {
        NSRange targetRange = [originString rangeOfString:targetString];
        [mutableAttributeString setAttributes:originAttributes range:NSMakeRange(0, originString.length)];
        [mutableAttributeString setAttributes:targetattributes range:targetRange];
    }
    
    return [mutableAttributeString copy];
}

- (CGSize)calculateSize
{
    return [self boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
}

+ (CGSize)calculateSizeWithAttributeString:(NSAttributedString *)attributeString
{
    return [attributeString calculateSize];
}

- (CGFloat)calculateWidthWithMaxHeight:(CGFloat)height
{
    return [self boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size.width;
}

+ (CGFloat)calculateWidthWithAttributeString:(NSAttributedString *)attriString
                                   maxHeight:(CGFloat)height
{
    return [attriString calculateWidthWithMaxHeight:height];
}

- (CGFloat)calculateHeightWithMaxWidth:(CGFloat)width
{
    return [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size.height;
}

- (CGFloat)calculateWidthWithAttributeString:(NSAttributedString *)attriString
                                    maxWidth:(CGFloat)width
{
    return [attriString calculateHeightWithMaxWidth:width];
}

@end

@implementation NSMutableAttributedString (Helpers)

- (void)setAttributeStringColor:(NSString *)string
                          color:(UIColor *)color
{
    [self addAttribute:NSForegroundColorAttributeName value:color range:[self getRangeWithTargetString:string]];
}

- (void)setAttributeStringFont:(NSString *)string
                          font:(UIFont *)font
{
    [self addAttribute:NSFontAttributeName value:font range:[self getRangeWithTargetString:string]];
}

- (void)setLineSpace:(CGFloat)lineSpace
{
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = lineSpace;
    [self addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, self.mutableString.length)];
}

- (void)setUnderLineWithString:(NSString *)targetString
{
    [self addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:[self getRangeWithTargetString:targetString]];
}

- (void)setUnderLineColorWithString:(NSString *)targetString
                              color:(UIColor *)targetColor
{
    [self addAttribute:NSUnderlineColorAttributeName value:targetColor range:[self getRangeWithTargetString:targetString]];
}

- (void)setParagraphStyle:(NSParagraphStyle *)style
{
    [self addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, self.mutableString.length)];
}

- (NSRange)getRangeWithTargetString:(NSString *)targetstring
{
    NSRange range = NSMakeRange(0, 0);
    NSString *originString = [self.mutableString copy];
    if ([originString rangeOfString:targetstring].location != NSNotFound) {
        range = [originString rangeOfString:targetstring];
    }
    return range;
}

@end
