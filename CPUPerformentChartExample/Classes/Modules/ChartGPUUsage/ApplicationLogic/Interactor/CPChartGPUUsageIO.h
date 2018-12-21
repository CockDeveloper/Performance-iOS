//
//  CPChartGPUUsageIO.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#ifndef CPChartGPUUsageIO_h
#define CPChartGPUUsageIO_h
@class CPChartGPUUsageItem;

@protocol CPChartGPUUsageInput <NSObject>

- (void)findAllGPUUsage;
- (void)sendItemNewest:(CPChartGPUUsageItem *)item;

@end

@protocol CPChartGPUUsageOutput <NSObject>

- (void)foundGPUUsage:(NSArray<CPChartGPUUsageItem *> *)dataList;
- (void)receiveItemNewest:(CPChartGPUUsageItem *)itemNewest;

@end

#endif /* CPChartGPUUsageIO_h */
