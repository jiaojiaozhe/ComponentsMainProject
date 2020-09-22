//
//  Target_ComponentModuleB.m
//  ComponentModuleB
//
//  Created by 兰彪 on 2020/9/20.
//

#import "Target_ComponentModuleB.h"
#import "ComponentModuleBViewController.h"

@implementation Target_ComponentModuleB
- (UIViewController*) Action_ViewController:(NSDictionary* ) params{
    typedef void (^CallbackType)(NSString *);
    CallbackType callBack = params[@"callback"];
    if(callBack){
        callBack(@"success");
    }
    
    ComponentModuleBViewController *componentModuleBViewController = [[ComponentModuleBViewController alloc] init];
    return componentModuleBViewController;
}
@end
