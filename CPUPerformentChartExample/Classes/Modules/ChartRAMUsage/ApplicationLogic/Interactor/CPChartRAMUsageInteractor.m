//
//  CPChartRAMUsageInteractor.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/14/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartRAMUsageInteractor.h"
#import "CPChartRAMUsageDataManager.h"

@interface CPChartRAMUsageInteractor ()

@property (nonatomic, strong) CPChartRAMUsageDataManager *dataManager;

@end

@implementation CPChartRAMUsageInteractor

- (instancetype)initWithDataManager:(CPChartRAMUsageDataManager *)dataManager {
    self = [super init];
    if (self) {
        self.dataManager = dataManager;
    }
    return self;
}

- (void)findAllRAMUsage {
    [self.dataManager listRAMUsageFromDataStoreWithComplete:^(NSArray<CPChartRAMUsageItem *> * _Nonnull listData) {
        if (self.output && [self.output respondsToSelector:@selector(foundRAMUsage:)]) {
            [self.output foundRAMUsage:listData];
        }
    }];
}

- (void)sendItemNewest:(CPChartRAMUsageItem *)item {
    if (self.output && [self.output respondsToSelector:@selector(receiveItemNewest:)]) {
        [self.output receiveItemNewest:item];
    }
}
@end
