//
//  MessageViewController.m
//  TianYuanData
//
//  Created by 天元数科 on 16/5/24.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "MessageViewController.h"
#import "ReceiveMessageController.h"
#import "SupportController.h"
#import "BarelyController.h"

@interface MessageViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic)UITableView *tableView;
@property(nonatomic)NSArray *arr;

@property(nonatomic)NSArray *array;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _arr = @[@"评论",@"赞",@"差评"];
    _array = @[@"evaluate-list-icon",@"evaluate-list-praise-icon",@"evaluate-list-opposed-icon"];
    self.title = @"评论";
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    [self setExtraCellLineHidden:self.tableView];
}
#pragma mark - 将多余的线隐藏
- (void)setExtraCellLineHidden: (UITableView *)tableView{
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
    [tableView setTableHeaderView:view];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.arr[indexPath.row];
#pragma mark - 评论 赞 图标
    UIImage *icon = [UIImage imageNamed:self.array[indexPath.row]];
    CGSize itemSize = CGSizeMake(30, 30);
    UIGraphicsBeginImageContextWithOptions(itemSize, NO,0.0);
    CGRect imageRect = CGRectMake(0.0, 0.0, 30, 30);
    [icon drawInRect:imageRect];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
#pragma  mark - 显示的箭头
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(15 , 90*SCREEN_HEIGHT/1334-1, 8, 15)];
    imageView.image = [UIImage imageNamed:@"arrow-right"];
    imageView.center = CGPointMake(SCREEN_WIDTH-21, cell.contentView.center.y);
    [cell.contentView addSubview:imageView];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    return 108 *SCREEN_HEIGHT/1136;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        ReceiveMessageController *receive = [[ReceiveMessageController alloc]init];
         //根据id传递 显示具体 正文信息信息
    
        [self.navigationController pushViewController:receive animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
