//
//  UIImageView+BJExtend.h
//  BJCategory
//
//  Created by ghk on 2018/3/30.
//  Copyright © 2018年 geng hongkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (BJExtend)

/**
 查找导航栏底部线

 @param view navigationBar
 @return 导航栏底部线
 */
+ (UIImageView *)findHairlineImageViewUnder:(UIView *)view;

@end
