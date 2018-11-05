//
//  ViewController.m
//  BJCategory
//
//  Created by ghk on 2018/3/30.
//  Copyright © 2018年 geng hongkai. All rights reserved.
//

#import "ViewController.h"
#import "BJCategory.h"

@interface ViewController ()

/** <##>*/
@property (nonatomic, strong) UIView *redView;
/** <##>*/
@property (nonatomic, strong) UILabel *nameLabel;


@end

@implementation ViewController

//测试懒加载
bj_lazyload_objc(UIView, redView);
//测试自定义懒加载
bj_lazyload_objc_custom(UILabel, nameLabel, ^(UILabel *label) {
    label.text = @"自定义";
    label.textColor = [UIColor redColor];
    label.frame = CGRectMake(10, 100, 100, 20);
});

- (void)viewDidLoad {
    [super viewDidLoad];

    //测试懒加载
    self.redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redView];
    [self.view addSubview:self.nameLabel];

    //测试输出日志
    BJCategoryLog(@"11111");

    [self testNSArrayAndBJExtendFunction];
    
    [self testNSArrayAndLogFunction];

    [self testNSDictionaryLogFunction];

    [self testNSMutableAttributedStringBJExtendFunction];

    [self testNSObjectBJKVCFunction];

    [self testNSObjectBJKVOFunction];

    [self testNSObjectBJRouteFunction];

    [self testNSStringBJExtendFunction];

    [self testNSStringBJHeightFunction];

    [self testUIBarButtonItemBJExtendFunction];

    [self testUIColorBJExtendFunction];

    [self testUIDeviceBJExtendFunction];

    [self testUIImageBJExtendFunction];

    [self testUITextViewBJExtendFunction];

    [self testUIViewBJLayoutFunction];
}

- (void)testNSArrayAndBJExtendFunction {

    NSArray *array = @[@"1",@"2"];
    array.totalCount = @"10";
    BJCategoryLog(@"%@,%@",array,array.totalCount);
}

- (void)testNSArrayAndLogFunction {

}

- (void)testNSDictionaryLogFunction {

}

- (void)testNSMutableAttributedStringBJExtendFunction {
    NSString *string = @"你好，啊！";
    NSAttributedString *attributeString = [NSMutableAttributedString ls_changeSpaceWithTotalString:string Space:5];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 100, self.view.width-30, 20)];
    label.attributedText = attributeString;
    label.textColor = UIColor.blackColor;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:label];
}

- (void)testNSObjectBJKVCFunction {

}

- (void)testNSObjectBJKVOFunction {

}

- (void)testNSObjectBJRouteFunction {

}

- (void)testNSStringBJExtendFunction {

}

- (void)testNSStringBJHeightFunction {

}

- (void)testUIBarButtonItemBJExtendFunction {

}

- (void)testUIButtonBJExtendFunction {

}

- (void)testUIColorBJExtendFunction {

}

- (void)testUIDeviceBJExtendFunction {

}

- (void)testUIImageBJExtendFunction {

}

- (void)testUIImageViewBJExtendFunction {

}

- (void)testUITextViewBJExtendFunction {

    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(15, 130, self.view.width-30, 200)];
    textView.backgroundColor = UIColor.purpleColor;
    textView.bj_placeholder = @"请输入内容";
    textView.textContainerInset = UIEdgeInsetsMake(10, 7, 0, 7);
    [self.view addSubview:textView];
}

- (void)testUIViewBJLayoutFunction {

}



@end
