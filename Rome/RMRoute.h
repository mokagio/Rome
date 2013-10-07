//
//  RMRoute.h
//  Rome
//
//  Created by Gio on 07/10/2013.
//  Copyright (c) 2013 mokagio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RMRoute : NSObject

@property (nonatomic, copy, readonly) NSString *path;
@property (nonatomic, strong, readonly) Class viewControllerClass;

- (id)initWithPath:(NSString *)path viewControllerClass:(Class)viewControllerClass;

@end
