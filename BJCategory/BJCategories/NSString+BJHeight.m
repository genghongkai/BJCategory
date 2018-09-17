//
//  NSString+BJHeight.m
//  BJPlace
//
//  Created by ghk on 2018/8/16.
//  Copyright © 2018年 geng hongkai. All rights reserved.
//

#import "NSString+BJHeight.h"

@implementation NSString (BJHeight)

+ (CGFloat )bjHeightWithlabel:(UILabel *)label limtWidth:(CGFloat)limtWidth {

    CGSize size = CGSizeMake(limtWidth, MAXFLOAT);//设置高度宽度的最大限度
    CGFloat height = [label.text boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : label.font} context:nil].size.height;
    return height;
}

+ (CGFloat)bjHeightWithString:(NSString *)string limtWidth:(CGFloat)limtWidth font:(UIFont *)font {

    CGSize size = CGSizeMake(limtWidth, MAXFLOAT);//设置高度宽度的最大限度
    CGFloat height = [string boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size.height;
    return height;
}

+ (CGFloat )bjWidthWithString:(NSString *)string limtHeight:(CGFloat )limtHeight font:(UIFont *)font {

    CGSize size = CGSizeMake(MAXFLOAT, limtHeight);//设置高度宽度的最大限度
    CGFloat width = [string boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size.height;
    return width;
}

@end
