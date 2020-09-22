//
//  Middleware.h
//  ComponentMiddleware
//
//  Created by 兰彪 on 2020/9/19.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^COMPLETION)(NSDictionary *info);

extern NSString* const kCTMediatorParamsKeySwiftTargetModuleName;

@interface Middleware : NSObject

+(instancetype) shareInstance;

//远程调用
- (id) performActionWithUrl:(NSURL *) url completion:(COMPLETION) completion;

//本地组件调用
- (id) performTarget:(NSString *) targetName action:(NSString *) actionName params:(NSDictionary *) params shouldCacheTarget:(BOOL) shouldCacheTarget;

//释放注册的映射关系
- (void) cleanCachedTargetWithTargetName:(NSString *) targetName;
@end

NS_ASSUME_NONNULL_END
