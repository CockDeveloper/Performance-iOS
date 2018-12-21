//
//  CPChartNetworkUsageViewInterface.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#ifndef CPChartNetworkUsageViewInterface_h
#define CPChartNetworkUsageViewInterface_h
@class ChartDataEntry;

@protocol CPChartNetworkUsageViewInterface <NSObject>

- (void)showChartData:(NSArray<ChartDataEntry *> *)dataList;
- (void)showNoContentMessage;
- (void)reloadEntries;

- (void)appendChartData:(ChartDataEntry *)data;

@end

#endif /* CPChartNetworkUsageViewInterface_h */
