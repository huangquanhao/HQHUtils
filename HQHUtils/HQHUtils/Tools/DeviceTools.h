//
//  DeviceTools.h
//  常用工具类
//
//  Created by quanhao huang on 2019/12/10.
//  Copyright © 2019 quanhao huang. All rights reserved.
//

/*
deviceID: 设备相关
（1）获取设备UUID
（2）获取当前设备的型号
（4）获取系统版本
（5）获取iPhone名称
（6）获取应用的version
（7）获取应用的build
（8）获取应用的bundle identify
（9）获取电池电量
（10）获取当前系统版本号
（11）获取当前设备IP
（12）获取总内存大小
（13）获取当前可用内存
*/
#import <Foundation/Foundation.h>
#import <Security/Security.h>
#import "KeychainItemWrapper.h"
#import "sys/utsname.h"
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <net/if.h>

NS_ASSUME_NONNULL_BEGIN

@interface DeviceTools : NSObject

#pragma mark - 获取设备真实UUID
/**
 获取设备真实UUID
 */
+ (NSString *)getDeviceUUID;

#pragma mark - 获取当前设备的型号
/**
 获取当前设备的型号
 */
+ (NSString *)getDeviceName;

#pragma mark - 获取系统版本
/**
 获取系统版本
 */
+ (NSString *)getOriginalSystemVersion;

#pragma mark - 获取iPhone名称
+ (NSString *)getiPhoneName;

#pragma mark - 获取应用的版本号
/**
 获取应用的版本号
 */
+ (NSString *)getAppVersion;

#pragma mark - 获取应用的build
/**
 获取应用的build
 */
+ (NSString *)getAppBuild;

#pragma mark - 获取应用的bundle identify
/**
 获取应用的bundle identify
 */
+ (NSString *)getAppBundleIdentify;

#pragma mark - 获取电池电量
+ (CGFloat)getBatteryLevel;

#pragma mark - 获取当前系统版本号
+ (NSString *)getSystemVersion;

#pragma mark - 获取当前设备IP
+ (NSString *)getDeviceIPAdress;

@end

NS_ASSUME_NONNULL_END
