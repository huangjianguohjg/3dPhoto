//
//  HJGSettingBGController.m
//  Photo
//
//  Created by Developer on 2018/8/14.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJGSettingBGController.h"
#import "HJGCollectionViewCell.h"

@interface HJGSettingBGController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

//collection
@property (nonatomic, strong) UICollectionView *collection;

@end

@implementation HJGSettingBGController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configNav];
    
    [self configView];
    
}


#pragma mark - configNav
- (void)configNav{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"Set background theme";
    
}

#pragma mark - configView
- (void)configView{
    
    //collection
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.sectionInset = UIEdgeInsetsMake(H(10),W(10),H(10),W(10));
    self.collection = [[UICollectionView alloc]initWithFrame:CGRectMake(W(0), kMarginTopHeight, WIDTH - W(0), HEIGHT - kMarginTopHeight) collectionViewLayout:layout];
    self.collection.delegate = self;
    self.collection.dataSource = self;
    self.collection.backgroundColor = [UIColor clearColor];
    self.collection.showsVerticalScrollIndicator = NO;
    
    [self.collection registerClass:[HJGCollectionViewCell class] forCellWithReuseIdentifier:imageCella];
    
    [self.view addSubview:self.collection];
}

#pragma mark - collectionDelegate and dataSourse


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 16;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((WIDTH- W(10))/4.0, H(300));
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HJGCollectionViewCell *cell = (HJGCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:imageCella forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor redColor];
    cell.bgImageCell.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",indexPath.row + 1]];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(H(10), W(10), H(10), W(10));
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HJGCollectionViewCell *cell = (HJGCollectionViewCell *)[self.collection cellForItemAtIndexPath:indexPath];
    UIImage *image = cell.bgImageCell.image;
    
    if (_block) {
        _block(image);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
