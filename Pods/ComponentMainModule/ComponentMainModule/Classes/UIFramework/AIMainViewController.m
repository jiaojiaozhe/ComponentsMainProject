//
//  AIMainViewController.m
//  AiParkToC
//
//  Created by lanbiao on 2018/8/2.
//  Copyright © 2018年 lanbiao. All rights reserved.
//

#import "AITabBarController.h"
#import "AIMainViewController.h"
//#import "AILoginViewController.h"
//#import "AIAdvertViewController.h"
//#import "AISplashViewController.h"

typedef NS_ENUM(NSInteger, AppRootViewStatus) {
    AppRootViewStatusSplash = 0,
    AppRootViewStatusAdver = 1,
    AppRootViewStatusMain = 2,
};

@interface AIMainViewController ()
@property (nonatomic,assign) AppRootViewStatus appRootViewStatus;
@property (nonatomic,strong) AITabBarController *tabBarController;
@end

@implementation AIMainViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.appRootViewStatus = AppRootViewStatusMain;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

    
- (void)setAppRootViewStatus:(AppRootViewStatus)appRootViewStatus{
    _appRootViewStatus = appRootViewStatus;
    if(_appRootViewStatus == AppRootViewStatusMain){
        self.tabBarController = [[AITabBarController alloc] init];
    }
}

- (void) refreshRootViewController{
    switch (self.appRootViewStatus) {
        case AppRootViewStatusSplash:{
        self.appRootViewStatus = AppRootViewStatusAdver;
        //加载引导页
//            AISplashViewController *splashViewController = [[AISplashViewController alloc] init];
//            [self.navigationController pushViewController:splashViewController animated:NO];
        }
        break;
        case AppRootViewStatusAdver:{
        self.appRootViewStatus = AppRootViewStatusMain;
        //加载广告页
//            AIAdvertViewController *advertViewController = [[AIAdvertViewController alloc] init];
//            [self.navigationController pushViewController:advertViewController animated:NO];
        }
        break;
        case AppRootViewStatusMain:{
            //加载主页面
            [self.navigationController pushViewController:self.tabBarController animated:NO];
        }
        default:{
        }
        break;
    }
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self refreshRootViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
