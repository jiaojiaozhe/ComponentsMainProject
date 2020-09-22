//
//  Middleware+ComponentModuleB.m
//  ComponentMiddleware
//
//  Created by 兰彪 on 2020/9/20.
//

#import "Middleware+ComponentModuleB.h"

@implementation Middleware (ComponentModuleB)
- (UIViewController *) ComponentModuleB_ViewControllerWithCallBack:(ComponentModuleBCallBack) callBack{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"callback"] = callBack;
    return [self performTarget:@"ComponentModuleB"
                        action:@"ViewController"
                        params:params
             shouldCacheTarget:NO];
}
@end
