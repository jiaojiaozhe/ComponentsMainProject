//
//  Target_ComponentModuleA.m
//  ComponentModuleA
//
//  Created by 兰彪 on 2020/9/20.
//

#import "Target_ComponentModuleA.h"
#import "ComponentModuleAViewController.h"

@implementation Target_ComponentModuleA
- (UIViewController*) Action_ViewController:(NSDictionary* ) params{
    typedef void (^CallbackType)(NSString *);
    CallbackType callBack = params[@"callback"];
    if(callBack){
        callBack(@"success");
    }
    
    ComponentModuleAViewController *componentModuleAViewController = [[ComponentModuleAViewController alloc] init];
    return componentModuleAViewController;
}
@end
