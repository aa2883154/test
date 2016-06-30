//
//  TrackCollectionView.m
//  TianYuanData
//
//  Created by 天元数科 on 16/6/2.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "TrackCollectionView.h"
#import "TrackCollectionCell.h"
#import "TrackDetailController.h"

@interface TrackCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic)UICollectionView *collectionView;

@end

@implementation TrackCollectionView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64 + 65*SCREEN_HEIGHT/1136, self.view.frame.size.width, self.view.frame.size.height-148) collectionViewLayout:layout];
    self.automaticallyAdjustsScrollViewInsets = NO;
    layout.sectionInset = UIEdgeInsetsMake(18 *SCREEN_HEIGHT/1135, 30 *SCREEN_WIDTH/650, 18 *SCREEN_HEIGHT/1135, 30 *SCREEN_WIDTH/650);
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerNib:[UINib nibWithNibName:@"TrackCollectionCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    _collectionView.backgroundColor = [UIColor whiteColor];
    layout.itemSize = CGSizeMake(168*SCREEN_WIDTH/650,168*SCREEN_WIDTH/650+10);
    [self.view addSubview:_collectionView];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TrackCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];

    return cell;
}

//点击事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TrackDetailController *detail = [[TrackDetailController alloc]init];
    
    [self.navigationController pushViewController:detail animated:YES];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
