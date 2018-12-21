//
//  CPChartItem.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/12/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CPChartItem : NSObject

FOUNDATION_EXTERN NSString * const kChartIdCPUUsage;
FOUNDATION_EXTERN NSString * const kChartIdRAMUsage;
FOUNDATION_EXTERN NSString * const kChartIdNetworkUsage;
FOUNDATION_EXTERN NSString * const kChartIdGPUUsage;

@property (nonatomic) NSString *chartName;
@property (nonatomic) NSString *chartId;

+ (instancetype)chartItemFromInfo:(NSDictionary *)info;

@end

NS_ASSUME_NONNULL_END
