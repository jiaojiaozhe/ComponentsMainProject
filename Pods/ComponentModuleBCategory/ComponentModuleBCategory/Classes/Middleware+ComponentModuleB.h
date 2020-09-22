//
//  Middleware+ComponentModuleB.h
//  ComponentMiddleware
//
//  Created by 兰彪 on 2020/9/20.
//

#import <ComponentMiddleware/Middleware.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ComponentModuleBCallBack)(NSString *result);

@interface Middleware (ComponentModuleB)
- (UIViewController *) ComponentModuleB_ViewControllerWithCallBack:(ComponentModuleBCallBack) callBack;

@end

NS_ASSUME_NONNULL_END
