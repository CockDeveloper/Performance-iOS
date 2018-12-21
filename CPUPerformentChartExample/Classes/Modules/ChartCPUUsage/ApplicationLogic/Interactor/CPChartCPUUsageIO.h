//
//  CPChartCPUUsageIO.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#ifndef CPChartCPUUsageIO_h
#define CPChartCPUUsageIO_h
@class CPChartCPUUsageItem;

@protocol CPChartCPUUsageInput <NSObject>

- (void)findAllCPUUsage;
- (void)sendItemNewest:(CPChartCPUUsageItem *)item;

@end

@protocol CPChartCPUUsageOutput <NSObject>

- (void)foundCPUUsage:(NSArray<CPChartCPUUsageItem *> *)dataList;
- (void)receiveItemNewest:(CPChartCPUUsageItem *)itemNewest;

@end

#endif /* CPChartCPUUsageIO_h */
