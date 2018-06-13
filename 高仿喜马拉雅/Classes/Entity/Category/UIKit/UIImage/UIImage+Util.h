//
//  UIImage+Util.h
//  BSMedical
//
//  Created by Bsoft on 16/3/21.
//  Copyright © 2016年 Bsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(Util)

//颜色转换图片
+ (UIImage *)createImageWithColor:(UIColor *)color;
//颜色转换图片带尺寸
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
/** 对图片尺寸进行压缩 */
+ (UIImage *)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;
/** 对图片的尺寸, 大小压缩后的图片 */
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize scaleRate:(CGFloat)scaleRate;

@end
