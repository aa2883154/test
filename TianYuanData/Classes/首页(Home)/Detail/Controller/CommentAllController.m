//
//  CommentAllController.m
//  TianYuanData
//
//  Created by 天元数科 on 16/6/2.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "CommentAllController.h"
#import "CommentAllCell.h"
#import "HomePageViewController.h"


@interface CommentAllController ()<UITableViewDelegate,UITableViewDataSource,CommentAllCellDelegate>

@property(nonatomic)UITableView *tableView;

@property(nonatomic)UIView *headerView;

//全部评论底部的tabBar
@property(nonatomic)UIView *tabBar;
@end

@implementation CommentAllController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"全部评论";
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-80 *SCREEN_HEIGHT/1136)];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.estimatedRowHeight = 2;
    [_tableView registerClass:[CommentAllCell class] forCellReuseIdentifier:@"cell"];
    [self undertabBar];
}
//底部
-(void)undertabBar
{
    _tabBar = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-80 *SCREEN_HEIGHT/1136, SCREEN_WIDTH, 80 *SCREEN_HEIGHT/1136)];
    _tabBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tabBar];
    //底部发表评论
    UIButton *publishBtn = [[UIButton alloc]init];
    publishBtn.layer.cornerRadius = 8;
    publishBtn.layer.borderColor = LINE_GRAY.CGColor;
    publishBtn.layer.borderWidth = 0.5;
    publishBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    [publishBtn setTitleColor:LINE_GRAY forState:UIControlStateNormal];
    [publishBtn setImage:[UIImage imageNamed:@"import-icon"] forState:UIControlStateNormal];
    [publishBtn setTitle:@"发表评论吧~~" forState:UIControlStateNormal];
    [publishBtn setImageEdgeInsets:UIEdgeInsetsMake(10 *SCREEN_HEIGHT/1136, 20 *SCREEN_WIDTH/650, 10 *SCREEN_HEIGHT/1136, 560 *SCREEN_WIDTH/650)];
    [publishBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 12 *SCREEN_WIDTH/650, 0, 440 *SCREEN_WIDTH/650)];
    [_tabBar addSubview:publishBtn];
    [publishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_tabBar.mas_top).offset(18 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(_tabBar.mas_left).offset(20 *SCREEN_WIDTH/650);
        make.right.mas_equalTo(_tabBar.mas_right).offset(-20 *SCREEN_WIDTH/650);
        make.bottom.mas_equalTo(_tabBar.mas_bottom).offset(-18 *SCREEN_HEIGHT/1136);
    }];
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
    CommentAllCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.delegate = self;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30*SCREEN_HEIGHT/1136;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30*SCREEN_HEIGHT/1136)];
    _headerView.backgroundColor = [UIColor clearColor];
    if (section==1) {
        UIButton *hotbtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 164 *SCREEN_WIDTH/650, 30 *SCREEN_HEIGHT/1136)];
        [hotbtn setBackgroundImage:[UIImage imageNamed:@"subscription-bg"] forState:UIControlStateNormal];
        [hotbtn setTitle:@"热门评论" forState:UIControlStateNormal];
        hotbtn.titleLabel.font = [UIFont systemFontOfSize:9];
        [_headerView addSubview:hotbtn];
    }else
    {
        UIButton *newbtn  = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 164 *SCREEN_WIDTH/650, 30 *SCREEN_HEIGHT/1136)];
        [newbtn setBackgroundImage:[UIImage imageNamed:@"subscription-bg"] forState:UIControlStateNormal];
        [newbtn setTitle:@"最新评论" forState:UIControlStateNormal];
        newbtn.titleLabel.font = [UIFont systemFontOfSize:9];
        [_headerView addSubview:newbtn];
    }
    return _headerView;
}

-(void)pushToHomePage
{
    HomePageViewController *page = [[HomePageViewController alloc]init];
    [self.navigationController pushViewController:page animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
