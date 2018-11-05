//
#ifndef __BJCategoryConst__H__
#define __BJCategoryConst__H__

#import <Foundation/Foundation.h>

// 日志输出
#ifdef DEBUG
#ifndef BJCategoryLog
#   define BJCategoryLog(fmt, ...) NSLog((@"\nfunction:%s,line:%d \n" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#endif
#else
#define BJCategoryLog(...)
#endif

//断言
#define BJCategoryAssertParamNotNil(param) \
if ((param) == NO)  \
{ \
return nil; \
}

#define BJCategoryAssertParamNotNilReturn(param) \
if ((param) == NO) return;

/**
 *  懒加载属性,class 初始化方法为init,使用方法见github
 *  @param __CLASS    属性类型
 *  @param __PROPERTY 属性定义值
 *  @return 属性
 */

#define bj_lazyload_objc(class,property)\
-(class *)property{\
if (!_##property)\
_##property = [[class alloc]init];\
return _##property;}

/**
 *  懒加载属性,class 初始化方法为init,使用方法见github
 *  @param __CLASS    属性类型
 *  @param __PROPERTY 属性定义值
 *  @param __BLOCK 一个返回属性
 *  @return 属性
 */
#define bj_lazyload_objc_custom(class,property,block)\
-(class *)property{\
if (!_##property)\
_##property = [[class alloc]init];\
block(_##property);\
return _##property;}\

// 颜色
#define BJCategoryRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.00 green:(g)/255.00 blue:(b)/255.00 alpha:a]
#define BJCategoryRGBColor(r, g, b) RGBAColor(r, g, b, 1.0)

#endif
