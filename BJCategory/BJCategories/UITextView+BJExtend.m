//
//  UITextView+BJExtend.m
//  BJPlace
//
//  Created by ghk on 2018/7/30.
//  Copyright © 2018年 geng hongkai. All rights reserved.
//

#import "UITextView+BJExtend.h"
#import <objc/runtime.h>

@interface UITextView ()

@property (nonatomic, readonly) UILabel *bj_placeholderLabel;

@end

@implementation UITextView (BJExtend)

+ (void)initialize
{
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"dealloc")),
                                   class_getInstanceMethod(self.class, @selector(bj_dealloc)));
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"setText:")),
                                   class_getInstanceMethod(self.class, @selector(bj_setText:)));
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"layoutSubviews")),
                                   class_getInstanceMethod(self.class, @selector(bj_layoutSubviews)));
}

- (void)bj_layoutSubviews {

    if (self.bj_placeholder) {

        self.bj_placeholderLabel.frame = CGRectMake(10, 10, self.frame.size.width-20, 15);
    }

    [self bj_layoutSubviews];
}

- (void)bj_dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self bj_dealloc];
}

#pragma mark - update
- (void)updatePlaceHolder{
    
    if (self.text.length) {
        [self.bj_placeholderLabel removeFromSuperview];
        return;
    }
    self.bj_placeholderLabel.font = self.font?self.font:self.cacutDefaultFont;
    self.bj_placeholderLabel.textAlignment = self.textAlignment;
    self.bj_placeholderLabel.text = self.bj_placeholder;
    [self insertSubview:self.bj_placeholderLabel atIndex:0];
}
#pragma mark - lazzing
-(UILabel *)bj_placeholderLabel{
    UILabel *placeHolderLab = objc_getAssociatedObject(self, @selector(bj_placeholderLabel));
    if (!placeHolderLab) {
        placeHolderLab = [[UILabel alloc] init];
        placeHolderLab.numberOfLines = 0;
        placeHolderLab.textColor = [UIColor lightGrayColor];
        objc_setAssociatedObject(self, @selector(bj_placeholderLabel), placeHolderLab, OBJC_ASSOCIATION_RETAIN);
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updatePlaceHolder) name:UITextViewTextDidChangeNotification object:self];
    }
    return placeHolderLab;
}

- (void)bj_setText:(NSString *)text {

    [self bj_setText:text];

    if (self.bj_placeholder) {
        [self updatePlaceHolder];
    }
}

- (void)setBj_placeholder:(NSString *)bj_placeholder {

    objc_setAssociatedObject(self, @selector(bj_placeholder), bj_placeholder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self updatePlaceHolder];
}

- (NSString *)bj_placeholder
{
    return objc_getAssociatedObject(self, @selector(bj_placeholder));
}

- (void)setBj_placeholderColor:(UIColor *)bj_placeholderColor {
    self.bj_placeholderLabel.textColor = bj_placeholderColor;
}

- (UIColor *)bj_placeholderColor {

    return self.bj_placeholderLabel.textColor;
}

- (UIFont *)cacutDefaultFont{
    static UIFont *font = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UITextView *textview = [[UITextView alloc] init];
        textview.text = @" ";
        font = textview.font;
    });
    return font;
}

@end
