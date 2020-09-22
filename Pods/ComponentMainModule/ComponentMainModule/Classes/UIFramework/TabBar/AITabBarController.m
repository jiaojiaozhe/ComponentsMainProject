//
//  AITabBarController.m
//  AiParkToC
//
//  Created by lanbiao on 2018/8/1.
//  Copyright © 2018年 lanbiao. All rights reserved.
//

#import "AITabBar.h"
#import "AITabBarController.h"
#import "AINavigationController.h"
#import "AIPageControlManager.h"
#import <ComponentModuleACategory/ComponentModuleACategory-umbrella.h>
#import <ComponentModuleBCategory/ComponentModuleBCategory-umbrella.h>
#import <ComponentModuleCCategory/ComponentModuleCCategory-umbrella.h>
#import <LogicBaseComponentModule/LogicBaseComponentModule-umbrella.h>

@interface AITabBarController ()
@property (nonatomic,strong) AITabBar *currentTabBar;
@property (nonatomic,strong) AITabBarItem *currentTabBarItem;
@end

@implementation AITabBarController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
        self.tabBarDelegate = [AIPageControlManager sharePageControlManager];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    CGFloat version = [[[UIDevice currentDevice] systemVersion] floatValue];
//    if(version >= 7.0){
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//        if(@available(iOS 11.0, *)){
//            //self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//        }else{
//            //11.0以后的OS需要设置ScrollView的contentInsetAdjustmentBehavior
//            self.automaticallyAdjustsScrollViewInsets = NO;
//        }
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)tabBarViewControllers{
    NSMutableArray *controllers = [NSMutableArray arrayWithArray:[super tabBarViewControllers]];
    
    AIBaseViewController *homeViewController = (AIBaseViewController*)[[Middleware shareInstance] ComponentModuleA_ViewControllerWithCallBack:^(NSString * _Nonnull result) {
        
    }];
    
    AINavigationController *homeNavigation = [[AINavigationController alloc] initWithRootViewController:homeViewController];
    homeNavigation.currentNavigationDelegate = [AIPageControlManager sharePageControlManager];
    [controllers addObject:homeNavigation];
    
    
    AIBaseViewController *orderListViewController = (AIBaseViewController*)[[Middleware shareInstance] ComponentModuleB_ViewControllerWithCallBack:^(NSString * _Nonnull result) {
        
    }];
    AINavigationController *orderListNavigation = [[AINavigationController alloc] initWithRootViewController:orderListViewController];
    orderListNavigation.currentNavigationDelegate = [AIPageControlManager sharePageControlManager];
    [controllers addObject:orderListNavigation];
    
    AIBaseViewController *myViewController = (AIBaseViewController*)[[Middleware shareInstance] ComponentModuleC_ViewControllerWithCallBack:^(NSString * _Nonnull result) {
        
    }];
    AINavigationController *myNavigation = [[AINavigationController alloc] initWithRootViewController:myViewController];
    myNavigation.currentNavigationDelegate = [AIPageControlManager sharePageControlManager];
    [controllers addObject:myNavigation];
    
    return controllers;
}

- (XTabBar *)tabBarView{
    if(!_currentTabBar){
        AITabBar *tabBar = [AITabBar createTabBar];
        [tabBar addTarget:self action:@selector(clickTabBarItem:)];
        _currentTabBar = tabBar;
    }
    return _currentTabBar;
}

- (CGFloat)tabBarHeight{
    AITabBar *tabBar = (AITabBar*)[self tabBarView];
    return VIEW_HEIGHT(tabBar);
}

- (void) clickTabBarItem:(AITabBarItem *) tabBarItem{
    if(self.currentTabBarItem.itemTag != tabBarItem.itemTag)
        self.currentTabBarItem = tabBarItem;
    [self selectedTabBarItemWithTag:self.currentTabBarItem.itemTag];
}

- (void) selectedTabBarItemWithTag:(AITabBarItemTag) itemTag{
    if(self.selectedIndex == itemTag){
        if([self.tabBarDelegate respondsToSelector:@selector(tabBarControllerReChooie:)]){
            [self.tabBarDelegate tabBarControllerReChooie:self];
        }
    }
    else{
        self.selectedIndex = itemTag;
        if([self.tabBarDelegate respondsToSelector:@selector(tabBarControllerChange:)])
            [self.tabBarDelegate tabBarControllerChange:self];
    }
}
@end
