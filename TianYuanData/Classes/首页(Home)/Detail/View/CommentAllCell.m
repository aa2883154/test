//
//  CommentAllCell.m
//  TianYuanData
//
//  Created by 天元数科 on 16/6/2.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "CommentAllCell.h"
#import "HomePageViewController.h"

@interface CommentAllCell()
//@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

//遮罩的view
@property(nonatomic)UIView *blackView;
//提示框
@property(nonatomic)UIView *remindView;
//头像
@property(nonatomic)UIImageView *icon;


@end
@implementation CommentAllCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self==[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self cell];
    }
    return self;
}
-(void)cell
{
    _icon = [[UIImageView alloc]init];
    [_icon setImage:[UIImage imageNamed:@"message-head-portrait"]];
    _icon.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didIconImage)];
    [_icon addGestureRecognizer:tap];
    [self.contentView addSubview:_icon];
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(16 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(self.contentView.mas_left).offset(30 *SCREEN_WIDTH/650);
        make.height.mas_offset(34);
        make.width.mas_offset(33);
    }];
    
    UILabel *name = [UILabel new];
    name.text = @"张无忌";
    name.font = [UIFont systemFontOfSize:9];
    name.textColor = Yellow_Color;
    [self.contentView addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(18 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(_icon.mas_right).offset(5 *SCREEN_WIDTH/650);
    }];
    
    UILabel *time = [UILabel new];
    time.text = @"2015-05-18 19:22";
    time.font = [UIFont systemFontOfSize:6];
    time.textColor = LINE_GRAY;
    [self.contentView addSubview:time];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(name.mas_bottom).offset(14 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(_icon.mas_right).offset(5 *SCREEN_WIDTH/650);
    }];
    
    UIButton *supportBtn = [UIButton new];
     [supportBtn setImage:[UIImage imageNamed:@"praise"] forState:UIControlStateNormal];
    [supportBtn setTitle:@"280" forState:UIControlStateNormal];
    supportBtn.titleLabel.font = [UIFont systemFontOfSize:7];
    [supportBtn setTitleColor:LINE_GRAY forState:UIControlStateNormal];
    [supportBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 50 *SCREEN_WIDTH/650)];
    [supportBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -15, 0, 0)];
    [self.contentView addSubview:supportBtn];
    [supportBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(18 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(name.mas_right).offset(222 *SCREEN_WIDTH/650);
        make.height.mas_offset(20 *SCREEN_HEIGHT/1136);
    }];
    
    UIButton *opposeBtn = [UIButton new];
    [opposeBtn setImage:[UIImage imageNamed:@"oppose"] forState:UIControlStateNormal];
    [opposeBtn setTitle:@"0" forState:UIControlStateNormal];
    opposeBtn.titleLabel.font = [UIFont systemFontOfSize:7];
    [opposeBtn setTitleColor:LINE_GRAY forState:UIControlStateNormal];
    [opposeBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 40 *SCREEN_WIDTH/650)];
    [opposeBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -15, 0, 0)];
    [self.contentView addSubview:opposeBtn];
    [opposeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(18 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(supportBtn.mas_right).offset(20 *SCREEN_WIDTH/650);
        make.height.mas_offset(20 *SCREEN_HEIGHT/1136);
    }];
    
    UIButton *answer = [UIButton new];
    [answer setImage:[UIImage imageNamed:@"reply"] forState:UIControlStateNormal];
    [answer setTitle:@"回复" forState:UIControlStateNormal];
    answer.titleLabel.font = [UIFont systemFontOfSize:7];
    [answer setTitleColor:LINE_GRAY forState:UIControlStateNormal];
    [answer setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 55 *SCREEN_WIDTH/650)];
    [answer setTitleEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
    [self.contentView addSubview:answer];
    [answer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(18 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(opposeBtn.mas_right).offset(20 *SCREEN_WIDTH/650);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-14);
        make.height.mas_offset(20 *SCREEN_HEIGHT/1136);
    }];
    
    UILabel *title = [UILabel new];
    title.text = @"实在使用官方控件的时候都注意一下他都那些属性  他的属性名都写的很容易理解一看就懂了";
    title.numberOfLines = 0;
    title.font = [UIFont systemFontOfSize:9];
    title.textColor =  Label_Color;
    [self.contentView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(time.mas_bottom).offset(16 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(self.contentView.mas_left).offset(90 *SCREEN_WIDTH/650);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-20 *SCREEN_WIDTH/650);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-16 *SCREEN_HEIGHT/1136);
    }];
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
 
}
-(void)didIconImage
{
    _blackView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.window.frame.size.width, self.window.frame.size.height)];
    _blackView.backgroundColor = Label_Color ;
    _blackView.alpha = 0.4;
    [self.window addSubview:_blackView];
    
    _remindView = [[UIView alloc]initWithFrame:CGRectMake(100 *SCREEN_WIDTH/650, 320 *SCREEN_HEIGHT/1136+64, SCREEN_WIDTH - 100 *SCREEN_WIDTH/650 *2, 245 *SCREEN_HEIGHT/1136)];
    _remindView.backgroundColor = [UIColor whiteColor];
    _remindView.alpha = 0.97;
    _remindView.layer.borderColor = BLUE_Color.CGColor;
    _remindView.layer.borderWidth = 1;
    _remindView.layer.cornerRadius = 8;
    _remindView.clipsToBounds = YES;
    [self.window addSubview:_remindView];
    
    UIButton *talckBtn = [[UIButton alloc]initWithFrame:CGRectMake(105 *SCREEN_WIDTH/650, 30 *SCREEN_HEIGHT/1136, 240 *SCREEN_WIDTH/650, 60 *SCREEN_HEIGHT/1136)];
    talckBtn.backgroundColor = Yellow_Color;
    talckBtn.layer.cornerRadius = 5;
    [talckBtn setTitle:@"与他聊天" forState:UIControlStateNormal];
    //提示框的蓝色线
    UIView *line = [UIView new];
    line.backgroundColor = BLUE_Color;
    [_remindView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_remindView.mas_top).offset(122 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(_remindView.mas_left).offset(10 *SCREEN_WIDTH/650);
        make.right.mas_equalTo(_remindView.mas_right).offset(-10 *SCREEN_WIDTH/650);
        make.height.mas_equalTo(1);
    }];
    UILabel *lbl = [UILabel new];
    lbl.backgroundColor = [UIColor whiteColor];
    lbl.text = @"OR";
    lbl.textAlignment = NSTextAlignmentCenter;
    [lbl setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
    lbl.textColor = LINE_GRAY;
    [line addSubview:lbl];
    [lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_remindView.mas_top).offset(105 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(line.mas_left).offset(160 *SCREEN_WIDTH/650);
        make.width.mas_offset(95 *SCREEN_WIDTH/650);
    }];
    
#pragma mark - 传值
    [talckBtn addTarget: self action:@selector(talckClick) forControlEvents:UIControlEventTouchUpInside];
    [_remindView addSubview:talckBtn];
    
    UIButton *homeBtn = [[UIButton alloc]initWithFrame:CGRectMake(105 *SCREEN_WIDTH/650, 150 *SCREEN_HEIGHT/1136, 240 *SCREEN_WIDTH/650, 60 *SCREEN_HEIGHT/1136)];
    homeBtn.backgroundColor = [UIColor colorWithRed:224/255.0f green:101/255.0f blue:106/255.0f alpha:1];
    homeBtn.layer.cornerRadius = 5;
#pragma mark - 传值
    [homeBtn addTarget:self action:@selector(homeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [homeBtn setTitle:@"进入他的主页" forState:UIControlStateNormal];
    [_remindView addSubview:homeBtn];
    
    UITapGestureRecognizer *blackViewtap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancleClick)];
    [_blackView addGestureRecognizer:blackViewtap];
}
-(void)cancleClick
{
    _blackView.alpha = 0;
    _remindView.alpha = 0;
    [_blackView removeFromSuperview];
    [_remindView removeFromSuperview];
}


//===========================
-(void)talckClick
{
    
}

//查看主页
-(void)homeBtnClick
{
    _blackView.alpha = 0;
    _remindView.alpha = 0;
    [_blackView removeFromSuperview];
    [_remindView removeFromSuperview];
    if (self.delegate &&[self.delegate respondsToSelector:@selector(pushToHomePage)]) {
        [self.delegate pushToHomePage];
    }

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
