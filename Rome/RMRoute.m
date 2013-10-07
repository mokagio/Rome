//
//  RMRoute.m
//  Rome
//
//  Created by Gio on 07/10/2013.
//  Copyright (c) 2013 mokagio. All rights reserved.
//

#import "RMRoute.h"

@interface RMRoute ()
@property (nonatomic, copy) NSString *path;
@property (nonatomic, strong) Class viewControllerClass;
@end

@implementation RMRoute

#pragma mark - Designated Initializer

- (id)initWithPath:(NSString *)path viewControllerClass:(Class)viewControllerClass
{
    self = [super init];
    if (self) {
        self.path = path;
        self.viewControllerClass = viewControllerClass;
    }
    return self;
}

@end
