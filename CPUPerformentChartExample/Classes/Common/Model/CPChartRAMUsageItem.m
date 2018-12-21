//
//  CPChartRAMUsageItem.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/17/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartRAMUsageItem.h"

@implementation CPChartRAMUsageItem

+ (instancetype)ramUsage:(CGFloat)ramUsage atTime:(NSDate *)time {
    id chartRAMUsage = [self new];
    if (chartRAMUsage) {
        [chartRAMUsage setValueRAMUsage:ramUsage];
        [chartRAMUsage setTimeRAMReceive:time];
    }
    return chartRAMUsage;
}

@end
