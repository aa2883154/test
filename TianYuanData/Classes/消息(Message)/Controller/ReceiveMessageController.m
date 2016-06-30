//
//  ReceiveMessageController.m
//  TianYuanData
//
//  Created by 天元数科 on 16/6/7.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "ReceiveMessageController.h"
#import "ReceiveMessageCell.h"

@interface ReceiveMessageController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic)UITableView *tableView;

@end

@implementation ReceiveMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //判断显示不同的标题
    self.title = @"收到的评论";
    [self ui];
}

-(void)ui
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[ReceiveMessageCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ReceiveMessageCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 7.99;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 290 *SCREEN_HEIGHT/1136;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
