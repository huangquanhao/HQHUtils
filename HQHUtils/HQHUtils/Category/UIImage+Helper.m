//
//  UIImage+Helper.m
//  常用工具类
//
//  Created by quanhao huang on 2019/12/10.
//  Copyright © 2019 quanhao huang. All rights reserved.
//

#import "UIImage+Helper.h"

#if TARGET_OS_IOS

@implementation UIImage (Helper)

- (UIImage *)pressImageWithMaxSize:(CGFloat)size
{
    CGFloat compression = 1.0f;
    NSData *imageData = UIImageJPEGRepresentation(self, compression);
    
    if ([imageData length] > size) {
        compression = size / ([imageData length]);
        NSData *compressionImageData = UIImageJPEGRepresentation(self, compression);
        CGFloat minCompression = 0.001f;
        
        while ([compressionImageData length] > size && compression >= minCompression)
        {
            if (compression <= 0.01) {
                compression -= 0.001;
            }
            else if (compression <= 0.1)
            {
                compression -= 0.02;
            }
            else
            {
                compression -= 0.2;
            }
            compressionImageData = UIImageJPEGRepresentation(self, compression);
        }
        
        imageData = compressionImageData;
    }
    return [UIImage imageWithData:imageData];
}

+ (UIImage *)pressImage:(UIImage *)originImage MaxSize:(CGFloat)size
{
    return [originImage pressImageWithMaxSize:size];
}

- (UIImage *)compressToTargetWidth:(CGFloat)targetWidth
{
    CGSize imageSize = self.size;
    
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    
    CGFloat targetHeight = (targetWidth / width)*height;
    
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
    
    [self drawInRect:CGRectMake(0, 0, targetWidth, targetHeight)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)compressImage:(UIImage *)image toTargetWidth:(CGFloat)targetWidth
{
    return [image compressToTargetWidth:targetWidth];
}

- (UIImage *)compressToTargetHeight:(CGFloat)targetHeight
{
    CGSize imageSize = self.size;
    
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    
    CGFloat targetWidth = (targetHeight / height) * width;
    
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
    
    [self drawInRect:CGRectMake(0, 0, targetWidth, targetHeight)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)compressImage:(UIImage *)image toTargetHeight:(CGFloat)targetHeight
{
    return [image compressToTargetHeight:targetHeight];
}

- (UIImage *)compressToTargetSize:(CGSize)targetSize
{
    UIGraphicsBeginImageContext(targetSize);
    [self drawInRect:CGRectMake(0, 0, targetSize.width, targetSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)comporessImage:(UIImage *)image toTargetSize:(CGSize )targetSize
{
    return [image compressToTargetSize:targetSize];
}

- (UIImage *)cutImageToTargetRect:(CGRect)rect
{
    CGImageRef imageRef = [self CGImage];
    
//    裁剪
    CGImageRef newImageRef = CGImageCreateWithImageInRect(imageRef, rect);
    
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    
    return newImage;
    
}

+ (UIImage *)cutImage:(UIImage *)image toTargetRect:(CGRect)rect
{
    return [image cutImageToTargetRect:rect];
}

+ (UIImage *)screensShots
{
    UIWindow *screenWindow = [[UIApplication sharedApplication] keyWindow];
    UIGraphicsBeginImageContext(screenWindow.frame.size);
    [screenWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return viewImage;
}

+ (UIImage *)getColorImageWithColor:(UIColor *)color
{
    return [self createImageWithColor:color andSize:CGSizeMake(0.1f, 0.1f)];
}

+(UIImage *)createImageWithColor:(UIColor *)color andSize:(CGSize)size
{
    CGRect rect=CGRectMake(0.0f, 0.0f,size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (UIImage *)blurWithBlurNumber:(CGFloat)number
{
    if (number < 0.0f || number > 1.0f) {
        
        number = 0.5;
    }
    
    int boxSize = (int)(number * 40);
    boxSize = boxSize - (boxSize % 2) + 1;
    CGImageRef img = self.CGImage;
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    
    // 从CGImage中获取数据
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    // 设置从CGImage获取对象的属性
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    inBuffer.data = (void *)CFDataGetBytePtr(inBitmapData);
    pixelBuffer = malloc(CGImageGetBytesPerRow(img)*CGImageGetHeight(img));
    
    if (pixelBuffer == NULL) {
        NSLog(@"no pixelbuffer");
    }
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data, outBuffer.width, outBuffer.height, 8, outBuffer.rowBytes, colorSpace, kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage(ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    
    // clean up CGContextReleade(ctx)
    CGColorSpaceRelease(colorSpace);
    free(pixelBuffer);
    CFRelease(inBitmapData);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    
    return returnImage;
}

+ (UIImage *)blurImage:(UIImage *)image withBlurNumber:(CGFloat)number
{
    return [image blurWithBlurNumber:number];
}

- (UIColor *)getPlexColorWithPoint:(CGPoint)point
{
    CGRect imageRect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    if (!CGRectContainsPoint(imageRect, point)) {
        return nil;
    }
    
    NSInteger pointX = trunc(point.x);
    NSInteger pointY = trunc(point.y);
    
    CGImageRef cgImage = self.CGImage;
    
    NSUInteger height = self.size.height;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    int bytesPerpixel = 4;
    int bytesPerRow = bytesPerpixel * 1;
    
    NSUInteger bitsPerComponent = 8;
    
    unsigned char piexlData[4] = {0,0,0,0};
    
    CGContextRef context = CGBitmapContextCreate(piexlData, 1, 1, bitsPerComponent, bytesPerRow, colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    
    
    CGContextTranslateCTM(context, -pointX, pointY - (CGFloat)height);
    
    CGContextDrawImage(context, imageRect, cgImage);
    CGContextRelease(context);
    
    CGFloat red = (CGFloat)piexlData[0] / 255.0;
    CGFloat green = (CGFloat)piexlData[1] / 255.0;
    CGFloat blue = (CGFloat)piexlData[2] / 255.0;
    CGFloat alpha = (CGFloat)piexlData[3] / 255.0;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)getPlexColorWithImage:(UIImage *)image point:(CGPoint)point
{
    return [image getPlexColorWithPoint:point];
}

- (void)saveImage;
{
    UIImageWriteToSavedPhotosAlbum(self, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo
{
    if (error == nil) {
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"保存成功" preferredStyle:UIAlertControllerStyleAlert];
        [alertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        
        [[self getCurrentVC] presentViewController:alertView animated:YES completion:nil];
    }
    else
    {
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"保存失败" preferredStyle:UIAlertControllerStyleAlert];
        [alertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        
        [[self getCurrentVC] presentViewController:alertView animated:YES completion:nil];
    }
}

- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
      
    UIWindow * window = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
      
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
      
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
      
    return result;
}

+ (void)saveImageWithImage:(UIImage *)image
{
    [image saveImage];
}

@end

#endif
