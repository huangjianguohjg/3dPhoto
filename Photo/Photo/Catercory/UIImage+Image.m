//
//  UIImage+Image.m
//  XianYu
//
//  Created by li  bo on 16/5/28.
//  Copyright © 2016年 li  bo. All rights reserved.
//

#import "UIImage+Image.h"

#import <objc/message.h>
@implementation UIImage (Image)

+ (UIImage *)imageWithColor:(UIColor *)color {

    //描述一个矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);

    //获得图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    //使用color演示填充上下文
    CGContextSetFillColorWithColor(ctx, [color CGColor]);

    //渲染上下文
    CGContextFillRect(ctx, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

    //关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
    
}


#pragma mark - 类初次加载会调用

+ (void)load{
    Method imageNamed = class_getClassMethod(self, @selector(imageNamed:));
    
    Method HJGImageNamed = class_getClassMethod(self, @selector(HJGImageNamed:));
    
    method_exchangeImplementations(imageNamed, HJGImageNamed);
    


}

+ (UIImage *)HJGImageNamed:(NSString *)imageName{
    UIImage *image = [self HJGImageNamed:imageName];
    if (!image) {
//        DLog(@"图片资源不存在");
    }else{
//        DLog(@"加载图片资源成功");
    }
    return image;

}

- (UIImage *)scaleToSize:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage; 
}


@end
