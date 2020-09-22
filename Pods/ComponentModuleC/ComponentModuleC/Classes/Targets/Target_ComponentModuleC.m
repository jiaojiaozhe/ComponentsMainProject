//
//  Target_ComponentModuleC.m
//  ComponentModuleC
//
//  Created by 兰彪 on 2020/9/20.
//

#import "Target_ComponentModuleC.h"
#import "ComponentModuleCViewController.h"

@implementation Target_ComponentModuleC
- (UIViewController*) Action_ViewController:(NSDictionary* ) params{
    typedef void (^CallbackType)(NSString *);
    CallbackType callBack = params[@"callback"];
    if(callBack){
        callBack(@"success");
    }
    
    ComponentModuleCViewController *componentModuleCViewController = [[ComponentModuleCViewController alloc] init];
    return componentModuleCViewController;
}
@end
