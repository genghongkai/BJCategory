//
//  BJCategoryTests.m
//  BJCategoryTests
//
//  Created by ghk on 2018/3/30.
//  Copyright © 2018年 geng hongkai. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+BJExtend.h"

@interface BJCategoryTests : XCTestCase

@end

@implementation BJCategoryTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {

    NSLog(@"%zi",[NSString compareDate:@"2012-12-22 11:22:40" withDate:@"2012-12-22 11:24:00"]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
