//
//  RMRouter.m
//  Rome
//
//  Created by Gio on 07/10/2013.
//  Copyright (c) 2013 mokagio. All rights reserved.
//

#import "RMRouter.h"

#import "RMRoute.h"

@interface RMRouter ()
@property (nonatomic, strong) NSArray *routes;
@end

@implementation RMRouter

- (id)init
{
    self = [super init];
    if (self) {
        self.routes = @[];
    }
    return self;
}

#pragma mark - Shared Instance

+ (RMRouter *)sharedRouter {
    static RMRouter *_sharedRouter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedRouter = [[self alloc] init];
    });
    
    return _sharedRouter;
}

#pragma mark - Register route

- (void)registerRouteWithPath:(NSString *)path viewControllerClass:(Class)viewControllerClass
{
    RMRoute *route = [[RMRoute alloc] initWithPath:path viewControllerClass:viewControllerClass];
    NSMutableArray *mutableRoutes = [self.routes mutableCopy];
    [mutableRoutes addObject:route];
    NSLog(@"%d? %d", route == nil, [mutableRoutes count]);
    self.routes = [NSArray arrayWithArray:mutableRoutes];
    NSLog(@"%d", [self.routes count]);
}

@end
