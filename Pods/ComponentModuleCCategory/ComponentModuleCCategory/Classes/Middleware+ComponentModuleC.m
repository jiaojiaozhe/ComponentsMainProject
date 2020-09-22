//
//  Middleware+ComponentModuleC.m
//  ComponentModuleCCategory
//
//  Created by 兰彪 on 2020/9/20.
//

#import "Middleware+ComponentModuleC.h"

@implementation Middleware (ComponentModuleC)
- (UIViewController *) ComponentModuleC_ViewControllerWithCallBack:(ComponentModuleCCallBack) callBack{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"callback"] = callBack;
    return [self performTarget:@"ComponentModuleC"
                        action:@"ViewController"
                        params:params
             shouldCacheTarget:NO];
}
@end
