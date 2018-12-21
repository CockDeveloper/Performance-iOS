//
//  CPChartRAMUsageCoreDataStore.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/18/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartRAMUsageCoreDataStore.h"
#import "CPManagedRAMUsageItem.h"

@implementation CPChartRAMUsageCoreDataStore

+ (NSString *)dataStoreName {
    return [CPManagedRAMUsageItem kEntryFileNameUsage];
}

+ (NSString *)entryUsageName {
    return [CPManagedRAMUsageItem kEntryNameUsage];
}

@end
