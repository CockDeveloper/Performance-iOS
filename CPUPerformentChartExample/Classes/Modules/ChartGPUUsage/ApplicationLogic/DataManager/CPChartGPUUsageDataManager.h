//
//  CPChartGPUUsageDataManager.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/14/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class CPChartGPUUsageCoreDataStore;
@class CPChartGPUUsageItem;
@protocol CPChartGPUUsageInput;

@interface CPChartGPUUsageDataManager : NSObject

@property (nonatomic, weak) id <CPChartGPUUsageInput> input;
@property (nonatomic, strong, readonly) CPChartGPUUsageCoreDataStore *dataStore;

- (void)listGPUUsageFromDataStoreWithComplete:(void (^)(NSArray<CPChartGPUUsageItem *> * listData))completion;

@end

NS_ASSUME_NONNULL_END
