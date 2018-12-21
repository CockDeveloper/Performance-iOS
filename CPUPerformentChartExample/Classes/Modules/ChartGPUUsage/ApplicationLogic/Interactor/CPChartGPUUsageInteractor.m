//
//  CPChartGPUUsageInteractor.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/14/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartGPUUsageInteractor.h"
#import "CPChartGPUUsageDataManager.h"

@interface CPChartGPUUsageInteractor ()

@property (nonatomic, strong) CPChartGPUUsageDataManager *dataManager;

@end

@implementation CPChartGPUUsageInteractor

- (instancetype)initWithDataManager:(CPChartGPUUsageDataManager *)dataManager {
    self = [super init];
    if (self) {
        self.dataManager = dataManager;
    }
    return self;
}

- (void)findAllGPUUsage {
    [self.dataManager listGPUUsageFromDataStoreWithComplete:^(NSArray<CPChartGPUUsageItem *> * _Nonnull listData) {
        if (self.output && [self.output respondsToSelector:@selector(foundGPUUsage:)]) {
            [self.output foundGPUUsage:listData];
        }
    }];
}

- (void)sendItemNewest:(CPChartGPUUsageItem *)item {
    if (self.output && [self.output respondsToSelector:@selector(receiveItemNewest:)]) {
        [self.output receiveItemNewest:item];
    }
}
@end
