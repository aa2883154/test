//
//  PersonalUnPhoneViewController.m
//  TianYuanData
//
//  Created by 天元数科 on 16/5/26.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "PersonalUnPhoneViewController.h"

@interface PersonalUnPhoneViewController ()<UITextFieldDelegate>
{
    NSInteger _count;
}
//手机号 leftview
@property(nonatomic)UIImageView *left_UserView;
//验证码 leftView
@property(nonatomic)UIImageView *left_passView;
//短信验证按钮
@property(nonatomic)UIButton *mobbtn;
//手机号 textfield
@property(nonatomic)UITextField *namefield;
//验证码textfield
@property(nonatomic)UITextField *password;
@end

@implementation PersonalUnPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = Gray_Color;
//    self.automaticallyAdjustsScrollViewInsets = NO;
   self.title = @"手机号解绑";
    [self setupUI];
}
-(void)setupUI
{
    
        UIView *white = [[UIView alloc]initWithFrame:CGRectMake(50 *SCREEN_WIDTH/650, 120 *SCREEN_HEIGHT/1136+64, SCREEN_WIDTH - 50, 525 *SCREEN_HEIGHT/1136)];
        white.backgroundColor = [UIColor whiteColor];
        white.layer.borderWidth = 1;
        white.layer.borderColor = Yellow_Color.CGColor;
        [self.view addSubview:white];
        
        UIImageView *iconimage = [[UIImageView alloc]initWithFrame:CGRectMake(280 *SCREEN_WIDTH/650, 180 *SCREEN_HEIGHT/1136,54,54)];
       [iconimage setImage:[UIImage imageNamed:@"modified-data-img"]];
       iconimage.layer.cornerRadius = 25;
        iconimage.clipsToBounds = YES;
        [self.view addSubview:iconimage];
        
        _namefield = [[UITextField alloc]initWithFrame:CGRectMake(30 *SCREEN_WIDTH/650, 75 *SCREEN_HEIGHT/1136, white.frame.size.width - 30, 28)];
        _namefield.placeholder = @"请输入手机号";
   
        self.left_UserView= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"phone"]];
        _namefield.delegate = self;
        _namefield.tag = 88;
     _namefield.font = [UIFont systemFontOfSize:8];
        _namefield.leftViewMode = UITextFieldViewModeAlways;
        self.left_UserView.frame = CGRectMake(0, 0, 14, 20);
        [_namefield addSubview:self.left_UserView];
        _namefield.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 20)];
        [white addSubview:_namefield];
    
    
    
    _password = [[UITextField alloc]initWithFrame:CGRectMake(30 *SCREEN_WIDTH/650, 138 *SCREEN_HEIGHT/1136, white.frame.size.width - 30, 28)];
        _password.placeholder = @"请输入验证码";
    _password.font = [UIFont systemFontOfSize:8];
        
        _password.delegate = self;
        _password.tag = 888;
        self.left_passView= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"message2"]];
        _password.leftViewMode = UITextFieldViewModeAlways;
        self.left_passView.frame = CGRectMake(0, 5, 18, 15);
        [_password addSubview:self.left_passView];
        _password.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 20)];
        [white addSubview:_password];
    
    
    
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = LINE_GRAY;
        [self.view addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_namefield.mas_bottom);
            make.left.mas_equalTo(_namefield.mas_left);
            make.right.mas_equalTo(_namefield.mas_right);
            make.height.mas_offset(0.5);
        }];
        
        UIView *line1 = [[UIView alloc]init];
        line1.backgroundColor = LINE_GRAY;
        [self.view addSubview:line1];
        [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_password.mas_bottom);
            make.left.mas_equalTo(_password.mas_left);
            make.right.mas_equalTo(_password.mas_right);
            make.height.mas_offset(0.5);
        }];
        
        _mobbtn = [[UIButton alloc]init];
//        _mobbtn.backgroundColor = [UIColor colorWithRed:106/255.0f green:194/255.0f blue:184/255.0f alpha:1];
    _mobbtn.backgroundColor = [UIColor colorWithRed:234/255.0f green:106/255.0f blue:114/255.0f alpha:1];
        _mobbtn.layer.cornerRadius = 8;
        _mobbtn.titleLabel.font = [UIFont systemFontOfSize:7];
        _mobbtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_mobbtn setTitle:@"获取短信验证码" forState:UIControlStateNormal];
        _mobbtn.tintColor = (__bridge UIColor * _Nullable)([UIColor whiteColor].CGColor);
        
        [_mobbtn addTarget:self action:@selector(getphonecode) forControlEvents:UIControlEventTouchUpInside];
        [white addSubview:_mobbtn];
        [_mobbtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(white.mas_top).offset(135 *SCREEN_HEIGHT/1136);
            make.right.mas_equalTo(white.mas_right).offset(-15);
            make.width.mas_offset(140 *SCREEN_WIDTH/650);
            make.height.mas_equalTo(@23);
        }];
        
        UIButton *logbtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 395 *SCREEN_HEIGHT/1136, white.frame.size.width - 30, 44)];
        logbtn.backgroundColor = Yellow_Color;
        [logbtn setTitle:@"提交" forState:UIControlStateNormal];
        [logbtn addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
        [logbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        logbtn.layer.cornerRadius = 20;
        [white addSubview:logbtn];
}

-(void)didClick:(UIButton *)btn
{
    NSLog(@"点击了提交按钮");
}
    
    -(void)textFieldDidBeginEditing:(UITextField *)textField
    {
        if (textField.tag == 88) {
            self.left_UserView.backgroundColor = [UIColor redColor];
        }else if (textField.tag == 888)
        {
            
            self.left_passView.backgroundColor = [UIColor redColor];
        }
    }
    
    -(void)textFieldDidEndEditing:(UITextField *)textField
    {
        self.left_UserView.backgroundColor = [UIColor whiteColor];
        self.left_passView.backgroundColor = [UIColor whiteColor];
    }
    
#pragma mark - 获取短信验证码
    -(void)getphonecode
    {
        NSString *msg;
        if ([self.namefield.text isEqualToString:@""]|| (self.namefield.text == NULL)) {
            msg = @"手机号码为空";
        }
        
        //    if(self.namefield.text.length > 0)
        //    {
        //        self.left_UserView.backgroundColor = [UIColor redColor];
        //    }
        if (msg.length !=0) {
            UIAlertView  *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil,nil];
            [alert show];
            return;
        }
        //倒计时 60秒
        [self changephonecode];
        //    UITextField *text = [self.view viewWithTag:1000];
        //    NSString *url = [NSURL URLWithString:@""];
        //
        //    [[TYNetworkTool sharedTools]POST:url parameters:@{@"":@""} progress:nil success:^(NSURLSessionDataTask * _Nonnull task,  NSDictionary *responseObject) {
        
        //        NSArray *array = responseObject[responseObject.keyEnumerator.nextObject];
        //        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        //        for (NSDictionary *dic in array) {
        //            [arrayM addObject:dic];
        //        }
        //        NSLog(@"arrayM");
        //    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //        NSLog(@"error");
        //    }];
        //
    }
    
    -(void)changephonecode
    {
        _mobbtn.userInteractionEnabled = NO;
        _mobbtn.backgroundColor = [UIColor blackColor];
        _count = 10;
        [_mobbtn setTitle:@"10秒后重新获取" forState:UIControlStateNormal];
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    }
    -(void)timerFired:(NSTimer *)timer
    {
        if (_count !=1) {
            _count -=1;
            [_mobbtn setTitle:[NSString stringWithFormat:@"%ld秒后重新获取",_count] forState:UIControlStateNormal];
        }
        else
        {
            [timer invalidate];
            _mobbtn.userInteractionEnabled = YES;
            _mobbtn.backgroundColor = [UIColor redColor];
            [_mobbtn setTitle:@"获取短信验证码" forState:UIControlStateNormal];
        }
    }
    -(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
    {
        [self.view endEditing:YES];
    }



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
