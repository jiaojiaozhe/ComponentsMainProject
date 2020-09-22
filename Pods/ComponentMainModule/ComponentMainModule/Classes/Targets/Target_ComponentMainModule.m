//
//  Target_ComponentMainModule.m
//  ComponentMainModule
//
//  Created by 兰彪 on 2020/9/20.
//

#import "Target_ComponentMainModule.h"
#import "ComponentMainViewController.h"

@implementation Target_ComponentMainModule
- (UIViewController*) Action_ViewController:(NSDictionary* ) params{
    typedef void (^CallbackType)(NSString *);
    CallbackType callBack = params[@"callback"];
    if(callBack){
        callBack(@"success");
    }
    
    ComponentMainViewController *componentMainViewController = [[ComponentMainViewController alloc] init];
    return componentMainViewController;
}
@end
