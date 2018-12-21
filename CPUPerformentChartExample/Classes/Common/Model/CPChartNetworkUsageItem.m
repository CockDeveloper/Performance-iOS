//
//  CPChartNetworkUsageItem.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/18/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartNetworkUsageItem.h"

@implementation CPChartNetworkUsageItem

+ (instancetype)networkUsage:(CGFloat)networkUsage atTime:(NSDate *)time {
    id chartNetworkUsage = [self new];
    if (chartNetworkUsage) {
        [chartNetworkUsage setValueNetworkUsage:networkUsage];
        [chartNetworkUsage setTimeNetworkReceive:time];
    }
    return chartNetworkUsage;
}

@end
