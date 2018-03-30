//
//  UIImage+BJExtend.h
//  BJCategory
//
//  Created by ghk on 2018/3/30.
//  Copyright © 2018年 geng hongkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BJExtend)

/**
 用颜色生成图片

 @param color 用来生成图片的颜色
 @return 生成的图片
 */
+ (UIImage *)generatorImageWithColor:(UIColor *)color;

@end
