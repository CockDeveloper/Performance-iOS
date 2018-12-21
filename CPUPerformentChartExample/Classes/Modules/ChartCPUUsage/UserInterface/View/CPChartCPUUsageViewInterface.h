//
//  CPChartCPUUsageViewInterface.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#ifndef CPChartCPUUsageViewInterface_h
#define CPChartCPUUsageViewInterface_h
@class ChartDataEntry;

@protocol CPChartCPUUsageViewInterface <NSObject>

- (void)showChartData:(NSArray<ChartDataEntry *> *)dataList;
- (void)showNoContentMessage;
- (void)reloadEntries;

- (void)appendChartData:(ChartDataEntry *)data;

@end

#endif /* CPChartCPUUsageViewInterface_h */
