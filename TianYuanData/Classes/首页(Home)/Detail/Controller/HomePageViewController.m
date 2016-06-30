//
//  HomePageViewController.m
//  TianYuanData
//
//  Created by 天元数科 on 16/6/2.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageCell.h"

@interface HomePageViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property(nonatomic)UITableView *tableView;

@property(nonatomic)UIColor *backColor;

@property(nonatomic)UIView *naview;
//头部视图
@property(nonatomic)UIView *headerView;
//头部图片
@property(nonatomic)UIImageView *headerImageView;
//
@end
@implementation HomePageViewController
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}

#pragma mark - 给定一个导航栏图片 在视图将要消失的时候
-(void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"subscription-bg"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
      [self pretableView];
   
  
    [self setupUI];
}

-(void)setupUI
{
    _naview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    [self.view addSubview:_naview];
    _backColor = Yellow_Color;
    
    self.navigationItem.title = @"用户主页";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:Yellow_Color}];
    
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 425 *SCREEN_HEIGHT/1136+45 *SCREEN_HEIGHT/1136)];
    _headerView.backgroundColor = [UIColor whiteColor];
    _headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 425 *SCREEN_HEIGHT/1136)];
    _headerImageView.image = [UIImage imageNamed:@"bg-img_01"];
    _headerImageView.layer.masksToBounds = YES;
    [_headerView addSubview:_headerImageView];
    
//  _headerView.layer.masksToBounds = YES;
    self.tableView.tableHeaderView = _headerView;
    
    //主页头像
    UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake(20 *SCREEN_WIDTH/650, 390 *SCREEN_HEIGHT/1136, 45, 45)];
    [icon setImage:[UIImage imageNamed:@"member-img"]];
    [_tableView addSubview:icon];
    
    UILabel *lbl = [[UILabel alloc]init];
    lbl.text = @"张三丰";
    lbl.font = [UIFont systemFontOfSize:12];
    lbl.textColor = [UIColor whiteColor];
    [_headerImageView addSubview:lbl];
    [lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(icon.mas_right).offset(10 *SCREEN_WIDTH/650);
        make.bottom.mas_equalTo(_headerImageView.mas_bottom).offset(-10 *SCREEN_HEIGHT/1136);
    }];
    //关注按钮
        UIButton *attention = [[UIButton alloc]init];
        [attention setTitle:@"+关注" forState:UIControlStateNormal];
        [attention setTitleColor:Yellow_Color forState:UIControlStateNormal];
        attention.layer.borderColor = Yellow_Color.CGColor;
        attention.titleLabel.font = [UIFont systemFontOfSize:11];
        attention.layer.cornerRadius = 8;
        attention.layer.borderWidth = 1;
        [_headerImageView addSubview:attention];
        [attention mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_headerImageView.mas_top).offset(380 *SCREEN_HEIGHT/1136);
            make.right.mas_equalTo(_headerImageView.mas_right).offset(-30 *SCREEN_WIDTH/650);
            make.width.mas_offset(96 *SCREEN_WIDTH/650);
            make.bottom.mas_equalTo(_headerImageView.mas_bottom).offset(-10 *SCREEN_HEIGHT/1136);
        }];
}

//创建一个tableview
-(void)pretableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -64, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.estimatedRowHeight = 2;
    [_tableView registerClass:[HomePageCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomePageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
  
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat alpha = (offsetY)/300.0f;
    _naview.backgroundColor = [_backColor colorWithAlphaComponent:alpha];
}

//返回事件按钮
-(void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



@end
