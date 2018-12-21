//
//  CPChartCPUUsageInteractor.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/14/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartCPUUsageInteractor.h"
#import "CPChartCPUUsageDataManager.h"

@interface CPChartCPUUsageInteractor ()

@property (nonatomic, strong) CPChartCPUUsageDataManager *dataManager;

@end

@implementation CPChartCPUUsageInteractor

- (instancetype)initWithDataManager:(CPChartCPUUsageDataManager *)dataManager {
    self = [super init];
    if (self) {
        self.dataManager = dataManager;
    }
    return self;
}

- (void)findAllCPUUsage {
    [self.dataManager listCPUUsageFromDataStoreWithComplete:^(NSArray<CPChartCPUUsageItem *> * _Nonnull listData) {
        if (self.output && [self.output respondsToSelector:@selector(foundCPUUsage:)]) {
            [self.output foundCPUUsage:listData];
        }
    }];
}

- (void)sendItemNewest:(CPChartCPUUsageItem *)item {
    if (self.output && [self.output respondsToSelector:@selector(receiveItemNewest:)]) {
        [self.output receiveItemNewest:item];
    }
}
@end
