//
//  UIImageExtension.h
//  CJ
//
//  Created by weflytotti on 14/10/11.
//  Copyright (c) 2014年 weflytotti. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIImage(Extension)

-(UIImage*)scaleToSize:(CGSize)size;

-(UIImage *)compressForUpload:(UIImage *)original :(CGFloat)scale;

/**
 *
 * png 转换到jpg
 *
 **/
+(NSData*)jpgDataCompressFromPngData:(NSData*)pngData;

+(NSString*)getImageDataPath:(NSData*)pngData;

+ (NSString*)getJpgImageDataPath:(NSData*)pngData;

+(id)createRoundedRectImage:(UIImage*)image size:(CGSize)size radius:(NSInteger)r;

@end
