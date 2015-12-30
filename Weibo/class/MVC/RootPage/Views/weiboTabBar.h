//
//  weiboTabBar.h
//  Weibo
//
//  Created by LG on 15/12/29.
//  Copyright (c) 2015年 LG. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PassIndex)(NSInteger index);
typedef void(^PlubBtnPressedblock)();

//@protocol WbTabBarDelegate <NSObject>
//
//-(void)passIndex:(NSInteger)index;
//
//@end

@interface weiboTabBar : UIView

/**
 *  用来传递title image信息
 */
@property(nonatomic,strong)UITabBarItem *tabBarItem;

//@property (nonatomic, weak) id <WbTabBarDelegate> delegate;

@property (nonatomic, copy) PassIndex passindex;

/**
 *  中间加号按钮点击回调block
 */
@property (nonatomic, copy) PlubBtnPressedblock pluBtnClicked;

@end
