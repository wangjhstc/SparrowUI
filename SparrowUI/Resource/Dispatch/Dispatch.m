//
//  Dispatch.m
//  SparrowUI
//
//  Created by microsparrow on 16/9/30.
//  Copyright © 2016年 microsparrow. All rights reserved.
//

#import "Dispatch.h"

@implementation Dispatch


+ (void)config {
    
}


+ (void)gobal:(void(^)())block {
    static dispatch_queue_t queue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue = dispatch_queue_create("com.microsparrow.gobal", DISPATCH_QUEUE_SERIAL);
        //queue = dispatch_get_global_queue("com.microsparrow.gobal", 0);
        //queue = dispatch_get_global_queue("", 0);
    });
    
    NSLog(@"gobal:%@",[NSThread currentThread]);
    
    dispatch_async(queue, block);
}


+ (void)async:(void(^)())block identifer:(long)identifer {
    
}


+ (void)asycn:(void(^)())block {
    
    static dispatch_queue_t queue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue = dispatch_queue_create("com.microsparrow.asycn", DISPATCH_QUEUE_SERIAL);
    });
    
    NSLog(@"async:%@",[NSThread currentThread]);
    
    dispatch_async(queue, block);
}

@end
