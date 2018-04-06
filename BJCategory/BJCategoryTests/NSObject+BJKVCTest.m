//
//  NSObject+BJKVCTest.m
//  BJCategoryTests
//
//  Created by ghk on 2018/4/6.
//  Copyright © 2018年 geng hongkai. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Foundation/Foundation.h>
#import "NSObject+BJKVC.h"

@interface NSObject_BJKVCTest : XCTestCase

@end

@implementation NSObject_BJKVCTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {

    //通过KVC找到UISearchBar的子视图textField,的key，该方法会打印出要找的key.
    NSArray *arr = [NSObject propertyKeysOfClassName:@"UISearchBar" withSearchKey:@"field"];
    NSLog(@"%@",arr);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
