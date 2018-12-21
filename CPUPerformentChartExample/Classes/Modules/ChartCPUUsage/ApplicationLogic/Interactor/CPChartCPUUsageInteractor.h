//
//  CPChartCPUUsageInteractor.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/14/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPChartCPUUsageIO.h"

NS_ASSUME_NONNULL_BEGIN
@class CPChartCPUUsageDataManager;

@interface CPChartCPUUsageInteractor : NSObject <CPChartCPUUsageInput>

@property (nonatomic, weak) id <CPChartCPUUsageOutput> output;

- (instancetype)initWithDataManager:(CPChartCPUUsageDataManager *)dataManager;

@end

NS_ASSUME_NONNULL_END
