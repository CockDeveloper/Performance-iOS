//
//  CPChartCPUUsageDataManager.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/14/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class CPChartCPUUsageCoreDataStore;
@class CPChartCPUUsageItem;
@protocol CPChartCPUUsageInput;

@interface CPChartCPUUsageDataManager : NSObject

@property (nonatomic, weak) id <CPChartCPUUsageInput> input;
@property (nonatomic, strong, readonly) CPChartCPUUsageCoreDataStore *dataStore;

- (void)listCPUUsageFromDataStoreWithComplete:(void (^)(NSArray<CPChartCPUUsageItem *> * listData))completion;

@end

NS_ASSUME_NONNULL_END
