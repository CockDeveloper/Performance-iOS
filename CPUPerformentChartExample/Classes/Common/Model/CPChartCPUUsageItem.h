//
//  CPChartCPUUsageItem.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CPChartCPUUsageItem : NSObject

@property (nonatomic) CGFloat valueCPUUsage;
@property (nonatomic) NSDate *timeCPUReceive;

+ (instancetype)cpuUsage:(CGFloat)cpuUsage atTime:(NSDate *)time;

@end

NS_ASSUME_NONNULL_END
