//
//  HomeViewController.m
//  TianYuanData
//
//  Created by 天元数科 on 16/5/24.
//  Copyright © 2016年 天元数科. All rights reserved.

#import "HomeViewController.h"
#import "HomeListModel.h"
#import "HomeListCell.h"
#import "HomeListLabel.h"
#import "SearchViewController.h"

//
//static NSString *identifier = @"cell";

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITextFieldDelegate>
//频道分类列表
@property(nonatomic)NSArray *HomeList;
//当前要展示的频道
@property(nonatomic)NSMutableArray *channelList;
//可滚动的频道分类
@property(nonatomic)UIScrollView *channelScrollView;
//新闻展示的collectionView
@property(nonatomic)UICollectionView *collectionView;
//collectionView下表
@property(nonatomic,assign)int currentIndex;
//textfield left_View
@property(nonatomic)UIImageView *left_View;
//首页订阅按钮
@property(nonatomic)UIView *yellow;

@end

@implementation HomeViewController
{
    UIStatusBarStyle _statusBarStyle;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

-(NSArray *)HomeList
{
    if (_HomeList == nil) {
        _HomeList = [HomeListModel channels];
    }
    return _HomeList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor  =[UIColor whiteColor];
    [self.view addSubview:self.channelScrollView];
    [self.view addSubview:self.collectionView];
    [self search];
    //状态栏
    _statusBarStyle = UIStatusBarStyleLightContent;
    [self setNeedsStatusBarAppearanceUpdate];
    _yellow.hidden = NO;
    
}

//状态栏高亮显示
//-(UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return _statusBarStyle;
}

//搜索按钮的点击
-(void)search
{
    UIView *whiteView = [[UIView alloc]initWithFrame:CGRectMake(0, 128 *SCREEN_HEIGHT/1136, SCREEN_WIDTH, 76 *SCREEN_HEIGHT/1136)];
    whiteView.backgroundColor = LINE_GRAY;
    whiteView.alpha = 0.5;
    [self.view addSubview:whiteView];
    
    UITextField *field = [[UITextField alloc]initWithFrame:CGRectMake(30 *SCREEN_WIDTH/650, 16 *SCREEN_HEIGHT/1136, SCREEN_WIDTH - 30, 44 *SCREEN_HEIGHT/1136)];
    field.placeholder = @"搜索";
    field.delegate = self;
    self.left_View = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"search-box"]];
    self.left_View.frame = CGRectMake(8, 6, 15, 15);
    field.font = [UIFont systemFontOfSize:15];
    field.leftViewMode = UITextFieldViewModeAlways;
    field.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 28, 30)];
    [field addSubview:self.left_View];
    field.layer.cornerRadius = 12;
    field.backgroundColor = [UIColor whiteColor];
    [whiteView addSubview:field];
    
    //订阅按钮的view
    _yellow = [[UIView alloc]init];
    _yellow.backgroundColor = Yellow_Color;
    [self.view addSubview:_yellow];
    [_yellow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_channelScrollView.mas_top).offset(65 *SCREEN_HEIGHT/1136);
        make.right.mas_equalTo(_channelScrollView.mas_right);
        make.bottom.mas_equalTo(_channelScrollView.mas_bottom).offset(-26 *SCREEN_HEIGHT/1136);
        make.width.mas_offset(80 *SCREEN_WIDTH/650);
    }];
    
    //订阅的按钮
    UIButton *subBtn = [[UIButton alloc]init];
    [_yellow addSubview:subBtn];
    [subBtn addTarget:self action:@selector(subClick) forControlEvents:UIControlEventTouchUpInside];
    [subBtn setImage:[UIImage imageNamed:@"delet-subscription"] forState:UIControlStateNormal];
    [subBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_yellow.mas_top).offset(8 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(_yellow.mas_left).offset(20 *SCREEN_WIDTH/650);
//      make.right.mas_equalTo(_yellow.mas_right).offset(-30 *SCREEN_WIDTH/650);
        make.width.mas_offset(17);
        make.height.mas_offset(13);
    }];
    
    //线
    UIView *line = [UIView new];
    line.backgroundColor = [UIColor orangeColor];
    [_yellow addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_yellow.mas_top);
        make.left.mas_equalTo(_yellow.mas_left);
        make.width.mas_offset(1);
        make.bottom.mas_equalTo(_yellow.mas_bottom);
    }];
    
}

//点击订阅按钮
-(void)subClick
{
    
}

//搜索框按钮的点击～跳转到搜索界面
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    SearchViewController *search = [[SearchViewController alloc]init];
    [textField resignFirstResponder];
    [self.navigationController pushViewController:search animated:YES];
}

//导航scrollview的创建
-(UIScrollView *)channelScrollView
{
    if (_channelScrollView == nil) {
        _channelScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 128*SCREEN_HEIGHT/1136)];
        _channelScrollView.backgroundColor = Yellow_Color;
        _channelScrollView.showsHorizontalScrollIndicator = NO;
        _channelList = self.HomeList.mutableCopy;
        [self loadChannel];
    }
    return _channelScrollView;
}
//加载频道列表
-(void)loadChannel
{
    CGFloat margin = 20.0;
    CGFloat x = 30 *SCREEN_WIDTH/650;
    CGFloat h = _channelScrollView.bounds.size.height;
    int i = 0;
    for (HomeListModel *channel in _HomeList)
    {
        HomeListLabel *lbl = [HomeListLabel listLabelWithTitle:channel.tname];
        lbl.textColor = [UIColor whiteColor];
        lbl.font = [UIFont systemFontOfSize:15];
        lbl.frame = CGRectMake(x, 10, lbl.width + margin,h);
        [_channelScrollView addSubview:lbl];
        x +=lbl.bounds.size.width;
        lbl.tag = i++;
        if (lbl.tag==0) {
            [lbl setScale:1];
//            UILabel *lblcount = [[UILabel alloc]initWithFrame:CGRectMake(45, 15, 12, 12)];
//            lblcount.layer.cornerRadius = 5.5;
//            lblcount.clipsToBounds = YES;
//            lblcount.backgroundColor = [UIColor redColor];
//            lblcount.textAlignment = NSTextAlignmentCenter;
//            lblcount.textColor = [UIColor whiteColor];
//            lblcount.text = @"99";
//            lblcount.font = [UIFont systemFontOfSize:7];
//            [lbl addSubview:lblcount];
        }
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelClick:)];
        [lbl addGestureRecognizer:tap];
    }
    _channelScrollView.contentSize = CGSizeMake(x + margin - 8, 0);
}

#pragma mark - 频道分类的点击事件
-(void)labelClick:(UITapGestureRecognizer *)recognizer
{
    HomeListLabel *label = (HomeListLabel *)recognizer.view;
    [_collectionView setContentOffset:CGPointMake(label.tag *_collectionView.frame.size.width, 0)];
    [self scrollViewDidEndScrollingAnimation:_collectionView];
}

//当滚动完成的时候
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self scrollViewDidEndDecelerating:scrollView];
}

#pragma mark - 新闻展示列表
-(UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        CGFloat h = SCREEN_HEIGHT - 64;
        CGRect frame = CGRectMake(0, _channelScrollView.height + 44, SCREEN_WIDTH, h);
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[HomeListCell class] forCellWithReuseIdentifier:@"cell"];
        layout.itemSize = _collectionView.bounds.size;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
    }
    return _collectionView;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _HomeList.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    HomeListModel *channel = _channelList[indexPath.row];
    cell.urlString = channel.urlString;
    
    [self addChildViewController:(UIViewController *)cell.homeNewsTVC];
    
    return cell;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.collectionView.tag = 0;
    
    self.currentIndex = scrollView.contentOffset.x / scrollView.bounds.size.width;
    for (HomeListLabel * lbl in _channelScrollView.subviews) {
        if ([lbl isKindOfClass:[UIImageView class]]) {
            continue;
        }
        //判断是否是当前label
        if (lbl.tag == self.currentIndex) {
            [lbl setScale:1];
        }else
        {
            [lbl setScale:0];
        }
    }
    //频道分类能偏移的最大值
    HomeListLabel *currentLabel = _channelScrollView.subviews[self.currentIndex];
    CGFloat offsetX = currentLabel.center.x  - scrollView.bounds.size.width *0.5;
    CGFloat maxOffsetX = _channelScrollView.contentSize.width - _channelScrollView.bounds.size.width;
    if (offsetX < 0) {
        offsetX = 0;
    }else if (offsetX > maxOffsetX)
    {
        offsetX = maxOffsetX;
    }
    [_channelScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
