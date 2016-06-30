//
//  TrackDetailController.m
//  TianYuanData
//
//  Created by 天元数科 on 16/6/2.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "TrackDetailController.h"
#import "TrackDetailCell.h"
#import "NewsDetailController.h"
#import "HomeViewController.h"

@interface TrackDetailController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property(nonatomic)UITableView *tableView;

//搜索框放大镜
@property(nonatomic)UIImageView *leftView;
@end

@implementation TrackDetailController

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
    self.view.backgroundColor = [UIColor whiteColor];
//    self.automaticallyAdjustsScrollViewInsets = NO;
    [self UI];
}
-(void)UI
{
    //自定义了黄色导航条
    UIView *yellowView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    yellowView.backgroundColor = Yellow_Color;
    [self.view addSubview:yellowView];
    //创建tableview
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-44)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.estimatedRowHeight = 2;
    [_tableView registerNib:[UINib nibWithNibName:@"TrackDetailCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    //自定义返回按钮
    UIButton *back = [UIButton new];
    [back setImage:[UIImage  imageNamed:@"arrow-left-gray"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [yellowView addSubview:back];
    [back mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(yellowView.mas_top).offset(65 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(yellowView.mas_left).offset(30 *SCREEN_WIDTH/650);
        make.width.mas_offset(12);
        make.height.mas_offset(15);
        make.bottom.mas_equalTo(yellowView.mas_bottom).offset(-35 *SCREEN_HEIGHT/1136);
    }];
    
       //搜索框
        UITextField *search = [[UITextField alloc]init];
        search.backgroundColor = [UIColor whiteColor];
        search.placeholder = @"请输入你想搜索的内容";
        search.layer.cornerRadius = 5;
        self.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"search-gray"]];
        self.leftView.frame = CGRectMake(5, 5, 15, 15);
        search.leftViewMode = UITextFieldViewModeAlways;
        search.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 28, 30)];
       [search addSubview:self.leftView];
        search.font = [UIFont systemFontOfSize:10];
        search.textColor = Label_Color;
        [yellowView addSubview:search];
        [search mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(back.mas_right).offset(70 *SCREEN_WIDTH/650);
            make.width.mas_offset(384 *SCREEN_WIDTH/650);
            make.height.mas_offset(44 *SCREEN_HEIGHT/1136);
            make.bottom.mas_equalTo(yellowView.mas_bottom).offset(-25 *SCREEN_HEIGHT/1136);
        }];
    
#pragma mark - 订阅按钮的点击事件
    UIButton *subcribe = [UIButton new];
    [yellowView addSubview:subcribe];
    [subcribe setTitle:@"订阅" forState:UIControlStateNormal];
    [subcribe addTarget:self action:@selector(subClick) forControlEvents:UIControlEventTouchUpInside];
    subcribe.titleLabel.font = [UIFont systemFontOfSize:14];
    subcribe.tintColor = White_Color;
    [subcribe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(yellowView.mas_bottom).offset(-35 *SCREEN_HEIGHT/1136);
        make.height.mas_offset(15);
        make.right.mas_equalTo(yellowView.mas_right).offset(-30 *SCREEN_WIDTH/650);
    }];
}

//订阅按钮
-(void)subClick
{
    HomeViewController *home = [[HomeViewController alloc]init];
    [self.navigationController pushViewController:home animated:YES];
}

//返回按钮
-(void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)dealloc
{
    NSLog(@"dealloc");
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TrackDetailCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsDetailController *detail = [[NewsDetailController alloc]init];
    
    [self.navigationController pushViewController:detail animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
