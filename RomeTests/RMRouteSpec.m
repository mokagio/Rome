//
//  RMRouteSpec.m
//  Rome
//
//  Created by Gio on 07/10/2013.
//  Copyright (c) 2013 mokagio. All rights reserved.
//

#import <Kiwi.h>
#import "RMRoute.h"

SPEC_BEGIN(RMRouteSpec)

describe(@"RMRoute", ^{
    it(@"has a path property", ^{
        RMRoute *route = [[RMRoute alloc] init];
        BOOL hasProperty = [route respondsToSelector:@selector(path)];
        [[theValue(hasProperty) should] beTrue];
    });
    
    it(@"has a viewController property", ^{
        RMRoute *route = [[RMRoute alloc] init];
        BOOL hasProperty = [route respondsToSelector:@selector(viewControllerClass)];
        [[theValue(hasProperty) should] beTrue];
    });
    
    it(@"can be init with a path and a viewController reference", ^{
        NSString *anyPath = @"a/path/";
        Class anyViewControllerClass = [UIViewController class];
        RMRoute *route = [[RMRoute alloc] initWithPath:anyPath
                                   viewControllerClass:anyViewControllerClass];
        [[route.path should] equal:anyPath];
        [[theValue(route.viewControllerClass) should] equal:theValue(anyViewControllerClass)];
    });
    
    pending_(@"can't be init without a path", ^{
    });
    
    pending_(@"can't be init without a viewController referece", ^{
    });
});

SPEC_END
