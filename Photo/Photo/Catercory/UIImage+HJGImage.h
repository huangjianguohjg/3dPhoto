//
//  UIImage+HJGImage.h
//  ChilEducation
//
//  Created by DH on 2017/8/12.
//  Copyright © 2017年 DH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HJGImage)

-(UIImage*)getSubImage:(CGRect)rect;
-(UIImage*)scaleToSize:(CGSize)size;

@end
