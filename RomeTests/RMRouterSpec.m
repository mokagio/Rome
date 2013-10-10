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
    
    it(@"it has a navigationController property", ^{
        RMRouter *router = [[RMRouter alloc] init];
        BOOL hasNavigatioController = [router respondsToSelector:@selector(navigationController)];
        [[theValue(hasNavigatioController) should] beTrue];
    });
    
    it(@"gets instantiated with an empty set of routes", ^{
        RMRouter *router = [[RMRouter alloc] init];
        [[theValue([router.routes count]) should] equal:@0];
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
    
    it(@"returns a route for a given path", ^{
        RMRouter *router = [[RMRouter alloc] init];
        NSString *thePath = @"a/particular/path";
        Class theVCClass = [UIViewController class];
        [router registerRouteWithPath:thePath viewControllerClass:theVCClass];
        
        RMRoute *route = [router routeForPath:thePath];
        
        [[route.path should] equal:thePath];
        [[theValue(route.viewControllerClass) should] equal:theValue(theVCClass)];
    });
    
    it(@"returns nil when asked for an unknown path", ^{
        RMRouter *router = [[RMRouter alloc] init];
        RMRoute *route = [router routeForPath:@"a/path/that/does/not/exist"];
        [[route should] beNil];
    });
    
});

SPEC_END