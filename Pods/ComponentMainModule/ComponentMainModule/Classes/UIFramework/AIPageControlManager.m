//
//  AIPageControlManager.m
//  AiParkToC
//
//  Created by lanbiao on 2018/8/1.
//  Copyright © 2018年 lanbiao. All rights reserved.
//

#import "AIMainViewController.h"
#import "AIPageControlManager.h"

@interface AIPageControlManager()
@property (nonatomic,weak) UIViewController *tabCurrentController;
@property (nonatomic,strong) AINavigationController *rootMainViewController;
@end

@implementation AIPageControlManager

+ (instancetype) sharePageControlManager{
    static AIPageControlManager *pageManager = nil;
#if !__has_feature(objc_arc)
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pageManager = [NSAllocateObject([self class], 0, nil) init];
    });
#else
    pageManager = [[self class] alloc];
#endif
    return pageManager;
}

+ (id) allocWithZone:(struct _NSZone *)zone{
#if !__has_feature(objc_arc)
    return [[self sharePageControlManager] retain];
#else
    static AIPageControlManager *pageManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pageManager = [[super allocWithZone:zone] init];
    });
    return pageManager;
#endif
}

#if !__has_feature(objc_arc)
- (id) retain{
    return self;
}

- (NSUInteger) retainCount{
    return NSUIntegerMax;
}

- (id) autorelease{
    return self;
}

- (oneway void) release{
    
}
#endif

- (id) copyWithZone:(NSZone *)zone{
    return self;
}

- (AINavigationController *) rootMainViewController{
    if(!_rootMainViewController){
        AIMainViewController *mainViewController = [[AIMainViewController alloc] init];
        _rootMainViewController = [[AINavigationController alloc] initWithRootViewController:mainViewController];
        _rootMainViewController.bMainController = YES;
        _rootMainViewController.currentNavigationDelegate = self;
    }
    return _rootMainViewController;
}

- (void) refreshRootMainViewController{
    if(_rootMainViewController){
        [_rootMainViewController popToRootViewControllerAnimated:NO];
    }
}

- (void) pushViewController:(UIViewController *) viewController animated:(BOOL)animated{
    if(!viewController)
        return ;
    __weak typeof(self) weakSelf = self;
    if(self.rootMainViewController.presentedViewController)
        [self.rootMainViewController dismissViewControllerAnimated:NO completion:^{
            [weakSelf.rootMainViewController pushViewController:viewController animated:animated];
        }];
    else
        [self.rootMainViewController pushViewController:viewController animated:animated];
}

- (UIViewController *) popViewControllerAnimated:(BOOL) animated{
    if(self.rootMainViewController.presentedViewController){
        [self.rootMainViewController.presentedViewController dismissViewControllerAnimated:animated
                                                                                completion:nil];
        return nil;
    }else{
        return [self.rootMainViewController popViewControllerAnimated:animated];
    }
}

- (NSArray *) popToRootViewControllerAnimated:(BOOL) animated{
    if(self.rootMainViewController.presentedViewController){
        __weak typeof(self) weakSelf = self;
        [self.rootMainViewController.presentedViewController dismissViewControllerAnimated:NO
                                                                                completion:^{
                                                                                    [weakSelf.rootMainViewController popToRootViewControllerAnimated:animated];
                                                                                }];
        return nil;
    }else{
        return [self.rootMainViewController popToRootViewControllerAnimated:animated];
    }
}

- (NSArray *) popToViewController:(UIViewController *) controller animated:(BOOL) animated{
    if(!controller)
        return nil;
    if(self.rootMainViewController.presentedViewController){
        __weak typeof(self) weakSelf = self;
        [self.rootMainViewController.presentedViewController dismissViewControllerAnimated:NO
                                                                                completion:^{
                                                                                    [weakSelf.rootMainViewController
                                                                                     popToViewController:controller
                                                                                     
                                                                                     animated:animated];
                                                                                }];
        return nil;
    }else{
        return [self.rootMainViewController popToViewController:controller animated:animated];
    }
}

- (void) pushViewControllerToTab:(UIViewController *) viewController animated:(BOOL) animated{
    if(!viewController)
        return ;
    UINavigationController *navigationController = [self.tabCurrentController navigationController];
    if(navigationController.presentedViewController){
        [navigationController dismissViewControllerAnimated:NO completion:^{
            [navigationController pushViewController:viewController animated:animated];
        }];
    }
    else{
        [navigationController pushViewController:viewController animated:animated];
    }
}

- (UIViewController *) popViewControllerOnTab:(BOOL) animated{
    UINavigationController *navigationController = [self.tabCurrentController navigationController];
    if(navigationController.presentedViewController){
        [navigationController.presentedViewController dismissViewControllerAnimated:animated
                                                                         completion:nil];
        return nil;
    }else{
        return [navigationController popViewControllerAnimated:animated];
    }
}

- (NSArray *) popToRootViewControllerOnTab:(BOOL) animated{
    UINavigationController *navigationController = [self.tabCurrentController navigationController];
    if(navigationController.presentedViewController){
        [navigationController.presentedViewController dismissViewControllerAnimated:NO
                                                                         completion:^{
                                                                             [navigationController popToRootViewControllerAnimated:animated];
                                                                         }];
        return nil;
    }else{
        return [navigationController popToRootViewControllerAnimated:animated];
    }
}

- (NSArray *) popToViewControllerOnTab:(UIViewController *) controller
                              animated:(BOOL) animated{
    if(!controller)
        return nil;
    UINavigationController *navigationController = [self.tabCurrentController navigationController];
    if(navigationController.presentedViewController){
        [navigationController.presentedViewController dismissViewControllerAnimated:NO
                                                                         completion:^{
                                                                            [navigationController popToViewController:controller
                                                                                                             animated:animated];
                                                                         }];
        return nil;
    }else{
        return [navigationController popToViewController:controller animated:animated];
    }
}

#pragma mark --
#pragma mark XNavigationControllerDelegate
- (void) navigationControllerChange:(UIViewController *) currentViewController{
    if(currentViewController){
        if([currentViewController isKindOfClass:[XTabBarController class]]){
            XTabBarController *tabBarController = (XTabBarController*)currentViewController;
            UIViewController *viewController = [tabBarController tabBarControllerWithIndex:tabBarController.selectedIndex];
            if(viewController && [viewController isKindOfClass:[UINavigationController class]]){
                UINavigationController *navigationController = (UINavigationController*)viewController;
                self.tabCurrentController = [navigationController topViewController];
            }else{
                self.tabCurrentController = viewController;
            }
        }else{
            
        }
    }
}

#pragma mark --
#pragma mark XTabBarControllerDelegate
- (void) tabBarControllerChange:(XTabBarController *) tabBarController{
    if(tabBarController && [tabBarController isKindOfClass:[XTabBarController class]]){
        UIViewController *viewController = [tabBarController.viewControllers objectAtIndex:tabBarController.selectedIndex];
        if(viewController){
            if([viewController isKindOfClass:[UINavigationController class]]){
                UINavigationController *navigationController = (UINavigationController*)viewController;
                self.tabCurrentController = [navigationController topViewController];
            }else{
                self.tabCurrentController = viewController;
            }
        }
    }
}

- (void) tabBarControllerReChooie:(XTabBarController *) tabBarController{
    //tabBar被重新点击，一般会伴随有对应的事件
}
@end
