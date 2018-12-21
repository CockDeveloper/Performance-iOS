//
//  CPManagedRAMUsageItem.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/18/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPManagedRAMUsageItem.h"

@implementation CPManagedRAMUsageItem

NSString * const kEntryNameRAMUsage = @"RAMUsage";
NSString * const kEntryFileNameRAMUsage = @"RAMHistory";

+ (NSString *)kEntryFileNameUsage {
    return kEntryFileNameRAMUsage;
}

+ (NSString *)kEntryNameUsage {
    return kEntryNameRAMUsage;
}

@end
