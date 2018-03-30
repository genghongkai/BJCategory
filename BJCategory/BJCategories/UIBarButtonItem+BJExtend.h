//
//  UIBarButtonItem+BJExtend.h
//  BJCategory
//
//  Created by ghk on 2018/3/30.
//  Copyright © 2018年 geng hongkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (BJExtend)

/**
 *  创建导航栏按钮
 *
 *  @param imageName      普通状态图片
 *  @param highlightImage 高亮状态图片
 *  @param target         监听者
 *  @param action         监听方法
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)itemImageName:(NSString *)imageName highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)itemNormalTitle:(NSString *)normalTitle itemImageName:(NSString *)imageName highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)rightBarButtonItemImageName:(NSString *)imageName highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)leftBarButtonItemImageName:(NSString *)imageName highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)rightBarButtonNormalTitle:(NSString *)normalTitle ItemImageName:(NSString *)imageName highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)action;


@end
