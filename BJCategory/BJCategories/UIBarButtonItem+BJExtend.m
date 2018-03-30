//
//  UIBarButtonItem+BJExtend.m
//  BJCategory
//
//  Created by ghk on 2018/3/30.
//  Copyright © 2018年 geng hongkai. All rights reserved.
//

#import "UIBarButtonItem+BJExtend.h"
#import "UIView+BJLayout.h"
#import "BJCategoryConst.h"

@implementation UIBarButtonItem (BJExtend)

+ (UIBarButtonItem *)itemImageName:(NSString *)imageName highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];

    //设置按钮的尺寸为按钮背景按钮的尺寸
    button.size = button.currentBackgroundImage.size;

    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)itemNormalTitle:(NSString *)normalTitle itemImageName:(NSString *)imageName highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    //    button.backgroundColor = [UIColor redColor];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitle:normalTitle forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    button.contentMode = UIViewContentModeLeft;
    if (normalTitle) {
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -3, 0, 0);
    }else
    {
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -29, 0, 0);
    }

    //设置按钮的尺寸为按钮背景按钮的尺寸
    button.size = CGSizeMake(24, 24);

    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];

}

+ (UIBarButtonItem *)rightBarButtonItemImageName:(NSString *)imageName highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    button.titleLabel.font = [UIFont systemFontOfSize:15];

    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    button.contentMode = UIViewContentModeLeft;

    button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -14);

    //设置按钮的尺寸为按钮背景按钮的尺寸
    button.size = CGSizeMake(24, 24);

    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)leftBarButtonItemImageName:(NSString *)imageName highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    button.contentMode = UIViewContentModeLeft;

    button.contentEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);

    //设置按钮的尺寸为按钮背景按钮的尺寸
    button.size = [[UIImage imageNamed:imageName] size];

    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];

}

+ (UIBarButtonItem *)rightBarButtonNormalTitle:(NSString *)normalTitle ItemImageName:(NSString *)imageName highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    [button setTitle:normalTitle forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    button.contentMode = UIViewContentModeLeft;

    button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -14);

    //设置按钮的尺寸为按钮背景按钮的尺寸
    button.size = CGSizeMake(24, 24);

    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)rightBarButtonLongTitle:(NSString *)normalTitle ItemImageName:(NSString *)imageName highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    [button setTitle:normalTitle forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    button.contentMode = UIViewContentModeLeft;

    button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -14);

    //设置按钮的尺寸为按钮背景按钮的尺寸
    button.size = CGSizeMake(80, 24);

    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
