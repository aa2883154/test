//
//  HomeListLabel.m
//  TianYuanData
//
//  Created by 天元数科 on 16/5/24.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "HomeListLabel.h"

@implementation HomeListLabel

+(instancetype)listLabelWithTitle:(NSString *)title
{
    HomeListLabel *label = [[self alloc]init];
    label.text =title;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:17];
    [label sizeToFit];
    label.userInteractionEnabled = YES;
    return label;
}

-(void)setScale:(CGFloat)scale
{
    self.textColor = [UIColor colorWithRed:251/255.0f green:251/255.0f blue:251/255.0f alpha:1];
    
    CGFloat maxScale = 0.2;
    
    //按比例改变大小
    self.transform = CGAffineTransformMakeScale(1+maxScale*scale, 1+maxScale*scale);
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p> %@", self.class, self, self.text];
}

@end
