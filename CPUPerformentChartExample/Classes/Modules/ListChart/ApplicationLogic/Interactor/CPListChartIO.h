//
//  CPListChartIO.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/12/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#ifndef CPListChartIO_h
#define CPListChartIO_h
@class CPChartItem;

@protocol CPListChartInput <NSObject>

- (void)findAllCharts;

@end

@protocol CPListChartOutput <NSObject>

- (void)foundAllCharts:(NSArray<CPChartItem *> *)listCharts;

@end

#endif /* CPListChartIO_h */
