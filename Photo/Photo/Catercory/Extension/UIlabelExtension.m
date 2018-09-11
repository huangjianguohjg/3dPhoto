//
//  UIlabelExtension.m
//  CJ
//
//  Created by weflytotti on 14/11/16.
//  Copyright (c) 2014年 weflytotti. All rights reserved.
//

#import "UIlabelExtension.h"


@implementation UILabel(Extension)

-(CGSize)lblContentSize:(CGSize)size
{
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = self.lineBreakMode;
    paragraphStyle.alignment = self.textAlignment;
    
    NSDictionary * attributes = @{NSFontAttributeName : self.font,
                                  NSParagraphStyleAttributeName : paragraphStyle};
    
    CGSize contentSize = [self.text boundingRectWithSize:CGSizeMake(size.width, MAXFLOAT)
                                                 options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                              attributes:attributes
                                                 context:nil].size;
    return contentSize;
}

@end

