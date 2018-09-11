//
//  NSAttributedString+SizeFont.m
//  NestHouse
//
//  Created by shansander on 2017/4/10.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "NSAttributedString+SizeFont.h"
#import <YYText.h>
@implementation NSAttributedString(SizeFont)


- (CGSize)sizeLabelToFitWithwidth:(CGFloat)width height:(CGFloat)height {
    UILabel *tempLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    tempLabel.attributedText = self;
    tempLabel.numberOfLines = 0;
    [tempLabel sizeToFit];
    CGSize size = tempLabel.frame.size;
    size = CGSizeMake(ceil(size.width), ceil(size.height));
    return size;
}


+ (CGFloat)maxHeightWithLines:(NSInteger)lines maxWidth:(CGFloat)width Attributed:(NSDictionary* )attributed LineSpacing:(NSInteger)lineSpacing
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];//调整行间距
    NSString * content_string = @"臧\n臧\n臧\n";
    NSMutableAttributedString * attributed_string = [[NSMutableAttributedString alloc] initWithString:content_string attributes:attributed];
    [attributed_string addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, content_string.length)];
    CGSize max_size = [attributed_string sizeLabelToFitWithwidth:width height:MAXFLOAT];
    return max_size.height;
}



@end
