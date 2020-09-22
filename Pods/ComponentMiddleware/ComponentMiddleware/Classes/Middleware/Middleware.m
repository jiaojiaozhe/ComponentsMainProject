//
//  Middleware.m
//  ComponentMiddleware
//
//  Created by 兰彪 on 2020/9/19.
//

#import "Middleware.h"
#import <objc/runtime.h>

NSString* const kCTMediatorParamsKeySwiftTargetModuleName = @"kCTMediatorParamsKeySwiftTargetModuleName";

@interface Middleware ()
@property (nonatomic, strong) NSMutableDictionary *cachedTarget;
@end

@implementation Middleware

#pragma mark --public methods
+ (instancetype) shareInstance{
    static Middleware *middleware;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        middleware = [[Middleware alloc] init];
    });
    return middleware;
}

- (id) performActionWithUrl:(NSURL *)url completion:(COMPLETION)completion{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSString *urlString = [url query];
    for(NSString *param in [urlString componentsSeparatedByString:@"&"]){
        NSArray *elts = [param componentsSeparatedByString:@"="];
        if(elts.count < 2)
            continue;
        [params setObject:[elts lastObject] forKey:[elts firstObject]];
    }
    
    NSString *actionName = [url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
    if([actionName hasPrefix:@"native"]){
        return @(NO);
    }
    
    id result = [self performTarget:url.host action:actionName params:params shouldCacheTarget:NO];
    if(completion){
        if(result){
            completion(@{@"result":result});
        }else{
            completion(@{});
        }
    }
    return result;
}

- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params shouldCacheTarget:(BOOL)shouldCacheTarget{
    NSString *moduleName = params[kCTMediatorParamsKeySwiftTargetModuleName];
    
    NSString *targetClassString = nil;
    if(moduleName.length > 0){
        targetClassString = [NSString stringWithFormat:@"%@.Target_%@",moduleName,targetName];
    }else{
        targetClassString = [NSString stringWithFormat:@"Target_%@",targetName];
    }
    
    NSObject *target = self.cachedTarget[targetClassString];
    if(target == nil){
        Class targetClass = NSClassFromString(targetClassString);
        target = [[targetClass alloc] init];
    }
    
    NSString *actionString = [NSString stringWithFormat:@"Action_%@:",actionName];
    SEL action = NSSelectorFromString(actionString);
    
    if(target == nil){
        [self NoTargetActionResponseWithTargetString:targetClassString selectorString:actionString originParams:params];
        return NULL;
    }
    
    if(shouldCacheTarget){
        self.cachedTarget[targetClassString] = target;
    }
    
    if([target respondsToSelector:action]){
        return [self safePerformAction:action target:target params:params];
    }else{
        SEL errorAction = NSSelectorFromString(@"notFound:");
        if([target respondsToSelector:errorAction]){
            return [self safePerformAction:errorAction target:target params:params];
        }else{
            [self NoTargetActionResponseWithTargetString:targetClassString selectorString:actionString originParams:params];
            [self.cachedTarget removeObjectForKey:targetClassString];
        }
    }
    
    return NULL;
}

- (void)cleanCachedTargetWithTargetName:(NSString *)targetName{
    NSString *targetClassName = [NSString stringWithFormat:@"Target_%@",targetName];
    [self.cachedTarget removeObjectForKey:targetClassName];
}

#pragma mark --Private Methods
- (void)NoTargetActionResponseWithTargetString:(NSString *)targetString selectorString:(NSString *)selectorString originParams:(NSDictionary *)originParams
{
    SEL action = NSSelectorFromString(@"Action_response:");
    NSObject *target = [[NSClassFromString(@"Target_NoTargetAction") alloc] init];
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    params[@"originParams"] = originParams;
    params[@"targetString"] = targetString;
    params[@"selectorString"] = selectorString;
    
    [self safePerformAction:action target:target params:params];
}

- (id)safePerformAction:(SEL)action target:(NSObject *)target params:(NSDictionary *)params
{
    NSMethodSignature* methodSig = [target methodSignatureForSelector:action];
    if(methodSig == nil) {
        return nil;
    }
    const char* retType = [methodSig methodReturnType];

    if (strcmp(retType, @encode(void)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setArgument:&params atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        return nil;
    }

    if (strcmp(retType, @encode(NSInteger)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setArgument:&params atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        NSInteger result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }

    if (strcmp(retType, @encode(BOOL)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setArgument:&params atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        BOOL result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }

    if (strcmp(retType, @encode(CGFloat)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setArgument:&params atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        CGFloat result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }

    if (strcmp(retType, @encode(NSUInteger)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setArgument:&params atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        NSUInteger result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    return [target performSelector:action withObject:params];
#pragma clang diagnostic pop
}

#pragma mark - getters and setters
- (NSMutableDictionary *)cachedTarget
{
    if (_cachedTarget == nil) {
        _cachedTarget = [[NSMutableDictionary alloc] init];
    }
    return _cachedTarget;
}
@end
