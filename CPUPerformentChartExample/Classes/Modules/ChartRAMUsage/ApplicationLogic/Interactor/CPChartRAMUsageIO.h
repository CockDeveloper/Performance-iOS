//
//  CPChartRAMUsageIO.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#ifndef CPChartRAMUsageIO_h
#define CPChartRAMUsageIO_h
@class CPChartRAMUsageItem;

@protocol CPChartRAMUsageInput <NSObject>

- (void)findAllRAMUsage;
- (void)sendItemNewest:(CPChartRAMUsageItem *)item;

@end

@protocol CPChartRAMUsageOutput <NSObject>

- (void)foundRAMUsage:(NSArray<CPChartRAMUsageItem *> *)dataList;
- (void)receiveItemNewest:(CPChartRAMUsageItem *)itemNewest;

@end

#endif /* CPChartRAMUsageIO_h */
