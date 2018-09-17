//
//  NSMutableAttributedString+BJExtend.m
//  BJPlace
//
//  Created by ghk on 2018/5/31.
//  Copyright © 2018年 geng hongkai. All rights reserved.
//

#import "NSMutableAttributedString+BJExtend.h"
#import <CoreText/CoreText.h>

@implementation NSMutableAttributedString (BJExtend)

/**
 *  单纯改变一句话中的某些字的颜色
 *
 *  @param color    需要改变成的颜色
 *  @param totalStr 总的字符串
 *  @param subArray 需要改变颜色的文字数组
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)ls_changeCorlorWithColor:(UIColor *)color TotalString:(NSString *)totalStr SubStringArray:(NSArray *)subArray {

    if(!totalStr.length) return [[NSMutableAttributedString alloc] initWithString:@""];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalStr];
    for (NSString *rangeStr in subArray) {

        NSRange range = [totalStr rangeOfString:rangeStr options:NSBackwardsSearch];
        [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    }

    return attributedStr;
}

/**
 *  单纯改变一句话中的某些字的颜色，并添加下划线
 *
 *  @param color    需要改变成的颜色
 *  @param totalStr 总的字符串
 *  @param subArray 需要改变颜色的文字数组
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)ls_changeUnderLineWithColor:(UIColor *)color TotalString:(NSString *)totalStr SubStringArray:(NSArray *)subArray {

    if(!totalStr.length) return [[NSMutableAttributedString alloc] initWithString:@""];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalStr];
    for (NSString *rangeStr in subArray) {

        NSRange range = [totalStr rangeOfString:rangeStr options:NSBackwardsSearch];
        [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
        [attributedStr addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];
    }

    return attributedStr;
}

/**
 *  单纯改变一句话中的某些字的大小
 *
 *  @param font    需要改变成的大小
 *  @param totalStr 总的字符串
 *  @param subArray 需要改变颜色的文字数组
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)ls_changeFontWithFont:(CGFloat)font TotalString:(NSString *)totalStr SubStringArray:(NSArray <NSString *> *)subArray {

    if(!totalStr.length) return [[NSMutableAttributedString alloc] initWithString:@""];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalStr];
    for (NSString *rangeStr in subArray) {

        NSRange range = [totalStr rangeOfString:rangeStr options:NSBackwardsSearch];
        [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:range];
    }

    return attributedStr;
}

/**
 *  单纯改变句子的字间距（需要 <CoreText/CoreText.h>）
 *
 *  @param totalString 需要更改的字符串
 *  @param space       字间距
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)ls_changeSpaceWithTotalString:(NSString *)totalString Space:(CGFloat)space {

    if(!totalString.length) return [[NSMutableAttributedString alloc] initWithString:@""];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalString];
    long number = space;
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
    [attributedStr addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(0,[attributedStr length])];
    CFRelease(num);

    return attributedStr;
}

/**
 *  单纯改变段落的行间距
 *
 *  @param totalString 需要更改的字符串
 *  @param lineSpace   行间距
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)ls_changeLineSpaceWithTotalString:(NSString *)totalString LineSpace:(CGFloat)lineSpace {

    if(!totalString.length) return [[NSMutableAttributedString alloc] initWithString:@""];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalString];

    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];

    [attributedStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [totalString length])];

    return attributedStr;
}

/**
 *  同时更改行间距和字间距
 *
 *  @param totalString 需要改变的字符串
 *  @param lineSpace   行间距
 *  @param textSpace   字间距
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)ls_changeLineAndTextSpaceWithTotalString:(NSString *)totalString LineSpace:(CGFloat)lineSpace textSpace:(CGFloat)textSpace {

    if(!totalString.length) return [[NSMutableAttributedString alloc] initWithString:@""];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalString];

    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];

    [attributedStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [totalString length])];

    long number = textSpace;
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
    [attributedStr addAttribute:(id)kCTKernAttributeName value:(__bridge NSNumber *)num range:NSMakeRange(0,[attributedStr length])];
    CFRelease(num);

    return attributedStr;
}

/**
 *  改变某些文字的颜色 并单独设置其字体
 *
 *  @param font        设置的字体
 *  @param color       颜色
 *  @param totalString 总的字符串
 *  @param subArray    想要变色的字符数组
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)ls_changeFontAndColor:(UIFont *)font Color:(UIColor *)color TotalString:(NSString *)totalString SubStringArray:(NSArray *)subArray {

    return [self ls_changeSpace:0 fontAndColor:font Color:color TotalString:totalString SubStringArray:subArray];
}

/**
 *  改变某些文字的颜色 并单独设置其字体 间距
 *
 *  @param space        行间距
 *  @param font        设置的字体
 *  @param color       颜色
 *  @param totalString 总的字符串
 *  @param subArray    想要变色的字符数组
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)ls_changeSpace:(CGFloat)space fontAndColor:(UIFont *)font Color:(UIColor *)color TotalString:(NSString *)totalString SubStringArray:(NSArray *)subArray {

    if(!totalString.length) return [[NSMutableAttributedString alloc] initWithString:@""];

    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalString];

    for (NSString *rangeStr in subArray) {

        NSRange range = [totalString rangeOfString:rangeStr options:NSBackwardsSearch];

        if (color) {
            [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
        }

        if (font) {
            [attributedStr addAttribute:NSFontAttributeName value:font range:range];
        }
    }

    if (space > 0) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:space];
        [attributedStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [totalString length])];
    }

    return attributedStr;
}

@end
