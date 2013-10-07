//
//  RMRouter.m
//  Rome
//
//  Created by Gio on 07/10/2013.
//  Copyright (c) 2013 mokagio. All rights reserved.
//

#import "RMRouter.h"

@implementation RMRouter

#pragma mark - Shared Instance

+ (RMRouter *)sharedRouter {
    static RMRouter *_sharedRouter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedRouter = [[self alloc] init];
    });
    
    return _sharedRouter;
}

@end
