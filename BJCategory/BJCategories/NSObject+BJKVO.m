//
//  NSObject+KVO.m
//  GHK_AfarWheel
//
//  Created by ghk on 2018/3/23.
//  Copyright © 2018年 geng hongkai. All rights reserved.
//

#import "NSObject+BJKVO.h"
#import <objc/runtime.h>

typedef void (^KVOBlock)(void);
typedef void (^deallocBlock)(void);

@interface BJKVOController : NSObject

/** 被观察者*/
@property (nonatomic, strong) NSObject *observed;

@property (nonatomic, strong) NSMutableArray <deallocBlock>*removeArr;

@end

@implementation BJKVOController

- (NSMutableArray <deallocBlock>*)removeArr {

    if (!_removeArr) {
        _removeArr = [NSMutableArray array];
    }
    return _removeArr;
}

- (void)dealloc
{
    [self.removeArr enumerateObjectsUsingBlock:^(deallocBlock  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

        if(obj) obj();
    }];
}

@end

@interface NSObject ()

/** 保存KVOBlock*/
@property (nonatomic, strong) NSMutableDictionary <NSString *,KVOBlock>*dicts;
/** <##>*/
@property (nonatomic, strong) BJKVOController *kvoController;

@end

@implementation NSObject (BJKVO)

- (void)addKVObserved:(NSObject *)observed forKeyPath:(NSString *)keyPath block:(void (^)(void))block
{
    //1.保存KVOBlock
    self.dicts[keyPath] = block;

    /*self->BJKVOController->observed
     self : ViewController
     BJKVOController : 保存移除Block
     observed : 被观察者
     */
    self.kvoController.observed = observed;

    //2.添加deallocBlock
    __unsafe_unretained typeof(self) weakSelf = self;
    [self.kvoController.removeArr addObject:^(void) {

        [observed removeObserver:weakSelf forKeyPath:keyPath];

    }];

    //3.被观察者添加观察者
    [observed addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:nil];
}

- (NSMutableDictionary *)dicts {

    NSMutableDictionary *tempDicts = objc_getAssociatedObject(self,@selector(dicts));
    if (!tempDicts) {

        tempDicts = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, @selector(dicts), tempDicts, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return tempDicts;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    KVOBlock block = self.dicts[keyPath];
    if (block) block();
}

- (BJKVOController *)kvoController {

    BJKVOController *tempKVOController = objc_getAssociatedObject(self, @selector(kvoController));
    if (!tempKVOController) {
        tempKVOController = [[BJKVOController alloc] init];
        objc_setAssociatedObject(self, @selector(kvoController), tempKVOController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return tempKVOController;
}


@end
