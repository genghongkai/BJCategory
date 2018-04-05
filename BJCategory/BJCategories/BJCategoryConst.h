//
#ifndef __BJCategoryConst__H__
#define __BJCategoryConst__H__

#import <Foundation/Foundation.h>

// 日志输出
#ifdef DEBUG
#define BJCategoryLog(...) NSLog(__VA_ARGS__)
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

// 颜色
#define BJCategoryRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.00 green:(g)/255.00 blue:(b)/255.00 alpha:a]
#define BJCategoryRGBColor(r, g, b) RGBAColor(r, g, b, 1.0)

#endif
