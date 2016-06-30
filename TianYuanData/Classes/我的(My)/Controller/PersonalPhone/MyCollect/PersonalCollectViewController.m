//
//  PersonalCollectViewController.m
//  TianYuanData
//
//  Created by 天元数科 on 16/5/26.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "PersonalCollectViewController.h"
#import "PersonalCollectCell.h"

@interface PersonalCollectViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic)UITableView *tableView;

@property(nonatomic)UIView *white;

@property(nonatomic)UIImage *img;

@property(nonatomic)UIView *line;

@property(nonatomic)UIButton *yellowBtn;

@end

@implementation PersonalCollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的收藏";
    self.view.backgroundColor =Yellow_Color;
//    self.navigationController.navigationBar.translucent = NO;
    [self.tableView setEditing:YES animated:YES];
    [self UI];
}

-(void)UI
{
    _tableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
//    _tableView.estimatedRowHeight = 2;
    
    [_tableView registerClass:[PersonalCollectCell class] forCellReuseIdentifier:@"cell"];
    
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:_tableView];
    //编辑按钮
    UIButton *editBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    editBtn.frame = CGRectMake(0, 0, 60, 30);
    [editBtn setTitle:@"编辑" forState:UIControlStateNormal];
    editBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    editBtn.tintColor  = Yellow_Color;
    editBtn.tag = 1;
    [editBtn addTarget:self action:@selector(didClickbtn:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightitem = [[UIBarButtonItem alloc]initWithCustomView:editBtn];
    self.navigationItem.rightBarButtonItem = rightitem;
    //全部删除按钮
    _yellowBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 76 *SCREEN_HEIGHT/1136)];
    _yellowBtn.backgroundColor = Yellow_Color;
   [_yellowBtn setTitle:@"全部删除" forState:UIControlStateNormal];
    [_yellowBtn addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_yellowBtn];
}

#pragma mark - 全部删除按钮的事件
-(void)deleteClick
{
    NSLog(@"全部删除");
}

//编辑按钮的点击事件
-(void)didClickbtn:(UIButton *)btn
{
    if (btn.tag == 1) {
       [btn setTitle:@"完成" forState:UIControlStateNormal];
        //系统的 删除 红色按钮
        [self.tableView setEditing:YES animated:YES];
        //改变线的位置
        if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 90 *SCREEN_WIDTH/650, 0, 0)];
        }
        
         _yellowBtn.frame = CGRectMake(0, SCREEN_HEIGHT-76*SCREEN_HEIGHT/1136, SCREEN_WIDTH, 76 *SCREEN_HEIGHT/1136);
        
        _tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT -76 *SCREEN_HEIGHT/1136);
    }else
    {
        [btn setTitle:@"编辑" forState:UIControlStateNormal];

       //这行是系统的 删除 红色按钮
        [self.tableView setEditing:NO animated:YES];
        if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 14, 0, 0)];
        }
        [UIView animateWithDuration:0.2f animations:^{
            _yellowBtn.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 76 *SCREEN_HEIGHT/1136);
        }];
        _tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    btn.tag = (btn.tag +1)%2;
}

- (void)drawRect:(CGRect)rect {
    _line.frame = CGRectMake(55, 179 *SCREEN_HEIGHT/1334, SCREEN_WIDTH, 1);
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  150 *SCREEN_HEIGHT/1136;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PersonalCollectCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
