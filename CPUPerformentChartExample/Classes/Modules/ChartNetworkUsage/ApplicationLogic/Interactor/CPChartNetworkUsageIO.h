//
//  CPChartNetworkUsageIO.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#ifndef CPChartNetworkUsageIO_h
#define CPChartNetworkUsageIO_h
@class CPChartNetworkUsageItem;

@protocol CPChartNetworkUsageInput <NSObject>

- (void)findAllNetworkUsage;
- (void)sendItemNewest:(CPChartNetworkUsageItem *)item;

@end

@protocol CPChartNetworkUsageOutput <NSObject>

- (void)foundNetworkUsage:(NSArray<CPChartNetworkUsageItem *> *)dataList;
- (void)receiveItemNewest:(CPChartNetworkUsageItem *)itemNewest;

@end

#endif /* CPChartNetworkUsageIO_h */
