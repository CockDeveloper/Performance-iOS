//
//  CPBaseDisplayDataCollectorDelegate.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/17/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#ifndef CPBaseDisplayDataCollectorDelegate_h
#define CPBaseDisplayDataCollectorDelegate_h
@class CPBaseDisplayItem;

@protocol CPBaseDisplayDataCollectorDelegate <NSObject>

- (CPBaseDisplayItem *)displayItemFromObjectItem:(id _Nonnull)objectItem;
- (NSMutableArray<CPBaseDisplayItem *> *)sectionItemsForKey:(id _Nonnull)sectionKey fromSections:(NSMutableDictionary * _Nonnull)sections;

@end

#endif /* CPBaseDisplayDataCollectorDelegate_h */
