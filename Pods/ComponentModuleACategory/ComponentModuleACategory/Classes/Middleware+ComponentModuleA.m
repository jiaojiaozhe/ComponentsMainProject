//
//  Middleware+ComponentModuleA.m
//  ComponentModuleACategory
//
//  Created by 兰彪 on 2020/9/20.
//

#import "Middleware+ComponentModuleA.h"

@implementation Middleware (ComponentModuleA)
- (UIViewController *) ComponentModuleA_ViewControllerWithCallBack:(ComponentModuleACallBack) callBack{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"callback"] = callBack;
    return [self performTarget:@"ComponentModuleA"
                        action:@"ViewController"
                        params:params
             shouldCacheTarget:NO];
}
@end
