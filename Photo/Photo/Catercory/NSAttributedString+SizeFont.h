//
//  NSAttributedString+SizeFont.h
//  NestHouse
//
//  Created by shansander on 2017/4/10.
//  Copyright © 2017年 DH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString(SizeFont)

/**
 通过临时Label来实现计算NSAttributedString的高度
 
 @param width 指定的宽度
 @param height 指定的高度
 @return 实际NSAttributedString的大小
 */
- (CGSize)sizeLabelToFitWithwidth:(CGFloat)width height:(CGFloat)height;


/**
 计算attributed的高度，几行文字，

 @param lines 多少行文字，文字的例子是臧
 @param width 最大的宽度
 @param attributed attributed的字典
 @param lineSpacing 行高
 @return 几行文字的attributed的最大高度
 */
+ (CGFloat)maxHeightWithLines:(NSInteger)lines maxWidth:(CGFloat)width Attributed:(NSDictionary* )attributed LineSpacing:(NSInteger)lineSpacing;

@end
