//
//  JCTagView.m
//  JCLabel
//
//  Created by QB on 16/4/26.
//  Copyright © 2016年 JC. All rights reserved.
//

#import "JCTagView.h"

#define HORIZONTAL_PADDING 7.0f
#define VERTICAL_PADDING   3.0f
#define LABEL_MARGIN       10.0f
#define BOTTOM_MARGIN      10.0f

///随机颜色
//#define RandomColor  [UIColor colorWithRed:random()%255/255.0 green:random()%255/255.0 blue:random()%255/255.0 alpha:1];

@interface JCTagView ()

{
    CGRect _previousFrame;
    int _totalHeight;
    //    UIButton *_tag;
}
@property(nonatomic,strong) UIButton *btn;

@end

@implementation JCTagView

//初始化方法
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _totalHeight = 0;
        self.frame = frame;
    }
    
    return self;
}


//设置 标签数组
- (void)setArrayTagWithLabelArray:(NSArray *)array {
    //设置frame
    //    _previousFrame = CGRectZero;
    [array enumerateObjectsUsingBlock:^(NSString*str, NSUInteger idx, BOOL *stop) {
        [self setupBtnWithNSString:str];
    }];
    
    self.backgroundColor=[UIColor whiteColor];
    //    设置整个View的背景
    if(_JCbackgroundColor){
        
        self.backgroundColor = _JCbackgroundColor;
        
    }else{
        self.backgroundColor=[UIColor whiteColor];
    }
    
}

//初始化按钮
- (void)setupBtnWithNSString:(NSString *)str {
    //初始化按钮
    _btn = [[UIButton alloc]init];
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn.frame = CGRectZero;
    if (_JCSignalTagColor) {
        _btn.backgroundColor = _JCSignalTagColor;
    }
    else {
        _btn.backgroundColor = [UIColor whiteColor];
    }
    //设置内容水平居中
    _btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_btn setTitle:str forState:UIControlStateNormal];
    //设置字体的大小
    _btn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    _btn.layer.cornerRadius = 5.0;
    _btn.layer.masksToBounds = YES;
    [_btn.layer setBorderColor:LINE_GRAY.CGColor];
    [_btn.layer setBorderWidth:1];
    //设置字体的颜色
    [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //设置方法
    [_btn addTarget:self action:@selector(clickHandle:) forControlEvents:UIControlEventTouchUpInside];
    
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]};
    
    CGSize StrSize = [str sizeWithAttributes:attribute];
    StrSize.width += HORIZONTAL_PADDING * 2;
    StrSize.height += VERTICAL_PADDING *2;
    ///新的 SIZE
    CGRect  NewRect = CGRectZero;
    
    if (_previousFrame.origin.x + _previousFrame.size.width + StrSize.width + LABEL_MARGIN > self.bounds.size.width) {
        
        NewRect.origin = CGPointMake(10, _previousFrame.origin.y + StrSize.height + BOTTOM_MARGIN);
        
        _totalHeight += StrSize.height + BOTTOM_MARGIN;
        
    }else {
        NewRect.origin = CGPointMake(_previousFrame.origin.x + _previousFrame.size.width + LABEL_MARGIN, _previousFrame.origin.y);
    }
    NewRect.size = StrSize;
    [_btn setFrame:NewRect];
    _previousFrame = _btn.frame;
    [self setHight:self andHight:_totalHeight + StrSize.height + BOTTOM_MARGIN];
    [self addSubview:_btn];
    ///设置背景 颜色
}

#pragma mark-改变控件高度
- (void)setHight:(UIView *)view andHight:(CGFloat)hight
{
    CGRect tempFrame = view.frame;
    tempFrame.size.height = hight;
    view.frame = tempFrame;
}


#pragma mark==========按钮的处理方法

///按钮的处理方法
- (void)clickHandle:(UIButton *)sender{
    NSLog(@"点击了，点解了");
}

@end
