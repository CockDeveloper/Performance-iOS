//
//  CPManagedCPUUsageItem.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/14/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPManagedCPUUsageItem.h"

@implementation CPManagedCPUUsageItem

NSString * const kEntryNameCPUUsage = @"CPUUsage";
NSString * const kEntryFileNameCPUUsage = @"CPUHistory";

+ (NSString *)kEntryFileNameUsage {
    return kEntryFileNameCPUUsage;
}

+ (NSString *)kEntryNameUsage {
    return kEntryNameCPUUsage;
}

@end
