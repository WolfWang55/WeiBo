//
//  DropControl.h
//  Weibo
//
//  Created by LG on 15/12/30.
//  Copyright (c) 2015年 LG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropControl : UIControl

/**
 *  @param frame 内部显示出来选项的位置
 *  @param view  DropView加载的父视图
 */
-(instancetype)initWithInsideViewFrame:(CGRect)frame inView:(UIView*)view;

-(void)show;

-(void)dismiss;

@end
