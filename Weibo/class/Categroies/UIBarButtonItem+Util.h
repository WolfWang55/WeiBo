//
//  UIBarButtonItem+Util.h
//  Weibo
//
//  Created by LG on 15/12/30.
//  Copyright (c) 2015年 LG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Util)

/**
 *  通过传入图片名称创建barbuttonitem
 *
 */
+(UIBarButtonItem *)generateBarButtonItemWithNormalImageName:(NSString *)norImageName highlightedImageName:(NSString *)hlImageName;

@end
