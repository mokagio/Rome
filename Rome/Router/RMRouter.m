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
    if (path && viewControllerClass) {
        RMRoute *route = [[RMRoute alloc] initWithPath:path viewControllerClass:viewControllerClass];
        NSMutableArray *mutableRoutes = [self.routes mutableCopy];
        [mutableRoutes addObject:route];
        self.routes = [NSArray arrayWithArray:mutableRoutes];
    } else {
        // throw an exception?
    }
}

#pragma mark - Routes loading

// TODO - optimizable
- (RMRoute *)routeForPath:(NSString *)path
{
    __block RMRoute *theRoute = nil;
    NSLog(@"%d", self.routes.count);
    [self.routes enumerateObjectsUsingBlock:^(RMRoute *route, NSUInteger idx, BOOL *stop) {
        if ([route.path isEqualToString:path]) {
            NSLog(@"%@ AAAAA %@", path, route.path);
            theRoute = route;
            *stop = YES;
        }
    }];
    return theRoute;
}

@end
