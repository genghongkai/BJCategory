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
NSLog(@"%@ is nil",param);  \
return nil; \
}

#define BJCategoryAssertParamNotNilReturn(param) \
if ((param) == NO) return;


#endif
