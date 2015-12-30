//
//  weiboTabBar.m
//  Weibo
//
//  Created by LG on 15/12/29.
//  Copyright (c) 2015年 LG. All rights reserved.
//

#import "weiboTabBar.h"
#import "weiboTabBarButton.h"

@interface weiboTabBar()
/**
 *  按钮数组
 */
@property(nonatomic,strong)NSMutableArray *buttonArray;

/**
 *  选中按钮
 */
@property(nonatomic, strong) weiboTabBarButton *selecteBtn;

/**
 *  中间加号按钮
 */
@property (nonatomic, strong) UIButton *plusBtn;

@end

@implementation weiboTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //创建一个按钮 设置一次性的属性
        UIButton *plusBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:plusBtn];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        self.plusBtn=plusBtn;
        [self.plusBtn addTarget:self action:@selector(plusBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(NSMutableArray *)buttonArray
{
    if(_buttonArray==nil)
    {
        _buttonArray=@[].mutableCopy;
    }
    return _buttonArray;
}

-(void)setTabBarItem:(UITabBarItem *)tabBarItem
{
    //获取到标题 图片
    //NSLog(@"tarBarItem.title=%@",tabBarItem.title);
    weiboTabBarButton *wbButton=[weiboTabBarButton buttonWithType:UIButtonTypeCustom];
    wbButton.tabBarItem=tabBarItem;
    [self addSubview:wbButton];
    
    [wbButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchDown];
    
    [self.buttonArray addObject:wbButton];
    
    if(self.buttonArray.count==1)
    {
        [self buttonPressed:wbButton];
    }
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    //布局子视图
    //循环按钮数组 做相应的布局
    CGFloat btnw=CGRectGetWidth(self.frame)/(CGFloat)(self.buttonArray.count+1);
    CGFloat plusW=self.plusBtn.currentBackgroundImage.size.width;
    CGFloat plusH=self.plusBtn.currentBackgroundImage.size.height;
    
    self.plusBtn.frame=CGRectMake(0, 0, plusW, plusH);
    self.plusBtn.center=CGPointMake(CGRectGetWidth(self.frame)*0.5, CGRectGetHeight(self.frame)*0.5);
    
    for (int i=0; i<self.buttonArray.count; i++) {
        weiboTabBarButton *btn=self.buttonArray[i];
        CGFloat bX=btnw*i;
        if(i>1)
        {
            bX+=btnw;
        }
        CGFloat bY=0;
        CGFloat bW=btnw;
        CGFloat bH=CGRectGetHeight(self.frame);
        btn.frame=CGRectMake(bX, bY, bW, bH);
    }
}

-(void)buttonPressed:(weiboTabBarButton *)sender
{
    _selecteBtn.selected=NO;
    sender.selected=YES;
    _selecteBtn=sender;
    
    NSInteger index=[self.buttonArray indexOfObject:sender];
    
//    //响应代理方法
//    if([_delegate respondsToSelector:@selector(passIndex:)])
//    {
//        [_delegate passIndex:index];
//    }
    
    if(_passindex)
    {
        _passindex(index);
    }
}

-(void)plusBtnPressed
{
    if(_pluBtnClicked)
    {
        _pluBtnClicked();
    }
}

@end
