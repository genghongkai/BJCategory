//
//  NSObject+KVO.h
//  GHK_AfarWheel
//
//  Created by ghk on 2018/3/23.
//  Copyright © 2018年 geng hongkai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (BJKVO)

/**
 KVO,此封装方法有一个缺陷，无法监听ViewController中的属性

 @param observed 被观察者
 @param keyPath 被观察者的属性
 @param block 被观察者的属性被修改后的回调
 */
- (void)addKVObserved:(NSObject *)observed forKeyPath:(NSString *)keyPath block:(void (^)(void))block;

@end
