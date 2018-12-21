//
//  CPChartNetworkUsageInteractor.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/14/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPChartNetworkUsageIO.h"

NS_ASSUME_NONNULL_BEGIN
@class CPChartNetworkUsageDataManager;

@interface CPChartNetworkUsageInteractor : NSObject <CPChartNetworkUsageInput>

@property (nonatomic, weak) id <CPChartNetworkUsageOutput> output;

- (instancetype)initWithDataManager:(CPChartNetworkUsageDataManager *)dataManager;

@end

NS_ASSUME_NONNULL_END
