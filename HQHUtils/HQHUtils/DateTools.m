//
//  DateTools.m
//  常用工具类
//
//  Created by quanhao huang on 2019/12/7.
//  Copyright © 2019 quanhao huang. All rights reserved.
//

#import "DateTools.h"

static NSDateFormatter *cachedDateFormatter = nil;
@implementation DateTools

+ (NSString *)getNowDateWithFormatterType:(DateFormatterType)type
{
    NSDate *date = [NSDate date];
    return  [self getDateWithDate:date formatterType:type];
}

+ (NSString *)getDateWithDate:(NSDate *)date formatterType:(DateFormatterType)type
{
    NSDateFormatter *fomatter = [self createDateFormatterForType:type];
    return date ? [fomatter stringFromDate:date] : @"";
}

+ (NSDate *)getDateWithString:(NSString *)dateString formatterType:(DateFormatterType)type
{
    NSDateFormatter *formatter = [self createDateFormatterForType:type];
    return [formatter dateFromString:dateString];
}

+ (NSString *)transformDate:(NSString *)dateString
        begainFormatterType:(DateFormatterType)type
            toFormatterType:(DateFormatterType)newTpye
{
    if (type != newTpye) {
        NSDate *date = [self getDateWithString:dateString formatterType:type];
        return [self getDateWithDate:date formatterType:newTpye];
    }
    else
    {
        return dateString;
    }
}

+ (BOOL)checkDateValid:(NSString *)string
            stringType:(DateFormatterType)stringType
{
    NSString *newString = [self transformDate:string begainFormatterType:stringType toFormatterType:DateFormatterYearMonthDay];
    BOOL valid = NO;
    if (newString && newString.length > 0)
    {
        if ([newString hasPrefix:@"19"] || [newString hasPrefix:@"20"])
        {
            NSDateFormatter *dateFormatter = [self createDateFormatterForType:DateFormatterYearMonthDay];
            dateFormatter.locale = [NSLocale systemLocale];
            dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
            NSDate *date= [dateFormatter dateFromString:newString];
            if (date)
            {
                valid = YES;
            }
        }
    }
    return valid;
}

+ (NSComparisonResult)compareDate:(NSString *)date
                         dateType:(DateFormatterType)dateType
{
    NSString *newString = [self transformDate:date begainFormatterType:dateType toFormatterType:DateFormatterYearMonthDay];
    
    NSDateFormatter *dateFormatter = [self createDateFormatterForType:DateFormatterYearMonthDay];
    dateFormatter.locale = [NSLocale systemLocale];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    NSDate *start= [dateFormatter dateFromString:newString];
    NSDate *now = [NSDate date];
    return [start compare:now];
}

+ (NSComparisonResult)compareDate:(NSString *)beginDate
                   beiginDateType:(DateFormatterType)beiginDateType
                          endDate:(NSString *)endDate
                      endDateType:(DateFormatterType)endDateType
{
    NSString *beginString = [self transformDate:beginDate begainFormatterType:beiginDateType toFormatterType:DateFormatterYearMonthDay];
    NSString *endString = [self transformDate:endDate begainFormatterType:endDateType toFormatterType:DateFormatterYearMonthDay];
    
    
    NSDateFormatter *dateFormatter = [self createDateFormatterForType:DateFormatterYearMonthDay];
    dateFormatter.locale = [NSLocale systemLocale];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    NSDate *start= [dateFormatter dateFromString:beginString];
    NSDate *end = [dateFormatter dateFromString:endString];
    return [start compare:end];
}

+ (NSInteger)calculateIntervalFromBeginDate:(NSString *)beginDate
                             beiginDateType:(DateFormatterType)beiginDateType
                                     toDate:(NSString *)endDate
                                endDateType:(DateFormatterType)endDateType
{
    NSString *beiginString = [self transformDate:beginDate begainFormatterType:beiginDateType toFormatterType:DateFormatterBarStyle];
    NSString *endString = [self transformDate:endDate begainFormatterType:endDateType toFormatterType:DateFormatterBarStyle];
    
    NSInteger intervals = 0;
    if (beiginString && beiginString.length > 0 && endString && endString.length > 0)
    {
        //format日期
        NSDateFormatter *dateFormatter = [self createDateFormatterForType:DateFormatterBarStyle];
        dateFormatter.locale = [NSLocale systemLocale];
        NSDate *beginD = [dateFormatter dateFromString:beiginString];
        NSDate *endD = [dateFormatter dateFromString:endString];
        
        //用于记录两个日期的时间间隔（以秒为单位）
        NSInteger intervalInSecond = [endD timeIntervalSince1970] - [beginD timeIntervalSince1970];
        
        //当前日期大于规定的审核日期
        if (intervalInSecond > 0)
        {
            intervals = intervalInSecond/(60*60*24);
        }
        //当前日期小于规定的审核日期
        else
        {
            intervals = 0;
        }
    }
    else
    {
        intervals = 0;
    }
    return intervals;
}

/**
 根据不同的类别创建NSDateFormatter
 
 @param type 传入的类别
 @return 返回的NSDateFormatter
 */
+ (NSDateFormatter *)createDateFormatterForType:(DateFormatterType)type
{
    if (!cachedDateFormatter) {
        cachedDateFormatter = [[NSDateFormatter alloc]init];
    }
    // 设置中国地区
    cachedDateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
    // 设置默认系统时区
    cachedDateFormatter.timeZone = [NSTimeZone systemTimeZone];
    
    switch (type) {
        case DateFormatterYearMonth:
            cachedDateFormatter.dateFormat = @"yyyyMM";
            break;
        case DateFormatterYearMonthDay:
            cachedDateFormatter.dateFormat = @"yyyyMMdd";
            break;
        case DateFormatterBarStyle:
            cachedDateFormatter.dateFormat = @"yyyy-MM-dd";
            break;
        case DateFormatterBarHourStyle:
            cachedDateFormatter.dateFormat = @"yy-MM-dd HH";
            break;
        case DateFormatterBarMinutesStyle:
            cachedDateFormatter.dateFormat = @"yyyy-MM-dd hh:mm";
        case DateFormatterBarSecondsStyle:
            cachedDateFormatter.dateFormat = @"yyyy-MM-dd hh:mm:ss";
        default:
            break;
    }
    return cachedDateFormatter;
}

@end
