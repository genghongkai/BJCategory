//
//  NSArray+Log.m
//  ZHFinance
//
//  Created by 耿宏凯 on 2017/8/3.
//  Copyright © 2017年 com.jiutian.com. All rights reserved.
//

#import "NSArray+Log.h"
#import <objc/runtime.h>

@implementation NSArray (Log)

- (NSString *)debugDescription
{
    return [NSString stringWithFormat:@"<%@: %p> -- %@",[self class], self, [self stringByArray]];
}

- (NSString *)stringByArray {

    NSMutableString *str = [NSMutableString string];
    [str appendString:@"[\n"];


    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

        NSString *classStr = NSStringFromClass([obj class]);

        if ([obj isKindOfClass:[NSString class]]) {

            //数组当中是字符串
            [str appendFormat:@"\t\t%@,\n", obj];

        } else if([[classStr lowercaseString] hasSuffix:@"model"]) {

            //数组当中是模型
            [str appendFormat:@"\t\t%@,\n",[self strWithModel:obj]];
        } else {

            //其他类型
            [str appendFormat:@"\t\t%@,\n",obj];
        }
    }];

    [str appendString:@"]"];

    // 删除最后一个,
    NSRange range = [str rangeOfString:@"," options:NSBackwardsSearch];
    if (range.length) {
        [str deleteCharactersInRange:range];
    }
    return str;
}

- (NSString *)strWithModel:(id)obj {

    //初始化一个字典
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    //得到当前class的所有属性
    uint count;
    objc_property_t *properties = class_copyPropertyList([obj class], &count);

    //循环并用KVC得到每个属性的值
    for (int i = 0; i<count; i++) {
        objc_property_t property = properties[i];
        NSString *name = @(property_getName(property));
        id value = [obj valueForKey:name]?:@"nil";//默认值为nil字符串
        [dictionary setObject:value forKey:name];//装载到字典里
    }

    //释放
    free(properties);

    //return
    return [NSString stringWithFormat:@"%@",dictionary];
}

@end
