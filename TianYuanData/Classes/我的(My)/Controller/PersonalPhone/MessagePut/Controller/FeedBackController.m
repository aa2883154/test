//
//  FeedBackController.m
//  TianYuanData
//
//  Created by 天元数科 on 16/5/26.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "FeedBackController.h"


@interface FeedBackController ()

//@property(nonatomic)SHTextView *textView;

@property(nonatomic)UILabel *lbl;

@property(nonatomic)UILabel *lbl2;

@property(nonatomic)UITextView *textView;

@end

@implementation FeedBackController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"意见反馈";

//    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self UI];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
-(void)UI
{
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(30 *SCREEN_WIDTH/650, 30 *SCREEN_HEIGHT/1136+64, SCREEN_WIDTH - 30, 360 *SCREEN_HEIGHT/1136)];
    _textView.font = [UIFont systemFontOfSize:15];
    _textView.layer.borderWidth = 1;
//    _textView.delegate = self;
    _textView.tintColor = LINE_GRAY;
    _textView.layer.borderColor = LINE_GRAY.CGColor;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textViewChange) name:UITextViewTextDidChangeNotification object:self.textView];
    [self.view addSubview:_textView];
    
    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(_textView.width - 30, 290 *SCREEN_HEIGHT/1136, 50, 50)];
    lbl.text = @"/300字";
    lbl.font =[UIFont systemFontOfSize:8];
    lbl.textColor = LINE_GRAY;
    [_textView addSubview:lbl];
    
    _lbl2 = [[UILabel alloc]initWithFrame:CGRectMake(_textView.width - 40, 290 *SCREEN_HEIGHT/1136, 50, 50)];
    [_textView addSubview:_lbl2];
    _lbl2.textColor = LINE_GRAY;
    _lbl2.font = [UIFont systemFontOfSize:8];
    _lbl2.text = @"0";
    
    UILabel *lbl3 = [[UILabel alloc]init];
    lbl3.font = [UIFont systemFontOfSize:11];
    lbl3.text = @"请留下您的联系方式,方便我们与您取得联系";
    lbl3.textColor = Black_Color;
    [self.view addSubview:lbl3];
    [lbl3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_textView.mas_bottom).offset(30 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(self.view.mas_left).offset(50 *SCREEN_WIDTH/650);
    }];
    
    UITextField *field = [[UITextField alloc]init];
    [self.view addSubview:field];
    field.layer.borderWidth = 1;
    field.layer.borderColor = LINE_GRAY.CGColor;
    field.placeholder = @"QQ/手机/邮箱";
    field.textColor = LINE_GRAY;
    field.font = [UIFont systemFontOfSize:10];
    [field mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lbl3.mas_bottom).offset(40 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(self.view.mas_left).offset(30 *SCREEN_WIDTH/650);
        make.right.mas_equalTo(self.view.mas_right).offset(-30 *SCREEN_WIDTH/650);
        make.height.mas_equalTo(@25);
    }];
    
    UIButton *btn = [[UIButton alloc]init];
    btn.backgroundColor = Yellow_Color;
    btn.layer.cornerRadius = 15;
    [btn setTitle:@"提交" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(field.mas_bottom).offset(64 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(self.view.mas_left).offset(110 *SCREEN_WIDTH/650);
        make.right.mas_equalTo(self.view.mas_right).offset(-110 *SCREEN_WIDTH/650);
        make.height.mas_equalTo(@32.5);
    }];
    
    
}

//当文字发生改变的时候 底部的可输入个数跟随变化
-(void)textViewChange
{
    if (self.textView.text.length >300) {
        self.textView.text = [self.textView.text substringWithRange:NSMakeRange(0, 10)];
    }
    self.lbl2.text = [NSString stringWithFormat:@"%ld",(unsigned long)_textView.text.length];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
