//
//  UIView+Helper.h
//  常用工具类
//
//  Created by quanhao huang on 2019/12/10.
//  Copyright © 2019 quanhao huang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PositionRelation) {
    PositionRelationOverLapper, // 重叠(仅有部分交叠在一起)
    PositionRelationContain,  // 包含(包括重合）
    PositionRelationSeparation, // 分离(没有重合在一起)
    
    PositionRelationNone, // 未知
};

#if TARGET_OS_IOS

@interface UIView (Helper)

#pragma mark - 判断当前的View和另一个View之间的关系
/**
 判断当前的View和另一个View之间的关系
 */
- (PositionRelation)determineThePositionShipWithOtherView:(UIView *)otherView;

#pragma mark - 判断两个view之间的位置关系
/**
 判断两个view之间的位置关系
 */
+ (PositionRelation)determineThePositionShip:(UIView *)view OtherView:(UIView *)otherView;

@end

#endif
