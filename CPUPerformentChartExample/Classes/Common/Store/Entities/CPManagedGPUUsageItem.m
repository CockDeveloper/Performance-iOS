//
//  CPManagedGPUUsageItem.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/18/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPManagedGPUUsageItem.h"

@implementation CPManagedGPUUsageItem

NSString * const kEntryNameGPUUsage = @"GPUUsage";
NSString * const kEntryFileNameGPUUsage = @"GPUHistory";

+ (NSString *)kEntryFileNameUsage {
    return kEntryFileNameGPUUsage;
}
+ (NSString *)kEntryNameUsage {
    return kEntryNameGPUUsage;
}
@end
