//
//  ViewController.m
//  reigns'finalwork
//
//  Created by Apple4 on 17/6/28.
//  Copyright © 2017年 b14041316杜晓枫. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "AppDelegate.h"
#import "UIImageView+WebCache.h"
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property(strong,nonatomic) UICollectionView *collectionView;
@property(strong,nonatomic) NSMutableArray *arr;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.arr = [NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pic" ofType:@"plist"]];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.collectionView = [[UICollectionView alloc] initWithFrame:[[UIScreen mainScreen] bounds] collectionViewLayout:flowLayout];
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"MyCollectionCell"];
    
    self.collectionView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.collectionView];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
  }

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.arr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
      CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCollectionCell" forIndexPath:indexPath];
    UIImageView *imv = [[UIImageView alloc] init];
    [imv sd_setImageWithURL:self.arr[indexPath.row] placeholderImage:[UIImage imageNamed:@"u=2312994427,1092373000&fm=21&gp=0.jpg"] options:SDWebImageRetryFailed];
    cell.backgroundView = imv;
     cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Img361868872.jpg"]];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((SCREEN_WIDTH - 80) / 3, (SCREEN_WIDTH - 80) / 3 + 20);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(20, 20, 10, 20);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(300, 20);
}

@end

