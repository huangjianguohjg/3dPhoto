//
// Created by Liu Gang on 3/10/14.
// Copyright (c) 2014 wepie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WPSyncAlertView : UIAlertView
- (id)initWithTitle:(NSString *)title message:(NSString *)message completion:(void(^)(UIAlertView *alertView, NSInteger buttonIndex))completion cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...;
- (id)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherTitles completion:(void (^)(UIAlertView *alertView, NSInteger buttonIndex))completion;
+ (void)alert:(NSString *)alert;
+ (void)alertError:(NSString *)alert;
+ (void)alert:(NSString *)alert title:(NSString *)title;
+ (void)alert:(NSString *)alertText title:(NSString *)title confirmButtonTitle:(NSString *)confirm confirmed:(dispatch_block_t)handler;
+ (void)alert:(NSString *)alertText title:(NSString *)title confirmButtonTitle:(NSString *)confirm cancelButtonTitle:(NSString *)cancel confirmed:(dispatch_block_t)handler;
+ (WPSyncAlertView *)alertViewWithTextField:(void (^)(NSString *text))completion title:(NSString *)title message:(NSString *)message;
+ (WPSyncAlertView *)alertViewWithTextField:(void (^)(NSString *text))completion title:(NSString *)title message:(NSString *)message keyboardType:(UIKeyboardType)keyboardType;
+ (void)alertWithTextField:(void (^)(NSString *text))completion title:(NSString *)title message:(NSString *)message;
+ (void)alertWithTextField:(void (^)(NSString *text))completion title:(NSString *)title message:(NSString *)message keyboardType:(UIKeyboardType)keyboardType;
+ (void)alertWithDoudleTextField:(void (^)(NSString *text1,NSString *text2))completion title:(NSString *)title message:(NSString *)message keyboardType1:(UIKeyboardType)keyboardType1 keyboardType2:(UIKeyboardType)keyboardType2 placeholder1:(NSString *)placeholder1 placeholder2:(NSString *)placeholder2;
+ (void)alertWithDoudleTextField:(void (^)(NSString *text1,NSString *text2))completion title:(NSString *)title message:(NSString *)message keyboardType1:(UIKeyboardType)keyboardType1 keyboardType2:(UIKeyboardType)keyboardType2 placeholder1:(NSString *)placeholder1 placeholder2:(NSString *)placeholder2 text1:(NSString *)text1 text2:(NSString *)text2;
@end