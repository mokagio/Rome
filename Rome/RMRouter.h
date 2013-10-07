//
//  RMRouter.h
//  Rome
//
//  Created by Gio on 07/10/2013.
//  Copyright (c) 2013 mokagio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RMRouter : NSObject

@property (nonatomic, strong, readonly) NSArray *routes;
@property (nonatomic, strong) UINavigationController *navigationController;

+ (RMRouter *)sharedRouter;

- (void)registerRouteWithPath:(NSString *)path viewControllerClass:(Class)viewControllerClass;

@end
