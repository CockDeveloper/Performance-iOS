//
//  CPChartGPUUsageViewInterface.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#ifndef CPChartGPUUsageViewInterface_h
#define CPChartGPUUsageViewInterface_h
@class ChartDataEntry;

@protocol CPChartGPUUsageViewInterface <NSObject>

- (void)showChartData:(NSArray<ChartDataEntry *> *)dataList;
- (void)showNoContentMessage;
- (void)reloadEntries;

- (void)appendChartData:(ChartDataEntry *)data;

@end

#endif /* CPChartGPUUsageViewInterface_h */
