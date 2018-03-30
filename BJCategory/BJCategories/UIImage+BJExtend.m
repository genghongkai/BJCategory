//
//  UIImage+BJExtend.m
//  BJCategory
//
//  Created by ghk on 2018/3/30.
//  Copyright © 2018年 geng hongkai. All rights reserved.
//

#import "UIImage+BJExtend.h"

@implementation UIImage (BJExtend)

/**
 用颜色生成图片

 @param color 用来生成图片的颜色
 @return 生成的图片
 */
+ (UIImage *)generatorImageWithColor:(UIColor *)color {
    CGRect rect=CGRectMake(0.0f,0.0f,1.0f,1.0f);UIGraphicsBeginImageContext(rect.size);
    CGContextRef context=UIGraphicsGetCurrentContext();CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
