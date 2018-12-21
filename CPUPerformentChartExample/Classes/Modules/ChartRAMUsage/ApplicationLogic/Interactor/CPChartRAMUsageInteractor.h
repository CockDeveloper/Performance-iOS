//
//  CPChartRAMUsageInteractor.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/14/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPChartRAMUsageIO.h"

NS_ASSUME_NONNULL_BEGIN
@class CPChartRAMUsageDataManager;

@interface CPChartRAMUsageInteractor : NSObject <CPChartRAMUsageInput>

@property (nonatomic, weak) id <CPChartRAMUsageOutput> output;

- (instancetype)initWithDataManager:(CPChartRAMUsageDataManager *)dataManager;

@end

NS_ASSUME_NONNULL_END
