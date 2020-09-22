//
//  Middleware+ComponentModuleA.h
//  ComponentModuleACategory
//
//  Created by 兰彪 on 2020/9/20.
//

#import <ComponentMiddleware/Middleware.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^ComponentModuleACallBack)(NSString *result);

@interface Middleware (ComponentModuleA)
- (UIViewController *) ComponentModuleA_ViewControllerWithCallBack:(ComponentModuleACallBack) callBack;

@end

NS_ASSUME_NONNULL_END
