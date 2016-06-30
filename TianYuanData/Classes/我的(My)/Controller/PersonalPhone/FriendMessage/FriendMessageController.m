//
//  FriendMessageController.m
//  TianYuanData
//
//  Created by 天元数科 on 16/5/27.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "FriendMessageController.h"
#import "FirstMessageCell.h"
#import "SecondMessageCell.h"


@interface FriendMessageController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic)UITableView *tableView;

@end

@implementation FriendMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发表动态";
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
//    [_tableView registerClass:[FirstMessageCell class] forCellReuseIdentifier:@"cell"];
    [_tableView registerClass:[SecondMessageCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondMessageCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 7.9;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 290 *SCREEN_HEIGHT/1136;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
