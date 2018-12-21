//
//  CPListChartViewInterface.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/11/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#ifndef CPListChartViewInterface_h
#define CPListChartViewInterface_h
@class CPBaseDisplayData;

@protocol CPListChartViewInterface <NSObject>

- (void)showChartsList:(CPBaseDisplayData *)chartsList;
- (void)showNoContentMessage;
- (void)reloadEntries;

@end

#endif /* CPListChartViewInterface_h */
