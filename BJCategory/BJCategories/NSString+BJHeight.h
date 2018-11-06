//
//  NSString+BJHeight.h
//  BJPlace
//
//  Created by ghk on 2018/8/16.
//  Copyright © 2018年 geng hongkai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (BJHeight)

+ (CGFloat )bjHeightWithlabel:(UILabel *)label limtWidth:(CGFloat )limtWidth;

+ (CGFloat )bjHeightWithString:(NSString *)string limtWidth:(CGFloat )limtWidth font:(UIFont *)font;

+ (CGFloat )bjWidthWithString:(NSString *)string limtHeight:(CGFloat )limtHeight font:(UIFont *)font;
+ (CGFloat)bjGetSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace withString:(NSString *)string withFont:(UIFont*)font withWidth:(CGFloat)width;

/**
 中文url转译

 @param urlString url
 @return 转译后的url
 */
+ (NSString *)bjTransformContainChineseUrl:(NSString *)urlString;

@end
