//
//  CPListChartDataManager.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/12/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPListChartDataManager.h"
#import "CPCoreDataStore.h"
#import "CPChartItem.h"

@interface CPListChartDataManager ()

@property (nonatomic, strong) CPCoreDataStore *dataStore;

@end

@implementation CPListChartDataManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataStore = [CPCoreDataStore new];
    }
    return self;
}

- (void)listChartsFromDataStoreWithComplete:(void (^)(NSArray<CPChartItem *> *))completion {
    [self.dataStore fetchAllEntriesCompeletion:^(NSArray<NSDictionary *> * _Nonnull listItemRaw) {
        NSArray<CPChartItem *> *listCharts = [listItemRaw arrayFromObjectsCollectedWithBlock:^id _Nonnull(id  _Nonnull object) {
            return [CPChartItem chartItemFromInfo:object];
        }];
        completion(listCharts);
    }];
}

@end
