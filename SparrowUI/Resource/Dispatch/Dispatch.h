//
//  Dispatch.h
//  SparrowUI
//
//  Created by microsparrow on 16/9/30.
//  Copyright © 2016年 microsparrow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dispatch : NSObject

+ (void)gobal:(void(^)(void))block;

+ (void)asycn:(void(^)(void))block;

@end
