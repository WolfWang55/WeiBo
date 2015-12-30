//
//  TitleButton.m
//  Weibo
//
//  Created by LG on 15/12/30.
//  Copyright (c) 2015年 LG. All rights reserved.
//

#import "TitleButton.h"

@implementation TitleButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        _titleRatio=0.8;
        self.titleLabel.textAlignment=NSTextAlignmentRight;
        self.imageView.contentMode=UIViewContentModeCenter;
    }
    return self;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imgX=_titleRatio*CGRectGetWidth(contentRect);
    CGFloat imgY=0;
    CGFloat imgW=(1-_titleRatio)*CGRectGetWidth(contentRect);
    CGFloat imgH=CGRectGetHeight(contentRect);
    
    return CGRectMake(imgX, imgY, imgW, imgH);
}


-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX=0;
    CGFloat titleY=0;
    CGFloat titleW=CGRectGetWidth(contentRect)*_titleRatio;
    CGFloat titleH=CGRectGetHeight(contentRect);
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}



@end
