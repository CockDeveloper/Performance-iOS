//
//  CPListChartDataManager.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/12/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class CPCoreDataStore;
@class CPChartItem;

@interface CPListChartDataManager : NSObject

@property (nonatomic, strong, readonly) CPCoreDataStore *dataStore;

- (void)listChartsFromDataStoreWithComplete:(void (^)(NSArray<CPChartItem *> *))completion;

@end

NS_ASSUME_NONNULL_END
