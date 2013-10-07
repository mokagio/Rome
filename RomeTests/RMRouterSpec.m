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
    
    it(@"gets created with an empty set of routes", ^{
        RMRouter *router = [[RMRouter alloc] init];
        [[theValue([router.routes count]) should] equal:@0];
    });
    
    it(@"register RMRoute objects", ^{
        RMRouter *router = [[RMRouter alloc] init];
        NSUInteger count = [router.routes count];
        [router registerRouteWithPath:@"any/path" viewControllerClass:[UIViewController class]];
        NSUInteger newCount = [router.routes count];
        [[theValue(newCount) should] equal:theValue(count + 1)];
    });
    
    
});

SPEC_END