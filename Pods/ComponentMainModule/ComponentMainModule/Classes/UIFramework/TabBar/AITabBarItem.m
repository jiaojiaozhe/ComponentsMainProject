//
//  AITabBarItem.m
//  AiParkToC
//
//  Created by lanbiao on 2018/8/2.
//  Copyright © 2018年 lanbiao. All rights reserved.
//

#import "AITabBarItem.h"
#import <XXNibBridge/XXNibBridge.h>
#import "ComponentMainModule.h"

@interface AITabBarItem()<XXNibBridge>
@property (nonatomic,weak) id target;
@property (nonatomic,assign) SEL action;
@property (nonatomic,strong) IBOutlet UILabel *itemLabel;
@property (nonatomic,strong) IBOutlet UIButton *itemClickBtn;
@property (nonatomic,strong) IBOutlet UIImageView *itemIconView;
@end

@implementation AITabBarItem

- (IBAction) tabBarItemClick:(id) sender{
    if([_target respondsToSelector:_action]){
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [_target performSelector:_action withObject:self];
#pragma clang diagnostic pop
        
        if(self.delegate && [self.delegate respondsToSelector:@selector(clickItem:)]){
            [self.delegate clickItem:self];
        }
    }
}

- (void) setItemText:(NSString *) itemText{
    self.itemLabel.text = itemText;
}

- (void) setItemImage:(UIImage *) image{
    self.itemIconView.image = image;
}

- (void) setItemTitleColor:(UIColor *) color{
    self.itemLabel.textColor = color;
}

- (void) addTarget:(id)target action:(SEL)action{
    _target = target;
    _action = action;
}

#pragma mark --XXNIBBridge的重载

+ (UINib *)nib {
    NSBundle *bundle = [ComponentMainModule bundle];
    return [UINib nibWithNibName:self.nibid bundle:bundle];
}

@end
