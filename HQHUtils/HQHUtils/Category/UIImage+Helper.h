//
//  UIImage+Helper.h
//  常用工具类
//
//  Created by quanhao huang on 2019/12/10.
//  Copyright © 2019 quanhao huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accelerate/Accelerate.h>

/*
 UIImage: 图片扩展
（1）图片压缩 (压体积，缩大小)
   1.1 图片压到指定体积
   1.2 图片缩放到指定大小
（2）图片裁剪
（3）屏幕截图
（4）根据颜色生成纯色图片
（6）图片模糊
（8）返回一张没有经过渲染的图片 (这个暂时不做，我不太懂是什么意思)
（9）获取图片某一个像素点的颜色
（10）将图片保存到图片库
*/

#if TARGET_OS_IOS

@interface UIImage (Helper)

#pragma mark - 将当前图片压到指定体积
/*
 将当前图片压到指定体积
 size : 以bit为单位，比如，想要压缩到120KB 则size=120*1024
 */
- (UIImage *)pressImageWithMaxSize:(CGFloat)size;

#pragma mark - 将当前图片压到指定体积
/*
 将当前图片压到指定体积
 originImage : 需要压体积的图片
 size : 以bit为单位，比如，想要压缩到120KB 则size=120*1024
 */
+ (UIImage *)pressImage:(UIImage *)originImage MaxSize:(CGFloat)size;

#pragma mark - 将当前图片缩放到指定大小
/**
 将当前图片缩放到指定大小
 targetWidth -> 目标宽度，高度等比缩放
 备注：等比缩放
 */
- (UIImage *)compressToTargetWidth:(CGFloat)targetWidth;

#pragma mark - 将图片缩放到指定大小
/**
 将图片缩放到指定大小
 targetWidth -> 目标宽度，高度等比缩放
 备注：等比缩放
 */
+ (UIImage *)compressImage:(UIImage *)image toTargetWidth:(CGFloat)targetWidth;

#pragma mark - 将当前图片缩放到指定大小
/**
 将当前图片缩放到指定大小
 targetHeight -> 目标高度
 */
- (UIImage *)compressToTargetHeight:(CGFloat)targetHeight;

#pragma mark - 将图片缩放到指定大小
/**
 将图片缩放到指定大小
 targetHeight -> 目标高度
 */
+ (UIImage *)compressImage:(UIImage *)image toTargetHeight:(CGFloat)targetHeight;

#pragma mark - 将当前图片缩放到指定大小
/**
 将当前图片缩放到指定大小
 size -> 指定的大小
 备注：该方法由使用者控制大小，故不能保证是等比缩放
 */
- (UIImage *)compressToTargetSize:(CGSize)targetSize;

#pragma mark - 将图片缩放到指定大小
/**
 将图片缩放到指定大小
 size -> 指定的大小
 备注：该方法由使用者控制大小，故不能保证是等比缩放
 */
+ (UIImage *)comporessImage:(UIImage *)image toTargetSize:(CGSize)targetSize;

#pragma mark - 将当前图片裁剪指定区域
/**
 将当前图片裁剪指定区域
 rect -> 指定区域
 */
- (UIImage *)cutImageToTargetRect:(CGRect)rect;

#pragma mark - 将图片裁剪到指定区域
/**
 将图片裁剪到指定区域
 size -> 指定的区域
 */
+ (UIImage *)cutImage:(UIImage *)image toTargetRect:(CGRect)rect;

#pragma mark - 屏幕截图
/**
 屏幕截图
 */
+ (UIImage *)screensShots;

#pragma mark - 根据颜色生成纯色图片
/**
 根据颜色生成纯色图片
 */
+ (UIImage *)getColorImageWithColor:(UIColor *)color;

#pragma mark - 根据颜色和大小生成一张纯色图片
/**
 根据颜色和大小生成一张纯色图片
 */
+(UIImage *)createImageWithColor:(UIColor *)color andSize:(CGSize)size;

#pragma mark - 对当前图片进行图片模糊
/**
 对当前图片进行图片模糊
 number： 模糊参数 （0.1 ~ 1.0）之间，表示模糊的程度
 */
- (UIImage *)blurWithBlurNumber:(CGFloat)number;

#pragma mark - 对图片进行图片模糊
/**
 对图片进行图片模糊
 number： 模糊参数 （0.1 ~ 1.0）之间，表示模糊的程度
 */
+ (UIImage *)blurImage:(UIImage *)image withBlurNumber:(CGFloat)number;

#pragma mark - 获取当前图片某一个像素点的颜色
/**
 获取当前图片某一个像素点的颜色
 point: 像素点的位置
 */
- (UIColor *)getPlexColorWithPoint:(CGPoint)point;

#pragma mark - 获取当前图片某一个像素点的颜色
/**
 获取当前图片某一个像素点的颜色
 point: 像素点的位置
 */
+ (UIColor *)getPlexColorWithImage:(UIImage *)image point:(CGPoint)point;

#pragma mark - 将当前图片保存到图片库
/**
 将当前图片保存到图片库
 */
- (void)saveImage;

#pragma mark - 将图片保存到图片库
/**
 将图片保存到图片库
 */
+ (void)saveImageWithImage:(UIImage *)image;

@end

#endif
