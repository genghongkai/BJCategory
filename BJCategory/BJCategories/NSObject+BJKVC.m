//
//  NSObject+BJKVC.m
//  BJCategory
//
//  Created by ghk on 2018/4/6.
//  Copyright © 2018年 geng hongkai. All rights reserved.
//

#import "NSObject+BJKVC.h"
#import "BJCategoryConst.h"
#import <objc/runtime.h>

@implementation NSObject (BJKVC)

+(NSArray *)propertyKeysOfClassName:(NSString *)className withSearchKey:(NSString *)keyName {

    if (!className.length) {
        return nil;
    }
    //1.利用runtime找到这个类所有的keys.
    NSMutableArray *propertyKeys = [NSMutableArray array];
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(NSClassFromString(className), &count);
    for (NSInteger i=0; i<count; i++) {
        Ivar ivar = ivarList[i];
        NSString *ivarName = [[NSString alloc] initWithCString:ivar_getName(ivar) encoding:NSUTF8StringEncoding];

        [propertyKeys addObject:ivarName];
    }

    //2.转为小写
    NSMutableArray *lowerKeys = [NSMutableArray array];
    for (NSString *ivarName in propertyKeys) {
        [lowerKeys addObject:[ivarName lowercaseString]];
    }

    //3.使用谓词模糊搜索找到结果
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(SELF CONTAINS %@)",[keyName lowercaseString]];
    NSArray *keyNames = [lowerKeys filteredArrayUsingPredicate:predicate];

    //4.取出找到结果的indexs
    NSMutableArray *indexs = [NSMutableArray array];
    [lowerKeys enumerateObjectsUsingBlock:^(id  _Nonnull obj1, NSUInteger idx1, BOOL * _Nonnull stop) {

        [keyNames enumerateObjectsUsingBlock:^(id  _Nonnull obj2, NSUInteger idx2, BOOL * _Nonnull stop) {

            if ([obj1 isEqualToString:obj2]) {
                [indexs addObject:@(idx1)];
            }
        }];
    }];

    //5.取出找到的结果
    [lowerKeys removeAllObjects];
    for (NSNumber *index in indexs) {

        [lowerKeys addObject:propertyKeys[[index integerValue]]];
    }
    return lowerKeys;
}

@end
