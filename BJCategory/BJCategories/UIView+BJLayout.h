//
//  NSObject+RootRoute.m
//  BJPlace
//
//  Created by ghk on 2018/3/29.
//  Copyright © 2018年 geng hongkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BJLayout)

- (CGFloat)height;
- (CGFloat)width;
- (CGFloat)x;
- (CGFloat)y;
- (CGSize)size;
- (CGPoint)origin;
- (CGFloat)centerX;
- (CGFloat)centerY;

- (CGFloat)left;
- (CGFloat)top;
- (CGFloat)bottom;
- (CGFloat)right;

- (void)setX:(CGFloat)x;
- (void)setY:(CGFloat)y;
- (void)setLeft:(CGFloat)left;
- (void)setRight:(CGFloat)right;
- (void)setTop:(CGFloat)top;
- (void)setOrigin:(CGPoint)origin;
- (void)setBottom:(CGFloat)bottom;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;
- (void)setCenterX:(CGFloat)centerX;
- (void)setCenterY:(CGFloat)centerY;
- (void)setSize:(CGSize)size;

- (void)equalFrameToView:(UIView*)view;
- (void)equalFrameToSuperView:(UIView*)view;
- (void)equalSizeToView:(UIView*)view;
- (void)equalLeftToView:(UIView *)view;
- (void)equalTopToView:(UIView *)view;

- (void)bottomEqualSuperViewBottom;
- (void)setBottomToSuperBotttomGap:(CGFloat)Gap;

- (void)bottomEqualToTopOfView:(UIView*)targetView;

@end
