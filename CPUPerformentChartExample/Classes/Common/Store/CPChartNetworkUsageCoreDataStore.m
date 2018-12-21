//
//  CPChartNetworkUsageCoreDataStore.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/18/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartNetworkUsageCoreDataStore.h"
#import "CPManagedNetworkUsageItem.h"

@implementation CPChartNetworkUsageCoreDataStore

+ (NSString *)dataStoreName {
    return [CPManagedNetworkUsageItem kEntryFileNameUsage];
}

+ (NSString *)entryUsageName {
    return [CPManagedNetworkUsageItem kEntryNameUsage];
}

@end
