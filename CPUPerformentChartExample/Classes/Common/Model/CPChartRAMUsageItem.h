//
//  CPChartRAMUsageItem.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/17/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CPChartRAMUsageItem : NSObject

@property (nonatomic) CGFloat valueRAMUsage;
@property (nonatomic) NSDate *timeRAMReceive;

+ (instancetype)ramUsage:(CGFloat)ramUsage atTime:(NSDate *)time;

@end

NS_ASSUME_NONNULL_END
