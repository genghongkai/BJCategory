//
//  UIColor+BJExtend.h
//  BJPlace
//
//  Created by ghk on 2018/3/30.
//  Copyright © 2018年 geng hongkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (BJExtend)

/**
 从十六进制字符串获取颜色

 @param color 支持三种格式, @"#123456";@"0X123456";@"123456"
 @return 颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)color;

/**
 从十六进制字符串获取颜色

 @param color color 支持三种格式, @"#123456";@"0X123456";@"123456"
 @param alpha 不透明度，从0-1.0,即从完全透明到完全不透明。
 @return 颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
