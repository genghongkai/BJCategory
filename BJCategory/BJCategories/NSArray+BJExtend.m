//
//  NSArray+BJExtend.m
//  BJPlace
//
//  Created by ghk on 2018/5/28.
//  Copyright © 2018年 geng hongkai. All rights reserved.
//

#import "NSArray+BJExtend.h"
#import <objc/runtime.h>

@implementation NSArray (BJExtend)

- (void)setTotalCount:(NSString *)totalCount {

    objc_setAssociatedObject(self, @selector(totalCount), totalCount, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)totalCount {
    return objc_getAssociatedObject(self, @selector(totalCount));
}

@end
