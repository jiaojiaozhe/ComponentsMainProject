//
//  AITabBarItem.h
//  AiParkToC
//
//  Created by lanbiao on 2018/8/2.
//  Copyright © 2018年 lanbiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AITabBarItem;
@protocol AITabBarItemDelegate <NSObject>
@optional
- (void) clickItem:(AITabBarItem *) item;

@end

typedef NS_ENUM(NSInteger, AITabBarItemTag){
    AITabBarItemTagOne,
    AITabBarItemTagTow,
    AITabBarItemTagThree,
};

/**
 自定义的AITabBarItem
 */
@interface AITabBarItem : UIView
@property (nonatomic,assign) AITabBarItemTag itemTag;
@property (nonatomic,weak) id<AITabBarItemDelegate> delegate;


/**
 设置TabBarItem的文字

 @param itemText 待设置的文字
 */
- (void) setItemText:(NSString *) itemText;

/**
 *  设置TabBarItem的icon
 */
- (void) setItemImage:(UIImage *) image;

/**
 *  设置TabBarItem的文字颜色
 */
- (void) setItemTitleColor:(UIColor *) color;

/**
 设置响应事件

 @param target 响应时间的目标
 @param action 响应事件
 */
- (void) addTarget:(id)target action:(SEL)action;
@end
