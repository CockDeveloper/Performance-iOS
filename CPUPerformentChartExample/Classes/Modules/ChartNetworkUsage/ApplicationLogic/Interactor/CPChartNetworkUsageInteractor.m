//
//  CPChartNetworkUsageInteractor.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/14/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartNetworkUsageInteractor.h"
#import "CPChartNetworkUsageDataManager.h"

@interface CPChartNetworkUsageInteractor ()

@property (nonatomic, strong) CPChartNetworkUsageDataManager *dataManager;

@end

@implementation CPChartNetworkUsageInteractor

- (instancetype)initWithDataManager:(CPChartNetworkUsageDataManager *)dataManager {
    self = [super init];
    if (self) {
        self.dataManager = dataManager;
    }
    return self;
}

- (void)findAllNetworkUsage {
    [self.dataManager listNetworkUsageFromDataStoreWithComplete:^(NSArray<CPChartNetworkUsageItem *> * _Nonnull listData) {
        if (self.output && [self.output respondsToSelector:@selector(foundNetworkUsage:)]) {
            [self.output foundNetworkUsage:listData];
        }
    }];
}

- (void)sendItemNewest:(CPChartNetworkUsageItem *)item {
    if (self.output && [self.output respondsToSelector:@selector(receiveItemNewest:)]) {
        [self.output receiveItemNewest:item];
    }
}
@end
