//
//  CPListChartInteractor.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/11/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPListChartInteractor.h"
#import "CPListChartDataManager.h"

@interface CPListChartInteractor ()

@property (strong, nonatomic) CPListChartDataManager *dataManager;

@end

@implementation CPListChartInteractor

- (instancetype)initWithDataManager:(CPListChartDataManager *)dataManager {
    self = [super init];
    if (self) {
        self.dataManager = dataManager;
    }
    return self;
}

- (void)findAllCharts {
    [self.dataManager listChartsFromDataStoreWithComplete:^(NSArray<CPChartItem *> * _Nonnull listChartItem) {
        if (self.output && [self.output respondsToSelector:@selector(foundAllCharts:)]) {
            [self.output foundAllCharts:listChartItem];
        }
    }];
}
@end
