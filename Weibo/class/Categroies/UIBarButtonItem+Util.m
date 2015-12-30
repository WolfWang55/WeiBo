//
//  UIBarButtonItem+Util.m
//  Weibo
//
//  Created by LG on 15/12/30.
//  Copyright (c) 2015年 LG. All rights reserved.
//

#import "UIBarButtonItem+Util.h"

@implementation UIBarButtonItem (Util)

+(UIBarButtonItem *)generateBarButtonItemWithNormalImageName:(NSString *)norImageName highlightedImageName:(NSString *)hlImageName
{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:norImageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:hlImageName] forState:UIControlStateHighlighted];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:button];
    CGSize buttonsize=button.currentImage.size;
    button.frame=CGRectMake(0, 0, buttonsize.width, buttonsize.height);
    return item;
}

@end
