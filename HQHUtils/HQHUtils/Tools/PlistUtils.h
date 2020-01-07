//
//  PlistUtils.h
//  HQHUtils
//
//  Created by quanhao huang on 2020/1/7.
//  Copyright © 2020 quanhao huang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlistUtils : NSObject

+ (void)savePlistFile:(NSDictionary *)userInfo withFileName:(NSString *)fileName;
+ (NSDictionary *)loadPlistFilewithFileName:(NSString *)fileName;

@end

NS_ASSUME_NONNULL_END
