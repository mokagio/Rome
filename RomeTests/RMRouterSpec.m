//
//  RMRouterSpec.m
//  Rome
//
//  Created by Gio on 07/10/2013.
//  Copyright (c) 2013 mokagio. All rights reserved.
//

#import <Kiwi.h>
#import "RMRoute.h"
#import "RMRouter.h"

SPEC_BEGIN(RMRouterSpec)

describe(@"MRRouter", ^{
    
    it(@"has a sharedInstance method", ^{
        BOOL hasMethod = [[RMRouter class] respondsToSelector:@selector(sharedRouter)];
        [[theValue(hasMethod) should] beTrue];
    });
    
    it(@"gets instantiated with an empty set of routes", ^{
        RMRouter *router = [[RMRouter alloc] init];
        [[theValue([router.routes count]) should] equal:@0];
    });
    
    it(@"gets instantiated with a UINavigationController instance", ^{
        RMRouter *router = [[RMRouter alloc] init];
        BOOL hasNavigatioController = [router.navigationController isKindOfClass:[UINavigationController class]];
        [[theValue(hasNavigatioController) should] beTrue];
    });
    
    it(@"register RMRoute objects", ^{
        RMRouter *router = [[RMRouter alloc] init];
        NSUInteger count = [router.routes count];
        Class anyViewControllerClass = [UIViewController class];
        [router registerRouteWithPath:@"any/path" viewControllerClass:anyViewControllerClass];
        NSUInteger newCount = [router.routes count];
        [[theValue(newCount) should] equal:theValue(count + 1)];
    });
    
    it(@"doesn't register a route without a path exists", ^{
        RMRouter *router = [[RMRouter alloc] init];
        NSUInteger count = [router.routes count];
        Class anyViewControllerClass = [UIViewController class];
        [router registerRouteWithPath:nil viewControllerClass:anyViewControllerClass];
        NSUInteger newCount = [router.routes count];
        [[theValue(newCount) should] equal:theValue(count)];
    });
    
    it(@"doesn't register a route without a viewController class", ^{
        RMRouter *router = [[RMRouter alloc] init];
        NSUInteger count = [router.routes count];
        [router registerRouteWithPath:@"any/path" viewControllerClass:nil];
        NSUInteger newCount = [router.routes count];
        [[theValue(newCount) should] equal:theValue(count)];
    });
});

SPEC_END