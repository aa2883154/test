//
//  TrackViewController.m
//  TianYuanData
//
//  Created by 天元数科 on 16/5/24.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "TrackViewController.h"
#import "TrackCollectionCell.h"
//#import "TrackCollectionView.h"
//
//#import "HHSegmentView.h"

#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"

@interface TrackViewController ()<UIScrollViewDelegate>

//@property(nonatomic)UIScrollView *sc;
////
//@property(nonatomic)UICollectionView *collectionView;
//
//@property(nonatomic)UIImageView *leftView;

@property(nonatomic)NSArray *subViewControllers;

@property(nonatomic)UIScrollView *scrollView;

@property(nonatomic,assign) CGFloat btnW;

@property (nonatomic, weak) UIButton *oldBtn;

//大的scrollview
@property (nonatomic, weak) UIScrollView *contentView;

//底部的滚动条
@property (nonatomic, weak) UIView *slider;

@end

@implementation TrackViewController


-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
//    NSArray *titles = @[@"游戏",@"动漫",@"娱乐",@"体育",@"时尚"];
//    for (int i  = 0;i< titles.count;i++) {
//        TrackCollectionView *track= [[TrackCollectionView alloc]init];
//        switch (i) {
//            case 0:
//                [self addChildViewController:track];
//                break;
//                
//            case 1:
//                [self addChildViewController:track];
//                break;
//                
//            case 2:
//                [self addChildViewController:track];
//                break;
//                
//            case 3:
//                [self addChildViewController:track];
//                break;
//                
//            case 4:
//                [self addChildViewController:track];
//                break;
//                
//            case 5:
//                [self addChildViewController:track];
//                break;
//                
//            default:
//                break;
//        }
//    }
//    HHSegmentView *segmentView = [HHSegmentView segmentViewWithTitles:titles viewControls:self.childViewControllers];
//    [self.view addSubview:segmentView];
//    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 65 *SCREEN_HEIGHT/1136)];
//    v.alpha = 0.7;
//    v.backgroundColor = LINE_GRAY;
//    [self.view addSubview:v];
//    
//    UITextField *field = [[UITextField alloc]init];
//    field.backgroundColor = [UIColor whiteColor];
//    field.layer.cornerRadius = 12;
////    field.clipsToBounds = YES;
//    self.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"search-box"]];
//    self.leftView.frame = CGRectMake(5, 8, 15, 15);
//    [field addSubview:self.leftView];
//    [v addSubview:field];
//    
//    [field mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(v.mas_left).offset(30 *SCREEN_WIDTH/640);
//        make.top.mas_equalTo(v.mas_top).offset(5);
//        make.right.mas_equalTo(v.mas_right).offset(-30 *SCREEN_WIDTH/640);
//        make.bottom.mas_equalTo(v.mas_bottom).offset(-5);
//    }];
    OneViewController *one = [[OneViewController alloc]init];
    one.title = @"游戏";
    TwoViewController *two = [[TwoViewController alloc]init];
    two.title = @"动漫";
    ThreeViewController *three = [[ThreeViewController alloc]init];
    three.title = @"娱乐";
    FourViewController *four = [[FourViewController alloc]init];
    four.title = @"体育";
    FiveViewController *five = [[FiveViewController alloc]init];
    five.title = @"时尚";
    _subViewControllers = @[one,two,three,four,five];
    
    //添加上面的导航条
    [self addTopBar];
    //添加子控制器
    [self addVCView];
    //添加滑块
    [self addSliderView];
}

//添加滑块
-(void)addSliderView
{
    if (_subViewControllers.count==0) {
        return;
    }
    UIImageView *slider = [[UIImageView alloc]initWithFrame:CGRectMake(0, 61, _btnW, 3)];
    [slider setImage:[UIImage imageNamed:@"underline"]];
    [_scrollView addSubview:slider];
    self.slider = slider;
}

//大的视图scrollview
-(void)addVCView
{
    UIScrollView *contentView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT -64)];
    self.contentView = contentView;
    self.contentView.bounces = NO;
    contentView.delegate = self;
    //    contentView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:contentView];
    NSUInteger count = _subViewControllers.count;
    
    for (int i=0; i<count; i++) {
        UIViewController *vc = _subViewControllers[i];
        [self addChildViewController:vc];
        vc.view.frame = CGRectMake(i*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT -64);
        [contentView addSubview:vc.view];
    }
    contentView.contentSize = CGSizeMake(count*SCREEN_WIDTH, SCREEN_HEIGHT-64);
    contentView.pagingEnabled = YES;
}
//添加顶部的scrollView
-(void)addTopBar
{
    if (_subViewControllers.count==0) {
        return;
    }
    NSUInteger count = _subViewControllers.count;
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    //    scrollView.backgroundColor = self.topBarColor;
    _scrollView.backgroundColor = Yellow_Color;
    //    self.topBar = scrollView;
    //    self.topBar.bounces = NO;
    _scrollView.bounces = NO;
    [self.view addSubview:_scrollView];
    
    self.btnW = SCREEN_WIDTH / count;
    
    
    for (int i=0; i<_subViewControllers.count; i++)
    {
        UIViewController *vc = _subViewControllers[i];
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i*self.btnW,20, self.btnW, 44)];
        
        btn.tag = 10000+i;
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [btn setTitle:vc.title forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15
                               ];
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:btn];
        if(i == 0)
        {
            //-----------------------------
            btn.selected = YES;
            self.oldBtn = btn;
           
        }
    }
    _scrollView.contentSize = CGSizeMake(self.btnW *count, 64);
}

-(void)click:(UIButton *)sender
{
    if(sender.selected)return;
    self.oldBtn.selected = NO;
    sender.selected = YES;
    self.contentView.contentOffset = CGPointMake((sender.tag - 10000)*SCREEN_WIDTH, 0);
    [UIView animateWithDuration:0.3 animations:^{
        sender.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }];
    self.oldBtn.transform = CGAffineTransformIdentity;
    self.oldBtn = sender;

    //判断导航条是否需要移动
//       CGFloat maxX = CGRectGetMaxX(self.slider.frame);
//       if(maxX >=SCREEN_WIDTH  && sender.tag != _subViewControllers.count + 10000 - 1)
//       {
//           [UIView animateWithDuration:0.3 animations:^{
//              _scrollView.contentOffset = CGPointMake(0, 20);
//            }];
//        }else if(maxX < SCREEN_WIDTH)
//        {
//            [UIView animateWithDuration:0.3 animations:^{
//               _scrollView.contentOffset = CGPointMake(0, 0);
//           }];
//       }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //滑动导航条
    self.slider.frame = CGRectMake(scrollView.contentOffset.x / SCREEN_WIDTH *self.btnW , 61, self.btnW, 3);
}
//判断是否切换导航条按钮的状态
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat offX =  scrollView.contentOffset.x;
    int tag = (int)(offX /SCREEN_WIDTH + 0.5) + 10000;
    UIButton *btn = [self.view viewWithTag:tag];
    if(tag != self.oldBtn.tag)
    {
        [self click:btn];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
