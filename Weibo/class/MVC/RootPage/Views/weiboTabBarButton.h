//
//  weiboTabBarButton.h
//  Weibo
//
//  Created by LG on 15/12/29.
//  Copyright (c) 2015年 LG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface weiboTabBarButton : UIButton

/**
 *  图片高度占整个按钮高度的比例 0~1 默认为0.6
 */
@property (nonatomic, assign) CGFloat ratio;

/**
 *  <#Description#>
 */
@property (nonatomic, strong) UITabBarItem *tabBarItem;

@end
