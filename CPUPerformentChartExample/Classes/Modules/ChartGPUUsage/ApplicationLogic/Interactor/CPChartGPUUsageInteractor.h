//
//  CPChartGPUUsageInteractor.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/14/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPChartGPUUsageIO.h"

NS_ASSUME_NONNULL_BEGIN
@class CPChartGPUUsageDataManager;

@interface CPChartGPUUsageInteractor : NSObject <CPChartGPUUsageInput>

@property (nonatomic, weak) id <CPChartGPUUsageOutput> output;

- (instancetype)initWithDataManager:(CPChartGPUUsageDataManager *)dataManager;

@end

NS_ASSUME_NONNULL_END
