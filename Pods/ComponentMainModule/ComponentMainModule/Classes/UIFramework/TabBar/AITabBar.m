//
//  AITabBar.m
//  AiParkToC
//
//  Created by lanbiao on 2018/8/2.
//  Copyright © 2018年 lanbiao. All rights reserved.
//

#import "AITabBar.h"
#import "ComponentMainModule.h"

@interface AITabBar()<AITabBarItemDelegate>
@property (nonatomic,strong) IBOutlet AITabBarItem *tabBarItem1;
@property (nonatomic,strong) IBOutlet AITabBarItem *tabBarItem2;
@property (nonatomic,strong) IBOutlet AITabBarItem *tabBarItem3;
@end

@implementation AITabBar

+ (AITabBar *) createTabBar{
    static AITabBar *tabBar = NULL;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tabBar = (AITabBar *)[ComponentMainModule viewWithXibFileName:NSStringFromClass([self class])];
    });
    
    return tabBar;
}

- (void) awakeFromNib{
    [super awakeFromNib];
    
    NSBundle *bundle = [ComponentMainModule bundle];
    
    [_tabBarItem1 setItemText:@"首页"];
    _tabBarItem1.delegate = self;
    [_tabBarItem1 setItemImage:[UIImage imageNamed:@"home_sel" inBundle:bundle compatibleWithTraitCollection:nil]];
    [_tabBarItem1 setItemTitleColor:[UIColor colorWithRed:255.0 / 255  green:120.0 / 255 blue:36.0 / 255 alpha:1.0]];
    _tabBarItem1.itemTag = AITabBarItemTagOne;
    
    [_tabBarItem2 setItemText:@"订单"];
    _tabBarItem2.delegate = self;
    [_tabBarItem2 setItemImage:[UIImage imageNamed:@"order_nor" inBundle:bundle compatibleWithTraitCollection:nil]];
    [_tabBarItem2 setItemTitleColor:[UIColor colorWithRed:51.0 / 255 green:51.0 / 255 blue:51.0 / 255 alpha:1.0]];
    _tabBarItem2.itemTag = AITabBarItemTagTow;
    
    [_tabBarItem3 setItemText:@"我的"];
    _tabBarItem3.delegate = self;
    [_tabBarItem3 setItemImage:[UIImage imageNamed:@"my_nor" inBundle:bundle compatibleWithTraitCollection:nil]];
    [_tabBarItem3 setItemTitleColor:[UIColor colorWithRed:51.0 / 255 green:51.0 / 255 blue:51.0 / 255 alpha:1.0]];
    _tabBarItem3.itemTag = AITabBarItemTagThree;
}

- (void) addTarget:(id)target action:(SEL)action{
    [_tabBarItem1 addTarget:target action:action];
    [_tabBarItem2 addTarget:target action:action];
    [_tabBarItem3 addTarget:target action:action];
}

#pragma mark --
#pragma mark --AITabBarItemDelegate
- (void) clickItem:(AITabBarItem *) item{
    NSBundle *bundle = [ComponentMainModule bundle];
    
    if(item == _tabBarItem1){
        [_tabBarItem1 setItemImage:[UIImage imageNamed:@"home_sel" inBundle:bundle compatibleWithTraitCollection:nil]];
        [_tabBarItem1 setItemTitleColor:[UIColor colorWithRed:255.0 / 255  green:120.0 / 255 blue:36.0 / 255 alpha:1.0]];
        [_tabBarItem2 setItemImage:[UIImage imageNamed:@"order_nor" inBundle:bundle compatibleWithTraitCollection:nil]];
        [_tabBarItem2 setItemTitleColor:[UIColor colorWithRed:51.0 / 255 green:51.0 / 255 blue:51.0 / 255 alpha:1.0]];
        [_tabBarItem3 setItemImage:[UIImage imageNamed:@"my_nor" inBundle:bundle compatibleWithTraitCollection:nil]];
        [_tabBarItem3 setItemTitleColor:[UIColor colorWithRed:51.0 / 255 green:51.0 / 255 blue:51.0 / 255 alpha:1.0]];
    }else if(item == _tabBarItem2){
        [_tabBarItem1 setItemImage:[UIImage imageNamed:@"home_nor" inBundle:bundle compatibleWithTraitCollection:nil]];
        [_tabBarItem1 setItemTitleColor:[UIColor colorWithRed:51.0 / 255 green:51.0 / 255 blue:51.0 / 255 alpha:1.0]];
        [_tabBarItem2 setItemImage:[UIImage imageNamed:@"order_sel" inBundle:bundle compatibleWithTraitCollection:nil]];
        [_tabBarItem2 setItemTitleColor:[UIColor colorWithRed:255.0 / 255  green:120.0 / 255 blue:36.0 / 255 alpha:1.0]];
        [_tabBarItem3 setItemImage:[UIImage imageNamed:@"my_nor" inBundle:bundle compatibleWithTraitCollection:nil]];
        [_tabBarItem3 setItemTitleColor:[UIColor colorWithRed:51.0 / 255 green:51.0 / 255 blue:51.0 / 255 alpha:1.0]];
    }else if(item == _tabBarItem3){
        [_tabBarItem1 setItemImage:[UIImage imageNamed:@"home_nor" inBundle:bundle compatibleWithTraitCollection:nil]];
        [_tabBarItem1 setItemTitleColor:[UIColor colorWithRed:51.0 / 255 green:51.0 / 255 blue:51.0 / 255 alpha:1.0]];
        [_tabBarItem2 setItemImage:[UIImage imageNamed:@"order_nor" inBundle:bundle compatibleWithTraitCollection:nil]];
        [_tabBarItem2 setItemTitleColor:[UIColor colorWithRed:51.0 / 255 green:51.0 / 255 blue:51.0 / 255 alpha:1.0]];
        [_tabBarItem3 setItemImage:[UIImage imageNamed:@"my_sel" inBundle:bundle compatibleWithTraitCollection:nil]];
        [_tabBarItem3 setItemTitleColor:[UIColor colorWithRed:255.0 / 255  green:120.0 / 255 blue:36.0 / 255 alpha:1.0]];
    }
}

@end
