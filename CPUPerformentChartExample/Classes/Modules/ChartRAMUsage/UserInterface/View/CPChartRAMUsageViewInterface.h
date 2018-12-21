//
//  CPChartRAMUsageViewInterface.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#ifndef CPChartRAMUsageViewInterface_h
#define CPChartRAMUsageViewInterface_h
@class ChartDataEntry;

@protocol CPChartRAMUsageViewInterface <NSObject>

- (void)showChartData:(NSArray<ChartDataEntry *> *)dataList;
- (void)showNoContentMessage;
- (void)reloadEntries;

- (void)appendChartData:(ChartDataEntry *)data;

@end

#endif /* CPChartRAMUsageViewInterface_h */
