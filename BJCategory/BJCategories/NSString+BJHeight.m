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

/**
 *  计算富文本字体高度
 *
 *  @param lineSpeace 行高
 @param string     文字高度
 *  @param font       字体
 *  @param width      字体所占宽度
 *
 *  @return 富文本高度
 */
+ (CGFloat)bjGetSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace withString:(NSString *)string withFont:(UIFont*)font withWidth:(CGFloat)width {

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];

    paragraphStyle.lineSpacing = 10;  // 段落高度

    NSMutableAttributedString *attributes = [[NSMutableAttributedString alloc] initWithString:string];

    [attributes addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, string.length)];
    [attributes addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, string.length)];

    CGSize attSize = [attributes boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;

    return attSize.height;
}

+ (NSString *)bjTransformContainChineseUrl:(NSString *)urlString {

    if (!urlString) {
        return @"";
    }
    NSString  *newUrlString = nil;
    if (@available(iOS 9.0, *)) {
        newUrlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    } else {
        newUrlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    return newUrlString;
}

@end
