//
//  PersonalNameController.m
//  TianYuanData
//
//  Created by 天元数科 on 16/6/6.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "PersonalNameController.h"
#import "MBProgressHUD.h"

@interface PersonalNameController ()<MBProgressHUDDelegate>

@property(nonatomic)UITextField *nametext;

@end

@implementation PersonalNameController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改昵称";
    self.view.backgroundColor = LINE_GRAY;
    [self UI];
}

-(void)UI
{
    _nametext = [[UITextField alloc]initWithFrame:CGRectMake(-2, 64, SCREEN_WIDTH+2, 90 *SCREEN_HEIGHT/1136+1)];
    _nametext.backgroundColor = [UIColor whiteColor];
    _nametext.layer.borderWidth = 1;
    _nametext.text = _name;
    _nametext.clearButtonMode = UITextFieldViewModeAlways;
    _nametext.layer.borderColor = LINE_GRAY
    .CGColor;
    [self.view addSubview:_nametext];
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(saveBtnClick)];
    self.navigationItem.rightBarButtonItem.tintColor = Yellow_Color;
}

//确定按钮
-(void)saveBtnClick
{
    _name = _nametext.text;
    [self.delegate saveChangeData:_nametext.text];
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
    MBProgressHUD *hud = [[MBProgressHUD alloc]initWithView:self.view];
    hud.labelText = @"修改成功";
    [hud show:YES];
    hud.labelFont = [UIFont systemFontOfSize:11];
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"amend-succeed"]];
    hud.customView.size = CGSizeMake(35, 32);
    hud.mode = MBProgressHUDModeCustomView;
    hud.delegate = self;
    hud.color = [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:0.5];
    [hud hide:YES afterDelay:2.0f];
    [self.view addSubview:hud];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
