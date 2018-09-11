//
//  HJGButton.m
//  NestHouse
//
//  Created by DH on 2017/6/6.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "HJGButton.h"

@implementation HJGButton

- (CGFloat)spaceBetweenTitleAndImage
{
    if (_spaceBetweenTitleAndImage == 0) {
        self.spaceBetweenTitleAndImage = NW(20);
    }
    return _spaceBetweenTitleAndImage;
}

- (CGFloat)imageWidth
{
    if (_imageWidth == 0) {
        _imageWidth = _imageHeight;
    }
    return _imageWidth;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat space = self.spaceBetweenTitleAndImage;
    
    CGFloat imageHeight = self.imageHeight;
    
    CGFloat imageWidth = self.imageWidth;
    
    CGFloat imageOrginX = self.imageOrginX;
    
    CGFloat titleW = CGRectGetWidth(self.titleLabel.bounds);//titleLabel的宽度
    CGFloat titleH = CGRectGetHeight(self.titleLabel.bounds);//titleLabel的高度
    
    CGFloat imageW = CGRectGetWidth(self.imageView.bounds);//imageView的宽度
    CGFloat imageH = CGRectGetHeight(self.imageView.bounds);//imageView的高度
    
    CGFloat btnCenterX = CGRectGetWidth(self.bounds)/2;//按钮中心点X的坐标（以按钮左上角为原点的坐标系）
    CGFloat imageCenterX = btnCenterX - titleW/2;//imageView中心点X的坐标（以按钮左上角为原点的坐标系）
    CGFloat titleCenterX = btnCenterX + imageW/2;//titleLabel中心点X的坐标（以按钮左上角为原点的坐标系）
        
    switch (self.imageAlignment)
    {
        case HJGImageAlignmentTop:
        {
            
            CGRect titleF = self.titleLabel.frame;
            CGRect imageF = self.imageView.frame;
            
            imageF.size.width = imageWidth;
            imageF.size.height = imageHeight;
            imageF.origin.x = self.bounds.size.width/2 - imageHeight/2.0;
            imageF.origin.y = NH(30);
            self.imageView.frame = imageF;
            
            titleF.origin.x = 0;
            titleF.origin.y = CGRectGetMaxY(imageF) + NH(30);
            titleF.size.width = self.bounds.size.width;
            titleF.size.height = self.bounds.size.height - NH(30) - imageF.size.height - NH(30);
            self.titleLabel.frame = titleF;
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
            
        }
            break;
        case HJGImageAlignmentLeft:
        {
            CGRect titleF = self.titleLabel.frame;
            CGRect imageF = self.imageView.frame;
            
            imageF.origin.x = NW(30);
            imageF.size.width = imageWidth;
            imageF.size.height = imageHeight;
            imageF.origin.y = self.bounds.size.height/2- imageF.size.height/2;
            self.imageView.frame = imageF;
            
            titleF.origin.x = CGRectGetMaxX(imageF) + space;
            titleF.origin.y = imageF.origin.y - 2;
            titleF.size.height = imageF.size.height + 4;
            titleF.size.width = self.bounds.size.width - imageWidth - NW(20);
            self.titleLabel.frame = titleF;
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
            self.titleLabel.lineBreakMode =NSLineBreakByWordWrapping;
            
            //如果外界给了图片左起点坐标
            if (imageOrginX != 0) {
                imageF.origin.x = imageOrginX;
                self.titleLabel.textAlignment = NSTextAlignmentLeft;
                titleF.size.width = self.bounds.size.width - imageOrginX - imageWidth - NW(30) - NW(20);
                self.titleLabel.frame = titleF;
            }
            
        }
            break;
        case HJGImageAlignmentBottom:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(-(imageH/2+ space/2), -(titleCenterX-btnCenterX), imageH/2 + space/2, titleCenterX-btnCenterX);
            self.imageEdgeInsets = UIEdgeInsetsMake(titleH/2 + space/2, btnCenterX-imageCenterX,-(titleH/2+ space/2), -(btnCenterX-imageCenterX));
        }
            break;
        case HJGImageAlignmentRight:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageW + space/2), 0, imageW + space/2);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, titleW+space/2, 0, -(titleW+space/2));
        }
            break;
        default:
            break;
    }
}

@end
