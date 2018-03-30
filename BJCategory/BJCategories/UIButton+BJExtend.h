//
//  UIButton+Extend.h
//  BJCategory
//
//  Created by ghk on 2018/3/30.
//  Copyright © 2018年 geng hongkai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BJUIButtonImagePosition) {

    BJ_UIButtonImagePositionLeft = 0,              //图片在左，文字在右，默认
    BJ_UIButtonImagePositionRight = 1,             //图片在右，文字在左
    BJ_UIButtonImagePositionTop = 2,               //图片在上，文字在下
    BJ_UIButtonImagePositionBottom = 3,            //图片在下，文字在上
};

@interface UIButton (BJExtend)

/**
 设置图片的位置与距离文字的间距

 @param postion 图片的位置
 @param spacing 图片与文字的间距
 */
- (void)bj_setImagePosition:(BJUIButtonImagePosition)postion spacing:(CGFloat)spacing;

@end
