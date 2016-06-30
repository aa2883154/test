//
//  PersonalPhoneViewController.m
//  TianYuanData
//
//  Created by 天元数科 on 16/5/25.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "PersonalPhoneViewController.h"

@interface PersonalPhoneViewController ()<UITextFieldDelegate>
{
    NSInteger _count;
}
@property(nonatomic)UIImageView *left_UserView;

@property(nonatomic)UIImageView *left_passView;

@property(nonatomic)UIButton *mobbtn;

@property(nonatomic)UITextField *namefield;

@property(nonatomic)UITextField *password;


@end

@implementation PersonalPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"绑定手机";
    self.view.backgroundColor = LINE_GRAY;
    [self ui];
}
-(void)ui
{
    UIView *white = [[UIView alloc]initWithFrame:CGRectMake(30 *SCREEN_WIDTH/750, 300 *SCREEN_HEIGHT/1334, SCREEN_WIDTH - 30, 300)];
    white.backgroundColor = [UIColor whiteColor];
    white.layer.borderWidth = 0.5;
    white.layer.borderColor = [UIColor yellowColor].CGColor;
    [self.view addSubview:white];
    
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, 220 *SCREEN_HEIGHT/1334,80,80)];
    img.backgroundColor = [UIColor brownColor];
    [self.view addSubview:img];
    
    _namefield = [[UITextField alloc]initWithFrame:CGRectMake(30 *SCREEN_WIDTH/750, 80, white.frame.size.width - 30, 90 *SCREEN_HEIGHT/1334)];
    _namefield.placeholder = @"请输入手机号";
    self.left_UserView= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"手机灰色"]];
    _namefield.delegate = self;
    _namefield.tag = 88;
    
    _namefield.leftViewMode = UITextFieldViewModeAlways;
    self.left_UserView.frame = CGRectMake(0, 10, 14, 20);
    [_namefield addSubview:self.left_UserView];
    _namefield.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 20)];
    _namefield.font = [UIFont systemFontOfSize:15];
    [white addSubview:_namefield];
    
    _password = [[UITextField alloc]initWithFrame:CGRectMake(30 *SCREEN_WIDTH/750, 160, white.frame.size.width - 30, 90 *SCREEN_HEIGHT/1334)];
    _password.placeholder = @"请输入验证码";
    _password.font = [UIFont systemFontOfSize:15];
    _password.delegate = self;
    _password.tag = 888;
    
   self.left_passView= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"手机灰色"]];
    
    _password.leftViewMode = UITextFieldViewModeAlways;
    self.left_passView.frame = CGRectMake(0, 10, 14, 20);
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
     _mobbtn.backgroundColor = [UIColor redColor];
     _mobbtn.layer.cornerRadius = 8;
    _mobbtn.titleLabel.font = [UIFont systemFontOfSize:13];
    _mobbtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_mobbtn setTitle:@"获取短信验证码" forState:UIControlStateNormal];
    _mobbtn.tintColor = (__bridge UIColor * _Nullable)([UIColor whiteColor].CGColor);
    
    [_mobbtn addTarget:self action:@selector(getphonecode) forControlEvents:UIControlEventTouchUpInside];
    [_password addSubview:_mobbtn];
    [_mobbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_password.mas_top).offset(5);
        make.right.mas_equalTo(_password.mas_right);
        make.height.mas_equalTo(@35);
    }];
    
    UIButton *logbtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 230, white.frame.size.width - 40, 90 *SCREEN_HEIGHT/1334)];
    logbtn.backgroundColor = [UIColor redColor];
    [logbtn setTitle:@"提交" forState:UIControlStateNormal];
    [logbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    logbtn.titleLabel.font = [UIFont systemFontOfSize:17];
    logbtn.layer.cornerRadius = 20;
    [white addSubview:logbtn];
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
        [_mobbtn setTitle:[NSString stringWithFormat:@"%ld秒后重新获取",(long)_count] forState:UIControlStateNormal];
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
