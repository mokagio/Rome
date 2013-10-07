//
//  RMRouterSpec.m
//  Rome
//
//  Created by Gio on 07/10/2013.
//  Copyright (c) 2013 mokagio. All rights reserved.
//

#import <Kiwi.h>
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
    
});

SPEC_END