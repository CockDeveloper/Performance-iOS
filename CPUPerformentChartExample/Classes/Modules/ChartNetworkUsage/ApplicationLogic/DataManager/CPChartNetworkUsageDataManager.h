//
//  CPChartNetworkUsageDataManager.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/14/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class CPChartNetworkUsageCoreDataStore;
@class CPChartNetworkUsageItem;
@protocol CPChartNetworkUsageInput;

@interface CPChartNetworkUsageDataManager : NSObject

@property (nonatomic, weak) id <CPChartNetworkUsageInput> input;
@property (nonatomic, strong, readonly) CPChartNetworkUsageCoreDataStore *dataStore;

- (void)listNetworkUsageFromDataStoreWithComplete:(void (^)(NSArray<CPChartNetworkUsageItem *> * listData))completion;

@end

NS_ASSUME_NONNULL_END
