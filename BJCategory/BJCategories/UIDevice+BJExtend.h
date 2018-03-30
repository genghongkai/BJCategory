//
//  UIDevice+BJExtend.h
//  BJCategory
//
//  Created by ghk on 2018/3/30.
//  Copyright © 2018年 geng hongkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (BJExtend)

/**
 强制旋转设备

 @param orientation 旋转方向
 */
+ (void)setOrientation:(UIInterfaceOrientation)orientation;

@end
