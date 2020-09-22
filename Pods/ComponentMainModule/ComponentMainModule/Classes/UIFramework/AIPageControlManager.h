//
//  AIPageControlManager.h
//  AiParkToC
//
//  Created by lanbiao on 2018/8/1.
//  Copyright © 2018年 lanbiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AINavigationController.h"

/**
 ToC页面管理器(交互)
 */
@interface AIPageControlManager : NSObject<XNavigationControllerDelegate,XTabBarControllerDelegate>

/**
 单例页面控制管理器

 @return 返回单例
 */
+ (instancetype) sharePageControlManager;

/**
 主根视图控制器

 @return 返回主根视图控制器
 */
- (AINavigationController *) rootMainViewController;

/**
 刷新根视图控制器
 */
- (void) refreshRootMainViewController;

/**
 主视图控制器push入栈加载

 @param viewController 待加载的视图控制器
 @param animated 是否需要动画
 */
- (void) pushViewController:(UIViewController *) viewController animated:(BOOL)animated;

/**
 主视图控制器的出栈

 @param animated 是否需要动画
 @return 出栈的视图控制器
 */
- (UIViewController *) popViewControllerAnimated:(BOOL) animated;

/**
 主视图控制器全部出栈

 @param animated 是否需要动画
 @return 返回出栈的视图控制器集合
 */
- (NSArray *) popToRootViewControllerAnimated:(BOOL) animated;

/**
 主视图控制器出栈到指定视图控制器

 @param controller 出栈的视图控制器
 @param animated 是否需要动画
 @return 返回出栈的视图控制器集合
 */
- (NSArray *) popToViewController:(UIViewController *) controller animated:(BOOL) animated;

/**
 子视图控制器push入栈

 @param viewController 待入栈加载的视图控制器
 @param animated 是否需要动画
 */
- (void) pushViewControllerToTab:(UIViewController *) viewController animated:(BOOL) animated;

/**
 子视图控制器的出栈

 @param animated 是否需要动画
 @return 返回出栈的视图控制器
 */
- (UIViewController *) popViewControllerOnTab:(BOOL) animated;

/**
 子视图控制器出栈到栈顶

 @param animated 是否需要动画
 @return 返回子视图控制器出栈的视图控制器集合
 */
- (NSArray *) popToRootViewControllerOnTab:(BOOL) animated;

/**
 子视图控制器出栈到指定视图控制器

 @param controller 待出栈的视图控制器
 @param animated 是否需要动画
 @return 返回子视图控制器出栈的视图控制器集合
 */
- (NSArray *) popToViewControllerOnTab:(UIViewController *) controller
                              animated:(BOOL) animated;


@end
