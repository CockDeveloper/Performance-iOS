//
//  CPChartGPUUsageItem.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/18/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartGPUUsageItem.h"

@implementation CPChartGPUUsageItem

+ (instancetype)gpuUsage:(CGFloat)gpuUsage atTime:(NSDate *)time {
    id chartGPUUsage = [self new];
    if (chartGPUUsage) {
        [chartGPUUsage setValueGPUUsage:gpuUsage];
        [chartGPUUsage setTimeGPUReceive:time];
    }
    return chartGPUUsage;
}

@end
