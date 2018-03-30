//
//  NSObject+RootRoute.h
//  BJPlace
//
//  Created by ghk on 2018/3/29.
//  Copyright © 2018年 geng hongkai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (BJRoute)

- (id)routeTargetName:(NSString*)targetName actionName:(NSString*)actionName;
- (id)routeTargetName:(NSString*)targetName actionName:(NSString*)actionName param:(id)param;
- (id)routeTargetName:(NSString*)targetName actionName:(NSString*)actionName blockParam:(void(^)(NSDictionary*))completion;

@end
