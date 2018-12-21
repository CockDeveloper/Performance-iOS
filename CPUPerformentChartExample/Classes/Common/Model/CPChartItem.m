//
//  CPChartItem.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/12/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartItem.h"

@implementation CPChartItem

NSString * const kChartIdCPUUsage = @"chartIdCPUUsage";
NSString * const kChartIdRAMUsage = @"chartIdRAMUsage";
NSString * const kChartIdNetworkUsage = @"chartIdNetworkUsage";
NSString * const kChartIdGPUUsage = @"chartIdGPUUsage";

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.chartId = STRING_EMPTY;
        self.chartName = STRING_EMPTY;
    }
    return self;
}

+ (instancetype)chartItemFromInfo:(NSDictionary<NSString *, id> *)info {
    id chartItem = [self new];
    if (chartItem) {
        for (NSString *key in [info allKeys]) {
            id value = info[key];
            if (value && [chartItem respondsToSelector:NSSelectorFromString(key)]) {
                [chartItem setValue:value forKey:key];
            }
        }
    }
    return chartItem;
}

@end
