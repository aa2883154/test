//
//  NewsDetailController.m
//  TianYuanData
//
//  Created by 天元数科 on 16/5/31.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "NewsDetailController.h"
#import "CommentAllController.h"
#import "MBProgressHUD.h"

@interface NewsDetailController () <UITextFieldDelegate,MBProgressHUDDelegate,UITextViewDelegate>

@property(nonatomic)UIView *searchView;

@property(nonatomic)UIImageView *left_fieldView;

@property(nonatomic)UIView *blackView;

@property(nonatomic)UIView *commentView;
//输入评论内容
@property(nonatomic)UIButton *fieldBtn;
//收藏按钮
@property(nonatomic)UIButton *collectBtn;
//关闭评论减号按钮
@property(nonatomic)UIButton *closeTabBtn;
//关闭评论的View
@property(nonatomic)UIView *white;

@property(nonatomic)UIButton *closeBtn;


@end

@implementation NewsDetailController
{
    MBProgressHUD *HUD;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情";
    self.view.backgroundColor = BLUE_Color;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupUI];
}

#pragma mark - 设置底部tabBar和界面
-(void)setupUI
{
    UIButton *sharebtn = [UIButton buttonWithType:UIButtonTypeSystem];
    sharebtn.frame = CGRectMake(0, 0, 21, 5);
    sharebtn.tintColor = Yellow_Color;
    
    [sharebtn setImage:[UIImage imageNamed:@"share-button"] forState:UIControlStateNormal];
    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithCustomView:sharebtn];
    self.navigationItem.rightBarButtonItem = back;
    [sharebtn addTarget:self action:@selector(shareClick) forControlEvents:UIControlEventTouchUpInside];
    _searchView = [[UIView alloc]init];
    _searchView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_searchView];
    [_searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_bottom).offset(-44);
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.height.mas_equalTo(@44);
    }];
    
    _fieldBtn = [[UIButton alloc]init];
    [_searchView addSubview:_fieldBtn];
    _fieldBtn.layer.borderWidth = 0.5;
    _fieldBtn.layer.borderColor = Label_Color.CGColor;
    _fieldBtn.layer.cornerRadius = 16;
    [_fieldBtn setImage:[UIImage imageNamed:@"import-icon"] forState:UIControlStateNormal];
    [_fieldBtn addTarget:self action:@selector(fieldClick) forControlEvents:UIControlEventTouchUpInside];
    [_fieldBtn setImageEdgeInsets:UIEdgeInsetsMake(5, 3, 5, 160)];
    [_fieldBtn setTitle:@"发表评论吧~~" forState:UIControlStateNormal];
    _fieldBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [_fieldBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 60)];
    [_fieldBtn setTitleColor:LINE_GRAY forState:UIControlStateNormal];
    [_fieldBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_searchView.mas_top).offset(17 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(_searchView.mas_left).offset(15);
        make.right.mas_equalTo(_searchView.mas_right).offset(-225 *SCREEN_WIDTH/650);
        make.bottom.mas_equalTo(_searchView.mas_bottom).offset(-17*SCREEN_HEIGHT/1136);
    }];
    
    //评论个数按钮
    UIButton *btn = [[UIButton alloc]init];
    [btn setImage:[UIImage imageNamed:@"all-discuss"] forState:UIControlStateNormal];
    
    //红色评论个数
    UILabel *lblCount = [[UILabel alloc]initWithFrame:CGRectMake(30 *SCREEN_WIDTH/650, 0, 9, 9)];
    lblCount.layer.cornerRadius = 5;
    lblCount.clipsToBounds = YES;
                lblCount.backgroundColor = [UIColor redColor];
                lblCount.textAlignment = NSTextAlignmentCenter;
                lblCount.textColor = [UIColor whiteColor];
                lblCount.text = @"99";
                lblCount.font = [UIFont systemFontOfSize:5];
    [btn addSubview:lblCount];
    [_searchView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_searchView.mas_top).offset(10);
        make.left.mas_equalTo(_fieldBtn.mas_right).offset(20 *SCREEN_WIDTH/650);
        make.width.mas_equalTo(@22);
        make.height.mas_equalTo(@22);
    }];
    
    //收藏按钮
    _collectBtn = [[UIButton alloc]init];
    [_collectBtn setImage:[UIImage imageNamed:@"collect"] forState:UIControlStateNormal];
    _collectBtn.tag = 1;
    [_collectBtn addTarget:self action:@selector(collectClick:) forControlEvents:UIControlEventTouchUpInside];
    [_searchView addSubview:_collectBtn];
    [_collectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_searchView.mas_top).offset(10);
        make.left.mas_equalTo(btn.mas_right).offset(22 *SCREEN_WIDTH/650);
        make.width.mas_equalTo(@22);
        make.height.mas_equalTo(@22);
    }];
    
    //关闭评论按钮
    _closeTabBtn = [[UIButton alloc]init];
    [_closeTabBtn setImage:[UIImage imageNamed:@"close-discuss"] forState:UIControlStateNormal];
    [_closeTabBtn addTarget:self action:@selector(closeClick) forControlEvents:UIControlEventTouchUpInside];
    [_searchView addSubview:_closeTabBtn];
    [_closeTabBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_searchView.mas_top).offset(10);
        make.left.mas_equalTo(_collectBtn.mas_right).offset(22*SCREEN_WIDTH/650);
        make.width.mas_equalTo(@22);
        make.height.mas_equalTo(@22);
    }];
    
    _white = [[UIView alloc]initWithFrame:CGRectMake(-5, SCREEN_HEIGHT, SCREEN_WIDTH+5, 288 *SCREEN_HEIGHT/1136)];
    _white.backgroundColor = [UIColor whiteColor];
    _white.layer.borderWidth = 1.5;
    _white.layer.borderColor = BLUE_Color.CGColor;
    
    _closeBtn = [[UIButton alloc]initWithFrame:CGRectMake(140 *SCREEN_WIDTH/650, 60 *SCREEN_HEIGHT/1136, 360 *SCREEN_WIDTH/650, 84 *SCREEN_HEIGHT/1136)];
    [_white addSubview:_closeBtn];
    _closeBtn.tag = 1;
    _closeBtn.layer.cornerRadius = 5;
    _closeBtn.backgroundColor = [UIColor redColor];
    [_closeBtn setTitle:@"关闭评论" forState:UIControlStateNormal];
    [_closeBtn addTarget:self action:@selector(closeClick:) forControlEvents:UIControlEventTouchUpInside];
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 200 *SCREEN_HEIGHT/1136, SCREEN_WIDTH, 1)];
    line.backgroundColor = LINE_GRAY;
    [_white addSubview:line];
    
    UIButton *cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(290 *SCREEN_WIDTH/650, 232 *SCREEN_HEIGHT/1136, 45, 25)];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancelBtn.backgroundColor = [UIColor whiteColor];
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancelWhiteView) forControlEvents:UIControlEventTouchUpInside];
    [_white addSubview:cancelBtn];
    [self.view addSubview:_white];
}
#pragma mark - 分享功能
-(void)shareClick
{
    NSLog(@"点击了分享按钮");
    
    
}

#pragma mark -取消按钮
-(void)cancelWhiteView
{
    [UIView animateWithDuration:0.2f animations:^{
        _white.frame = CGRectMake(-5, SCREEN_HEIGHT, SCREEN_WIDTH+5, 288 *SCREEN_HEIGHT/1136);
    }];
}

#pragma mark - 红色关闭评论要做的事
-(void)closeClick:(UIButton *)btn
{
    if(btn.tag == 1)
    {
        [UIView animateWithDuration:0.2f animations:^{
            _white.frame = CGRectMake(-5, SCREEN_HEIGHT, SCREEN_WIDTH+5, 288 *SCREEN_HEIGHT/1136);
        }];
        [_closeTabBtn setImage:[UIImage imageNamed:@"open-discuss"] forState:UIControlStateNormal];
        [_closeBtn setTitle:@"打开评论" forState:UIControlStateNormal];
    }else  {
        [UIView animateWithDuration:0.2f animations:^{
            _white.frame = CGRectMake(-5, SCREEN_HEIGHT, SCREEN_WIDTH+5, 288 *SCREEN_HEIGHT/1136);
        }];
        [_closeTabBtn setImage:[UIImage imageNamed:@"close-discuss"] forState:UIControlStateNormal];
        [_closeBtn setTitle:@"关闭评论" forState:UIControlStateNormal];
    }
    btn.tag++;
    btn.tag = (btn.tag +2)%2;
}

#pragma mark- 收藏事件
-(void)collectClick:(UIButton *)btn
{
    
//本地存储。。。 FMDB  insert 插入
    
    if (btn.tag==1) {
        [_collectBtn setImage:[UIImage imageNamed:@"collect-success"] forState:UIControlStateNormal];
//
        [self showHUDWithText:@"收藏成功"];
    }else{
        [_collectBtn setImage:[UIImage imageNamed:@"collect"] forState:UIControlStateNormal];
//
        [self showHUDWithText:@"取消收藏"];
    }
    
         btn.tag = (btn.tag +1)%2;
}

#pragma mark-关闭评论按钮的事件
-(void)closeClick
{
       [UIView animateWithDuration:0.3f animations:^{
           _white.frame = CGRectMake(-5, SCREEN_HEIGHT-288 *SCREEN_HEIGHT/1136, SCREEN_WIDTH+5, 288 *SCREEN_HEIGHT/1136+2)                         ;
       }];
}

#pragma mark- 显示黑色提示
- (void)showHUDWithText:(NSString *)text
{
    if (HUD) {
        [HUD removeFromSuperview];
        HUD = nil;
    }
    if (self.navigationController!=nil) {
        HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
        [self.navigationController.view addSubview:HUD];
        [self.navigationController.view bringSubviewToFront:HUD];
        
    } else {
        HUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:HUD];
        [self.view bringSubviewToFront:HUD];
    }
    HUD.delegate = self;
    HUD.mode = MBProgressHUDModeText;
    HUD.labelText = text;
    [HUD show:YES];
    [self performSelector:@selector(hideHUD) withObject:nil afterDelay:1.0f];
}

- (void)hideHUD
{
    [HUD hide:YES];
}

#pragma mark- fieldBtn的点击事件
-(void)fieldClick
{
    _blackView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _blackView.backgroundColor = LINE_GRAY;
    _blackView.alpha = 0.2;
    [self.view addSubview:_blackView];
    
    _commentView=[[UIView alloc]initWithFrame:CGRectMake(0,358*SCREEN_HEIGHT/1136, SCREEN_WIDTH, 340 *SCREEN_HEIGHT/1136)];
    _commentView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_commentView];
    
    UIButton *cancelbtn = [[UIButton alloc]init];
    [cancelbtn setTitle:@"取消" forState:UIControlStateNormal];
     cancelbtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [cancelbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelbtn addTarget:self action:@selector(didclickcancel) forControlEvents:UIControlEventTouchUpInside];
    [_commentView addSubview:cancelbtn];
    [cancelbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_commentView.mas_top).offset(5);
        make.left.mas_equalTo(_commentView.mas_left).offset(14);
    }];
    
    UIButton *surebtn = [[UIButton alloc]init];
    [surebtn setTitle:@"发表" forState:UIControlStateNormal];
    surebtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [surebtn setTitleColor:Label_Color forState:UIControlStateNormal];
    [surebtn addTarget:self action:@selector(didSureBtn) forControlEvents:UIControlEventTouchUpInside];
    [_commentView addSubview:surebtn];
    [surebtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_commentView.mas_top).offset(5);
        make.right.mas_equalTo(_commentView.mas_right).offset(-14);
    }];
    
    UITextView *text = [[UITextView alloc]initWithFrame:CGRectMake(14, 80 *SCREEN_HEIGHT/1136, SCREEN_WIDTH - 28, 224 *SCREEN_HEIGHT/1136)];
    text.layer.borderWidth = 1;
    text.layer.borderColor = BLUE_Color.CGColor;
    text.layer.cornerRadius = 10;
    text.clipsToBounds = YES;
    text.delegate = self;
    [text becomeFirstResponder];
    text.backgroundColor = [UIColor whiteColor];
    [_commentView addSubview:text];
}

//点击取消按钮
-(void)didclickcancel
{
    [self.view endEditing:YES];
    [_blackView removeFromSuperview];
    _blackView.alpha = 0;
    [_commentView removeFromSuperview];
}

//点击发表按钮
-(void)didSureBtn
{
    [self.view endEditing:YES];
    [_blackView removeFromSuperview];
    _blackView.alpha = 0;
    [_commentView removeFromSuperview];
    CommentAllController *comment = [[CommentAllController alloc]init];
    comment.hidesBottomBarWhenPushed = NO;
    [self.navigationController pushViewController:comment animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
