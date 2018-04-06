//
//  NSObject+BJKVC.h
//  BJCategory
//
//  Created by ghk on 2018/4/6.
//  Copyright © 2018年 geng hongkai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (BJKVC)

/**
 查找key,例如：找UISearchBar的子视图TextField的key.
 NSArray *arr = [NSObject propertyKeysOfClassName:@"UISearchBar" withSearchKey:@"field"];
 结果是：@"_searchField"

 @param className 要查找的类名
 @param keyName 搜索键的关键字
 @return 找到的Keys
 */
+(NSArray *)propertyKeysOfClassName:(NSString *)className withSearchKey:(NSString *)keyName;

@end
