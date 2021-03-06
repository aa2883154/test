//
//  ThreeViewController.m
//  TianYuanData
//
//  Created by 天元数科 on 16/6/12.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "ThreeViewController.h"
#import "TrackCollectionCell.h"
#import "TrackDetailController.h"

@interface ThreeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic)UICollectionView *collectionView;

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
    self.automaticallyAdjustsScrollViewInsets = NO;
    layout.sectionInset = UIEdgeInsetsMake(18 *SCREEN_HEIGHT/1135, 30 *SCREEN_WIDTH/650, 18 *SCREEN_HEIGHT/1135, 30 *SCREEN_WIDTH/650);
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerNib:[UINib nibWithNibName:@"TrackCollectionCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    _collectionView.backgroundColor = [UIColor whiteColor];
    layout.itemSize = CGSizeMake(168*SCREEN_WIDTH/650,168*SCREEN_HEIGHT/650+10);
    [self.view addSubview:_collectionView];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TrackCollectionCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    
    
    //
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TrackDetailController *track = [[TrackDetailController alloc]init];
    [self.navigationController pushViewController:track animated:YES];
}

@end
