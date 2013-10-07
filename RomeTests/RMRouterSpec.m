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
    
});

SPEC_END