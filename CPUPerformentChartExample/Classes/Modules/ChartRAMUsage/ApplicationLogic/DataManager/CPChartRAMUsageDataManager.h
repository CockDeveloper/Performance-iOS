//
//  CPChartRAMUsageDataManager.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/14/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class CPChartRAMUsageCoreDataStore;
@class CPChartRAMUsageItem;
@protocol CPChartRAMUsageInput;

@interface CPChartRAMUsageDataManager : NSObject

@property (nonatomic, weak) id <CPChartRAMUsageInput> input;
@property (nonatomic, strong, readonly) CPChartRAMUsageCoreDataStore *dataStore;

- (void)listRAMUsageFromDataStoreWithComplete:(void (^)(NSArray<CPChartRAMUsageItem *> * listData))completion;

@end

NS_ASSUME_NONNULL_END
