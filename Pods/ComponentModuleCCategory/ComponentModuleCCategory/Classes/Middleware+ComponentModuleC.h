//
//  Middleware+ComponentModuleC.h
//  ComponentModuleCCategory
//
//  Created by 兰彪 on 2020/9/20.
//

#import <ComponentMiddleware/Middleware.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^ComponentModuleCCallBack)(NSString *result);

@interface Middleware (ComponentModuleC)
- (UIViewController *) ComponentModuleC_ViewControllerWithCallBack:(ComponentModuleCCallBack) callBack;

@end

NS_ASSUME_NONNULL_END
