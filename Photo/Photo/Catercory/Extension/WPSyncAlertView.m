//
// Created by Liu Gang on 3/10/14.
// Copyright (c) 2014 wepie. All rights reserved.
//

#import "WPSyncAlertView.h"

@interface WPSyncAlertView()<UIAlertViewDelegate>
@property (nonatomic, copy) void (^completionBlock)(UIAlertView *alertView, NSInteger buttonIndex);
@end
@implementation WPSyncAlertView
- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
         completion:(void(^)(UIAlertView *alertView, NSInteger buttonIndex))completion
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    NSMutableArray *titles = [NSMutableArray array];
    va_list argumentList;
    NSString *buttonTitle;
    if (otherButtonTitles) {
        [titles addObject:otherButtonTitles];
        va_start(argumentList, otherButtonTitles);
        while ((buttonTitle = va_arg(argumentList, NSString *))) {
            [titles addObject:buttonTitle];
        }
        va_end(argumentList);
    }
    return [self initWithTitle:title message:message cancelButtonTitle:cancelButtonTitle otherButtonTitles:titles completion:completion];
}

- (id)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherTitles completion:(void(^)(UIAlertView *alertView, NSInteger buttonIndex))completion {
    self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    if (self) {
        if (otherTitles) {
            for (NSString *aTitle in otherTitles) {
                [self addButtonWithTitle:aTitle];
            }
        }
        self.delegate = self;
        self.completionBlock = completion;
    }
    return self;
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.completionBlock) {
        self.completionBlock(self, buttonIndex);
    }
}

#pragma mark Convenience

+ (void)alert:(NSString *)alert {
    [self alert:alert title:@""];
}

+ (void)alertError:(NSString *)alert {
    [self alert:alert title:@"出错了"];
}

+ (void)alert:(NSString *)alert title:(NSString *)title {
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:title message:alert delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil];
    [view show];
}

+ (void)alert:(NSString *)alertText title:(NSString *)title confirmButtonTitle:(NSString *)confirm confirmed:(dispatch_block_t)handler {
    [self alert:alertText title:title confirmButtonTitle:confirm cancelButtonTitle:@"取消" confirmed:handler];
}

+ (void)alert:(NSString *)alertText title:(NSString *)title confirmButtonTitle:(NSString *)confirm cancelButtonTitle:(NSString *)cancel confirmed:(dispatch_block_t)handler {
    WPSyncAlertView *alert = [[WPSyncAlertView alloc]
                              initWithTitle:title
                              message:alertText
                              completion:^(UIAlertView *alertView, NSInteger buttonIndex)
                              {
                                  if (buttonIndex == 1) {
                                      if (handler) {
                                          handler();
                                      }
                                  }
                                  
                              } cancelButtonTitle:cancel otherButtonTitles:confirm, nil];
    [alert show];
}

- (void)show {
    // Hack : 在有Keyboard或者UIActionSheet的时候，显示会发生异常(延迟，崩溃），
    // 系统BUG
    dispatch_async(dispatch_get_main_queue(), ^{
        [super show];
    });
}

+ (WPSyncAlertView *)alertViewWithTextField:(void (^)(NSString *text))completion title:(NSString *)title message:(NSString *)message {
    return [self alertViewWithTextField:(void (^)(NSString *text))completion title:(NSString *)title message:(NSString *)message keyboardType:(UIKeyboardType)UIKeyboardTypeDefault];
}

+ (WPSyncAlertView *)alertViewWithTextField:(void (^)(NSString *text))completion title:(NSString *)title message:(NSString *)message keyboardType:(UIKeyboardType)keyboardType {
    WPSyncAlertView *alert = [[WPSyncAlertView alloc]
                              initWithTitle:title message:message
                              completion:^(UIAlertView *alertView, NSInteger buttonIndex) {
                                  if (buttonIndex == 1) {
                                      completion([alertView textFieldAtIndex:0].text);
                                  }
                              }
                              cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField *tf = [alert textFieldAtIndex:0];
    tf.keyboardType = keyboardType;
    return alert;
}

+ (void)alertWithTextField:(void (^)(NSString *text))completion title:(NSString *)title message:(NSString *)message {
    [[self alertViewWithTextField:completion title:title message:message] show];
}

+ (void)alertWithTextField:(void (^)(NSString *text))completion title:(NSString *)title message:(NSString *)message keyboardType:(UIKeyboardType)keyboardType{
    [[self alertViewWithTextField:completion title:title message:message keyboardType:keyboardType] show];
}

+(void)alertWithDoudleTextField:(void (^)(NSString *, NSString *))completion title:(NSString *)title message:(NSString *)message keyboardType1:(UIKeyboardType)keyboardType1 keyboardType2:(UIKeyboardType)keyboardType2 placeholder1:(NSString *)placeholder1 placeholder2:(NSString *)placeholder2 {
    [self alertWithDoudleTextField:completion title:title message:message keyboardType1:keyboardType1 keyboardType2:keyboardType2 placeholder1:placeholder1 placeholder2:placeholder2 text1:nil text2:nil];
}

+(void)alertWithDoudleTextField:(void (^)(NSString *, NSString *))completion title:(NSString *)title message:(NSString *)message keyboardType1:(UIKeyboardType)keyboardType1 keyboardType2:(UIKeyboardType)keyboardType2 placeholder1:(NSString *)placeholder1 placeholder2:(NSString *)placeholder2 text1:(NSString *)text1 text2:(NSString *)text2 {
    WPSyncAlertView *alert = [[WPSyncAlertView alloc]
                              initWithTitle:title message:message
                              completion:^(UIAlertView *alertView, NSInteger buttonIndex) {
                                  if (buttonIndex == 1) {
                                      completion([alertView textFieldAtIndex:0].text,[alertView textFieldAtIndex:1].text);
                                  }
                              }
                              cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    UITextField *tf1 = [alert textFieldAtIndex:0];
    tf1.keyboardType = keyboardType1;
    tf1.placeholder = placeholder1;
    tf1.text = text1;
    
    UITextField *tf2 = [alert textFieldAtIndex:1];
    tf2.keyboardType = keyboardType2;
    tf2.placeholder = placeholder2;
    tf2.text = text2;
    tf2.secureTextEntry = NO;
    [alert show];
}

@end