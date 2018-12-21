//
//  RAMUsage.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/18/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "RAMUsage.h"
#import <mach/mach.h>
#import <assert.h>

float memory_usage(void) {
    struct task_basic_info info;
    mach_msg_type_number_t size = sizeof(info);
    kern_return_t kerr = task_info(mach_task_self(),
                                   TASK_BASIC_INFO,
                                   (task_info_t)&info,
                                   &size);
    if( kerr == KERN_SUCCESS ) {
//        NSLog(@"Memory in use (in bytes): %lu", info.resident_size);
//        NSLog(@"Memory in use (in MB): %f", ((CGFloat)info.resident_size / 1048576));
        return info.resident_size / 1048576;
    } else {
        return -1;
    }
}
@implementation RAMUsage

+ (CGFloat)currentRAMUsage {
    return memory_usage();
}

@end
