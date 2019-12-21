//
//  UIView+Helper.m
//  常用工具类
//
//  Created by quanhao huang on 2019/12/10.
//  Copyright © 2019 quanhao huang. All rights reserved.
//

#import "UIView+Helper.h"

#if TARGET_OS_IOS

@implementation UIView (Helper)

- (PositionRelation)determineThePositionShipWithOtherView:(UIView *)otherView
{
    if (otherView) {
        
        BOOL isContain = CGRectContainsRect(self.frame, otherView.frame);
        if (isContain) {
            return PositionRelationContain;
        }
        else
        {
            BOOL isOverLapper = CGRectIntersectsRect(self.frame, otherView.frame);
            if (isOverLapper) {
                return PositionRelationOverLapper;
            }
            else
            {
                // 不相交也不包含的情况下，即为分离
                return PositionRelationSeparation;
            }
        }
    }
    else
    {
        return PositionRelationNone;
    }
}

+ (PositionRelation)determineThePositionShip:(UIView *)view OtherView:(UIView *)otherView
{
    return [view determineThePositionShipWithOtherView:otherView];
}

@end

#endif
