//
//  NSDictionary+Log.m
//  ZHFinance
//
//  Created by 耿宏凯 on 2017/8/3.
//  Copyright © 2017年 com.jiutian.com. All rights reserved.
//

#import "NSDictionary+Log.h"

@implementation NSDictionary (Log)

- (NSString *)description {

    NSMutableString *str = [NSMutableString string];
    [str appendString:@"{\n"];

    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [str appendFormat:@"\t%@ = %@,\n",key,obj];
    }];

    [str appendString:@"}"];

    // 删除最后一个,
    NSRange range = [str rangeOfString:@"," options:NSBackwardsSearch];
    if (range.length) {
        [str deleteCharactersInRange:range];
    }

    return [NSString stringWithFormat:@"< %@ %@ > : %@",NSStringFromClass([self class]),self,str];
}

- (NSString *)debugDescription
{
    NSMutableString *str = [NSMutableString string];
    [str appendString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [str appendFormat:@"\t%@ = %@,\n",key,obj];
    }];
    
    [str appendString:@"}"];
    
    // 删除最后一个,
    NSRange range = [str rangeOfString:@"," options:NSBackwardsSearch];
    if (range.length) {
        [str deleteCharactersInRange:range];
    }

    return [NSString stringWithFormat:@"< %@ %@ > : %@",NSStringFromClass([self class]),self,str];
}

@end
