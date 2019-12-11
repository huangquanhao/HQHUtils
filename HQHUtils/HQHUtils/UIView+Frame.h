//
//  UIView+Frame.h
//  常用工具类
//
//  Created by quanhao huang on 2019/12/10.
//  Copyright © 2019 quanhao huang. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
获取当前的X,Y,Width,Height,origin,size,bottom,tail,middleX,middleY
设置当前的X,Y,Width,Height,origin,size,bottom,tail,middleX,middleY
*/

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Frame)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat tail;
@property (nonatomic, assign) CGFloat middleX;
@property (nonatomic, assign) CGFloat middleY;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGPoint centerPoint;

@end

NS_ASSUME_NONNULL_END
