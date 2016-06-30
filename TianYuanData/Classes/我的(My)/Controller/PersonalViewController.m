//
//  PersonalViewController.m
//  TianYuanData
//
//  Created by 天元数科 on 16/5/24.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "PersonalViewController.h"
#import "PersonalPhoneViewController.h"
#import "PersonalMakeViewController.h"
#import "PersonalMakeViewController.h"
#import "PersonalCollectViewController.h"
#import "FeedBackController.h"

#import "FriendMessageController.h"

@interface PersonalViewController ()<UITableViewDelegate,UITableViewDataSource,PersonalMakeViewControllerDelegate>

@property(nonatomic)UIImageView *imageview;

@property(nonatomic)NSArray *arr;

@property(nonatomic)NSArray *imageArr;

@property(nonatomic)UIView *v;

@end

@implementation PersonalViewController

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
    [self creatCells];
    [self ui];
    _arr = @[@[@"好友动态"],@[@"我的收藏",@"意见反馈"]];
}
-(void)ui
{
    UIButton *btn  = [[UIButton alloc]init];
    btn.layer.cornerRadius = 25;
    btn.clipsToBounds = YES;
     UIImage *image = [UIImage imageWithData:[[NSUserDefaults standardUserDefaults] valueForKey:@"icon_image"] scale:1];
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"icon_image"]) {
        [btn setBackgroundImage:image forState:UIControlStateNormal];
    }else
    {
        [btn setBackgroundImage:[UIImage imageNamed:@"member-img"] forState:UIControlStateNormal];
        
    }
    [self.imageview addSubview:btn];
    btn.tag = 100;
//    [btn setBackgroundImage:[UIImage imageNamed:@"center-head-img"] forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(didClick) forControlEvents:UIControlEventTouchUpInside];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageview.mas_top).offset(200*SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(self.view.mas_left).offset(270 *SCREEN_WIDTH/640);
        make.height.mas_equalTo(@52);
        make.width.mas_equalTo(@52);
    }];
    
    UILabel *lbl = [[UILabel alloc]init];
    [self.imageview addSubview:lbl];
    lbl.text = @"SSSS-11";
    lbl.textColor = [UIColor whiteColor];
    [lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(btn.mas_bottom).offset(10);
        make.left.mas_equalTo(self.view.mas_left).offset(270 *SCREEN_WIDTH/640);
        make.width.mas_equalTo(SCREEN_WIDTH);
    }];
    
    UIButton *setBtn = [[UIButton alloc]init];
    [setBtn addTarget:self action:@selector(didClick) forControlEvents:UIControlEventTouchUpInside];
    [setBtn setImage:[UIImage imageNamed:@"center-set"] forState:UIControlStateNormal];
    [_imageview addSubview:setBtn];
    [setBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(25);
        make.right.mas_equalTo(self.view.mas_right).offset(-15);
        make.height.mas_equalTo(18);
        make.width.mas_equalTo(18);
    }];
}

-(void)didClick
{
    PersonalMakeViewController *make = [[PersonalMakeViewController alloc]init];
    make.delegate = self;
    make.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:make animated:YES];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeUserImage:) name:@"changeUserImage" object:nil];
  
}
-(void)dealloc
{
    NSLog(@"1");
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

//改变头像
-(void)changeUserImage:(NSNotification *)cation
{
    UIButton *btn = [self.tableView viewWithTag:100];
    [btn setBackgroundImage:cation.userInfo[@"image"] forState:UIControlStateNormal];
//    UIButton *btn2 = [self.tableView viewWithTag:101];
//    [btn2 setBackgroundImage:cation.userInfo[@"image"] forState:UIControlStateNormal];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"changeUserImage" object:nil];
    
    NSData *data = UIImageJPEGRepresentation(cation.userInfo[@"image"], 1);
    [[NSUserDefaults standardUserDefaults]setObject:data forKey:@"icon_image"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}



-(void)creatCells
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.contentInset = UIEdgeInsetsMake(430*SCREEN_HEIGHT/1334, 0, 0, 0);
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    
    self.imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 444*SCREEN_HEIGHT/1136)];
    self.imageview.image = [UIImage imageNamed:@"background-img"];
    self.imageview.userInteractionEnabled = YES;
    [self.tableView addSubview:self.imageview];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.arr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array  = self.arr[section];
    return array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.arr[indexPath.section][indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.textColor = Black_Color;
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-30 , 1, 8, 15)];
    imageView.image = [UIImage imageNamed:@"arrow-right"];
    imageView.center = CGPointMake(SCREEN_WIDTH-21, cell.contentView.center.y);
    [cell.contentView addSubview:imageView];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    FriendMessageController *message = [[FriendMessageController alloc]init];
                    [self.navigationController pushViewController:message animated:YES];
                }
                    break;
                                default:
                    break;
            }
        }
            break;
            case 1:
        {
            switch (indexPath.row) {
                case 0:
                {
                    PersonalCollectViewController *collect = [[PersonalCollectViewController alloc]init];
                    collect.hidesBottomBarWhenPushed = YES;
                    [self.navigationController pushViewController:collect animated:YES];
                }
                    break;
                    case 1:
                {
                    FeedBackController *feed = [[FeedBackController alloc]init];
                    feed.hidesBottomBarWhenPushed = YES;
                    [self.navigationController pushViewController:feed animated:YES];
                }
                    break;
                default:
                    break;
            }
           
        }
        default:
            break;
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat y = scrollView.contentOffset.y;
    if (y < -200) {
        CGRect frame = self.imageview.frame;
        if (y>-500) {
            frame.origin.y = y;
            frame.size.height = -y;
//             frame.origin.x = y *SCREEN_WIDTH/SCREEN_HEIGHT;
//             frame.size.width = y *SCREEN_WIDTH/SCREEN_HEIGHT;
        }
        self.imageview.frame = frame;
    }
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
    
    return 88 *SCREEN_HEIGHT/1136;
}

-(void)presentViewController:(UIViewController *)viewController andPersonalMakeViewController:(PersonalMakeViewController *)PersonalMakeViewController
{
    [self presentViewController:viewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
