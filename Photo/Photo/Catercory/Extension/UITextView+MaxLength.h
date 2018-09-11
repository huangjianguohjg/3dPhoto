//
//  UITextView+MaxLength.h
//  QT
//
//  Created by Heisenbean on 16/8/5.
//  Copyright © 2016年 DavidYang. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^TextViewLengthChangeBlock)(NSInteger currentLength);

@interface UITextView (MaxLength)
/**
 *  最大可输入字数
 */
@property (nonatomic, assign) IBInspectable NSInteger maxLength;
@property (nonatomic, assign) IBInspectable NSInteger minLength;

@property (nonatomic, copy  ) IBInspectable NSString * placeholder;

@property (nonatomic, strong, readonly) UITextView * placeholderView;

@property (nonatomic, assign) NSInteger currentLength;

/**
 *  剩余可输入文本的长度
 */
- (NSInteger)getRemainTextLength;

/**
 *  文本长度是否在设置的范围内
 */
- (BOOL)isTextValide;

/**
 *  监听文本长度变化
 *
 *  @param length 当前text length
 */

@end
