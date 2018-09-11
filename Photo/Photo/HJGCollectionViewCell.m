//
//  HJGCollectionViewCell.m
//  Photo
//
//  Created by Developer on 2018/8/14.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGCollectionViewCell.h"

@implementation HJGCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI{
    
    [self bgImageCell];
    
}


- (UIImageView *)bgImageCell
{
    if (!_bgImageCell) {
        UIImageView * theView = [[UIImageView alloc] init];
        theView.userInteractionEnabled = YES;
        theView.image  = [UIImage imageNamed:@"bg.jpg"];
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
//            make.center.equalTo(self.contentView);
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView).offset(H(10));
            make.bottom.equalTo(self.contentView).offset(-H(10));
        }];
        _bgImageCell = theView;
    }
    return _bgImageCell;
}

@end
