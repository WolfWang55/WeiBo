//
//  RootTabBarController.m
//  Weibo
//
//  Created by LG on 15/12/29.
//  Copyright (c) 2015年 LG. All rights reserved.
//

#import "RootTabBarController.h"
#import "HomeTableViewController.h"
#import "DiscoveryTableViewController.h"
#import "MessageTableViewController.h"
#import "PersonalTableViewController.h"
#import "weiboTabBar.h"
#import <PopMenu.h>

@interface RootTabBarController ()//<WbTabBarDelegate>

@property(nonatomic,strong)weiboTabBar *wbTabBar;
@property (nonatomic, strong) PopMenu *popMenu;//弹出界面

@end

@implementation RootTabBarController

-(PopMenu *)popMenu
{
    if(_popMenu==nil)
    {
        NSMutableArray *items=@[].mutableCopy;
        NSArray *titleArr=@[@"文字",@"相册",@"微博",@"签到",@"点评",@"更多"];
        NSArray *imgArr=@[@"tabbar_compose_idea",@"tabbar_compose_photo",@"tabbar_compose_weibo",@"tabbar_compose_lbs",@"tabbar_compose_review",@"tabbar_compose_more"];
        for(int i=0;i<titleArr.count;i++)
        {
            MenuItem *item=[[MenuItem alloc]initWithTitle:titleArr[i] iconName:imgArr[i]];
            [items addObject:item];
        }
        _popMenu=[[PopMenu alloc]initWithFrame:[UIScreen mainScreen].bounds items:items];
        
        _popMenu.didSelectedItemCompletion=^(MenuItem *item)
        {
            NSLog(@"点击的是%@",item.title);
        };
    }
    return _popMenu;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addCustomTabBar];
    
    //添加viewcontrollers
    [self addViewControllers];
}

-(void)addCustomTabBar
{
    self.tabBar.hidden=YES;
    self.wbTabBar=[[weiboTabBar alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-49, SCREEN_WIDTH, 49)];
    [self.view addSubview:self.wbTabBar];
    //self.wbTabBar.delegate=self;
    __weak typeof (self)weakSelf=self;
    self.wbTabBar.passindex=^void(NSInteger index){
        weakSelf.selectedIndex=index;
    };
    self.wbTabBar.pluBtnClicked=^{
        /**
         *  显示弹出界面
         */
        [weakSelf.popMenu showMenuAtView:weakSelf.view];
    };
    self.wbTabBar.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background"]];
    
}

-(void)addViewControllers
{
    NSArray *vcNameArray=@[@"HomeTableViewController",@"MessageTableViewController",@"DiscoveryTableViewController",@"PersonalTableViewController"];
    
    NSArray *vcTitleArray=@[@"首页",@"消息",@"发现",@"我"];
    
    NSArray *norImageArray=@[@"tabbar_home",@"tabbar_message_center",@"tabbar_discover",@"tabbar_profile"];
    
    NSArray *hlImageArray=@[@"tabbar_home_highlighted",@"tabbar_message_center_highlighted",@"tabbar_discover_highlighted",@"tabbar_profile_highlighted"];
    
    NSArray *seleImageArray=@[@"tabbar_home_selected",@"tabbar_message_center_selected",@"tabbar_discover_selected",@"tabbar_profile_selected"];
    
    for(NSString *vcName in vcNameArray)
    {
        Class vcClass=NSClassFromString(vcName);
        NSInteger index=[vcNameArray indexOfObject:vcName];
        UITableViewController *vc=[[vcClass alloc]init];
        vc.title=vcTitleArray[index];
        [vc.tabBarItem setImage:[[UIImage imageNamed:norImageArray[index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [vc.tabBarItem setSelectedImage:[[UIImage imageNamed:seleImageArray[index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        //修改文字颜色
        NSDictionary *norattribute=@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor lightGrayColor]};
        NSDictionary *seleAttribute=@{NSForegroundColorAttributeName:[UIColor orangeColor]};
        [vc.tabBarItem setTitleTextAttributes:norattribute forState:UIControlStateNormal];
        [vc.tabBarItem setTitleTextAttributes:seleAttribute forState:UIControlStateSelected];
        
        UINavigationController *navc=[[UINavigationController alloc]initWithRootViewController:vc];
        [self addChildViewController:navc];
        
        self.wbTabBar.tabBarItem=vc.tabBarItem;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - WbTabBarDelegate
//-(void)passIndex:(NSInteger)index
//{
//    self.selectedIndex=index;
//}

@end
