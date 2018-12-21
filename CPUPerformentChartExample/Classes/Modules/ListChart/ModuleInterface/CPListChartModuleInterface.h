//
//  CPListChartModuleInterface.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#ifndef CPListChartModuleInterface_h
#define CPListChartModuleInterface_h
@class CPListChartDisplayItem;

@protocol CPListChartModuleInterface <NSObject>

- (void)updateView;
- (void)selectedChartItem:(CPListChartDisplayItem *)displayItem;

@end

#endif /* CPListChartModuleInterface_h */
