//
//  UIImage+Util.m
//  BSMedical
//
//  Created by Bsoft on 16/3/21.
//  Copyright © 2016年 Bsoft. All rights reserved.
//

#import "UIImage+Util.h"

@implementation UIImage(Util)

/**
 *  @brief  根据颜色生成纯色图片
 *
 *  @param color 颜色
 *
 *  @return 纯色图片
 */
+ (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


/**
 根据颜色生成纯色图片

 @param color color颜色
 @param size 大小
 @return 纯色照片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
/**
 *  对图片尺寸进行压缩
 *
 *  @param image   原图片
 *  @param newSize 新的尺寸
 *
 *  @return 压缩后的图片
 */
+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    // End the context
    UIGraphicsEndImageContext();
    // Return the new image.
    return newImage;
}

/**
 *  对图片的尺寸, 大小压缩后的图片
 *
 *  @param image     原图片
 *  @param newSize   新的尺寸
 *  @param scaleRate 压缩比例
 *
 *  @return 压缩后的图片
 */
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize scaleRate:(CGFloat)scaleRate
{
    //对图片的尺寸进行压缩
    UIImage *imageSizeOne = [self imageWithImage:image scaledToSize:newSize];
    //对图片的大小进行压缩
    NSData *imageData = UIImageJPEGRepresentation(imageSizeOne, scaleRate);
    //获取图片
    return [UIImage imageWithData:imageData];
}


@end
