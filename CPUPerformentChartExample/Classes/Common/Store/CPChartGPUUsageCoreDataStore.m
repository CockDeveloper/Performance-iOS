//
//  CPChartGPUUsageCoreDataStore.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/18/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartGPUUsageCoreDataStore.h"
#import "CPManagedGPUUsageItem.h"

@implementation CPChartGPUUsageCoreDataStore

+ (NSString *)dataStoreName {
    return [CPManagedGPUUsageItem kEntryFileNameUsage];
}

+ (NSString *)entryUsageName {
    return [CPManagedGPUUsageItem kEntryNameUsage];
}
@end
