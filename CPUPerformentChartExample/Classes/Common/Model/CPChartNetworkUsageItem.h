//
//  CPChartNetworkUsageItem.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/18/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CPChartNetworkUsageItem : NSObject

@property (nonatomic) CGFloat valueNetworkUsage;
@property (nonatomic) NSDate *timeNetworkReceive;

+ (instancetype)networkUsage:(CGFloat)networkUsage atTime:(NSDate *)time;

@end

NS_ASSUME_NONNULL_END
