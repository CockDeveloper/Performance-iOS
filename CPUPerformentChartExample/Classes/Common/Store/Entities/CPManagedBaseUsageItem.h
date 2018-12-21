//
//  CPManagedBaseUsageItem.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/18/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface CPManagedBaseUsageItem : NSManagedObject

@property (nonatomic) NSNumber *valueUsage;
@property (nonatomic) NSDate *timeUpdate;

+ (NSString *)kEntryFileNameUsage;
+ (NSString *)kEntryNameUsage;

@end

NS_ASSUME_NONNULL_END
