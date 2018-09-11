//
//  HJGButton.h
//  NestHouse
//
//  Created by DH on 2017/6/6.
//  Copyright © 2017年 DH. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  按钮中图片的位置
 */
typedef NS_ENUM(NSUInteger, HJGImageAlignment) {
    /**
     *  图片在左，默认
     */
    HJGImageAlignmentLeft = 0,
    /**
     *  图片在上
     */
    HJGImageAlignmentTop,
    /**
     *  图片在下
     */
    HJGImageAlignmentBottom,
    /**
     *  图片在右
     */
    HJGImageAlignmentRight,
};

@interface HJGButton : UIButton
/**
 *  按钮中图片的位置
 */
@property(nonatomic,assign)HJGImageAlignment imageAlignment;
/**
 *  按钮中图片与文字的间距
 */
@property(nonatomic,assign)CGFloat spaceBetweenTitleAndImage;
/**
 *  图片大小
 */
@property(nonatomic,assign)CGFloat imageHeight;

@property(nonatomic,assign)CGFloat imageWidth;

@property(nonatomic, assign)CGFloat imageOrginX;


@end
