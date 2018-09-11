//
//  HJGBaseTableViewCell.m
//  ChilEducation
//
//  Created by DH on 2017/7/26.
//  Copyright © 2017年 DH. All rights reserved.
//

#import "HJGBaseTableViewCell.h"

@implementation HJGBaseTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}

+ (NSString *)getCellIdentifier
{
    return NSStringFromClass(self);
}
#pragma mark - 这个不用了吧
- (void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
}

- (void)loadHomeDataModel:(HJGBaseDataModel * )model
{
    _dataModel = model;
    
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    
    //    self.textLabel.text = NSStringFromClass([self class]);
}
- (void)refeshFrame
{
    DLog(@"cell refash %@",NSStringFromCGRect(self.frame));
    
}

- (UITapGestureRecognizer * )simpleTapGesure
{
    if (!_simpleTapGesure) {
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onsimpleTapAction:)];
        [self.contentView addGestureRecognizer:tap];
        _simpleTapGesure = tap;
    }
    return _simpleTapGesure;
}

- (CGSize)sizeThatFits:(CGSize)size
{
    return CGSizeMake(size.width, self.height_statistics_cell);
}


- (void)onsimpleTapAction:(UIGestureRecognizer *)gesture
{
    
}


- (UIView *)simpleLineView
{
    if (!_simpleLineView) {
        UIView * theView = [[UIView alloc] init];
        theView.backgroundColor = [UIColor colorWithIntegerRed:239 green:239 blue:239];
        [self.contentView addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(W(15));
            make.right.equalTo(self.contentView).offset(-W(15));
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(H(1));
        }];
        _simpleLineView = theView;
    }
    return _simpleLineView;
}

@end
