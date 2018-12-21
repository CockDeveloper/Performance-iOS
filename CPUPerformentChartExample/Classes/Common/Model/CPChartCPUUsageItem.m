//
//  CPChartCPUUsageItem.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartCPUUsageItem.h"

@implementation CPChartCPUUsageItem

+ (instancetype)cpuUsage:(CGFloat)cpuUsage atTime:(NSDate *)time {
    id chartCPUUsage = [self new];
    if (chartCPUUsage) {
        [chartCPUUsage setValueCPUUsage:cpuUsage];
        [chartCPUUsage setTimeCPUReceive:time];
    }
    return chartCPUUsage;
}

@end
