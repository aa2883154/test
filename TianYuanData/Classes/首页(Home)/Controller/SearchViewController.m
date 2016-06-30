//
//  SearchViewController.m
//  TianYuanData
//
//  Created by 天元数科 on 16/6/3.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "SearchViewController.h"
#import "JCTagView.h"

@interface SearchViewController ()

@property(nonatomic)UIImageView *left_View;

@property(nonatomic)UIView *historyView;

@property(nonatomic)UILabel *firstLabel;

@property(nonatomic)UILabel *secondLabel;

@property(nonatomic)NSArray *dataSource;

@end

@implementation SearchViewController

-(NSArray *)dataSource
{
    if (!_dataSource) {
        self.dataSource = [NSArray arrayWithObjects:@"这是测试数据",@"死的数据",@"123",@"456",@"789", nil];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}

//
-(void)setupUI
{
    UITextField *text = [[UITextField alloc]initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH - 70, 44 *SCREEN_HEIGHT/1136)];
    text.placeholder = @"搜索";
    text.layer.borderWidth = 1;
    text.layer.cornerRadius = 5;
    text.layer.borderColor = Yellow_Color.CGColor;
    self.left_View = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"search-box"]];
    self.left_View.frame = CGRectMake(5, 5, 15, 15);
    text.leftViewMode = UITextFieldViewModeAlways;
    text.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 28, 30)];
    text.font = [UIFont systemFontOfSize:10];
    [text addSubview:self.left_View];
    UIBarButtonItem *leftItem  = [[UIBarButtonItem alloc]initWithCustomView:text];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"取消"style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    rightItem.tintColor = Yellow_Color;
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.rightBarButtonItem = rightItem;
    
    UILabel *readlbl = [[UILabel alloc]initWithFrame:CGRectMake(14, 30 *SCREEN_HEIGHT/1136+64, SCREEN_WIDTH, 10)];
    readlbl.text = @"阅读历史";
    readlbl.textColor = Label_Color;
    readlbl.font = [UIFont systemFontOfSize:10];
    [self.view addSubview:readlbl];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(14, 30 *SCREEN_HEIGHT/1334 +64 +20, SCREEN_WIDTH - 14, 1)];
    line.backgroundColor = LINE_GRAY;
    [self.view addSubview:line];
    
    UIButton *deleteBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 25, 30 *SCREEN_HEIGHT/1336 +64, 12, 12)];
    [deleteBtn addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
    [deleteBtn setImage:[UIImage imageNamed:@"dustbin"] forState:UIControlStateNormal];
    [self.view addSubview:deleteBtn];
    
    _historyView = [[UIView alloc]init];
    _historyView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_historyView];
    [_historyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(line.mas_top).offset(20 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
    }];
    
    _firstLabel = [[UILabel alloc]init];
    _firstLabel.text = @"世界上有十种人,一种是懂二进制的.";
    _firstLabel.font = [UIFont systemFontOfSize:10];
    _firstLabel.textColor = Black_Color;
    _firstLabel.numberOfLines = 0;
    [_historyView addSubview:_firstLabel];
    [_firstLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_historyView.mas_top).offset(12);
        make.left.mas_equalTo(self.view.mas_left).offset(14);
        make.right.mas_equalTo(self.view.mas_right).offset(-14);
    }];
    
    _secondLabel = [[UILabel alloc]init];
    _secondLabel.text = @"二手玫瑰主唱与王菲当年情";
    _secondLabel.font = [UIFont systemFontOfSize:10];
    _secondLabel.numberOfLines = 0;
    _secondLabel.textColor = Black_Color;
    [_historyView addSubview:_secondLabel];
    [_secondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_firstLabel.mas_bottom).offset(20 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(self.view.mas_left).offset(14);
        make.right.mas_equalTo(self.view.mas_right).offset(-14);
        make.bottom.mas_equalTo(_historyView.mas_bottom).offset(-1);
    }];
    
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"hot"]];
    [self.view addSubview:image];
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_historyView.mas_bottom).offset(60 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(self.view.mas_left).offset(14);
        make.height.mas_offset(12);
        make.width.mas_offset(12);
    }];
    
    UILabel *hotlabel = [[UILabel alloc]init];
    hotlabel.text = @"热门搜索";
    hotlabel.font = [UIFont systemFontOfSize:10];
    hotlabel.textColor = Label_Color;
    [self.view addSubview:hotlabel];
    [hotlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(image.mas_left).offset(15);
        make.bottom.mas_equalTo(image.mas_bottom);
        make.height.mas_equalTo(10);
    }];
    
    UIView *line2= [[UIView alloc]init];
    line2.backgroundColor = LINE_GRAY;
    [self.view addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(hotlabel.mas_bottom).offset(18 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(self.view.mas_left).offset(14);
        make.right.mas_equalTo(self.view.mas_right);
        make.height.mas_equalTo(@1);
    }];
    
    JCTagView *jcView = [[JCTagView alloc]initWithFrame:CGRectMake(0, 280 *SCREEN_HEIGHT/1136 + 64, SCREEN_WIDTH, 0)];
    [self.view addSubview:jcView];
    [jcView setArrayTagWithLabelArray:self.dataSource];
}


-(void)deleteClick
{
    
}

-(void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
