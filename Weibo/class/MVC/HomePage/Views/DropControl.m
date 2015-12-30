//
//  DropControl.m
//  Weibo
//
//  Created by LG on 15/12/30.
//  Copyright (c) 2015年 LG. All rights reserved.
//

#import "DropControl.h"

@interface DropControl ()
@property (nonatomic, weak) UIView *sView;

@end

@implementation DropControl

-(instancetype)initWithInsideViewFrame:(CGRect)frame inView:(UIView *)view
{
    self=[super init];
    if(self)
    {
        self.sView=view;
        self.frame=[UIScreen mainScreen].bounds;
        self.backgroundColor=[UIColor redColor];
        [self addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchDown];
    }
    return self;
}

-(void)show
{
    [self.sView addSubview:self];
}

-(void)dismiss
{
    [self removeFromSuperview];
}

@end
