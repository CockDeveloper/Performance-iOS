//
//  CPManagedNetworkUsageItem.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/18/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPManagedNetworkUsageItem.h"

@implementation CPManagedNetworkUsageItem

NSString * const kEntryNameNetworkUsage = @"NetworkUsage";
NSString * const kEntryFileNameNetworkUsage = @"NetworkHistory";

+ (NSString *)kEntryFileNameUsage {
    return kEntryFileNameNetworkUsage;
}
+ (NSString *)kEntryNameUsage {
    return kEntryNameNetworkUsage;
}

@end
