//
//  CPChartGPUUsagePresenter.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartGPUUsagePresenter.h"
#import "CPChartGPUUsageViewInterface.h"
//#import "CPUPerformentChartExample-Swift.h"
#import "CPChartGPUUsageItem.h"

@implementation CPChartGPUUsagePresenter

- (void)updateView {
    // TODO: get all data current for chart
    [self.chartInteractor findAllGPUUsage];
}

#pragma mark - CPChartGPUUsageOutput

- (void)foundGPUUsage:(NSArray<CPChartGPUUsageItem *> *)dataList {
    if (self.userInterface) {
        if (dataList.count <= 0) {
            if ([self.userInterface respondsToSelector:@selector(showNoContentMessage)]) {
                [self.userInterface showNoContentMessage];
            }
        }
        else {
            NSArray<ChartDataEntry *> *dataListDisplay = [dataList arrayFromObjectsCollectedWithBlock:^id _Nonnull(id  _Nonnull object) {
                CPChartGPUUsageItem *dataObj = (CPChartGPUUsageItem *)object;
                ChartDataEntry *chartDataObj = [[ChartDataEntry alloc]
                                                initWithX:dataObj.timeGPUReceive.timeIntervalSince1970 y:dataObj.valueGPUUsage];
                return chartDataObj;
            }];
            if ([self.userInterface respondsToSelector:@selector(showChartData:)]) {
                [self.userInterface showChartData:dataListDisplay];
            }
        }
    }
}

- (void)receiveItemNewest:(CPChartGPUUsageItem *)itemNewest {
    CPChartGPUUsageItem *dataObj = itemNewest;
    ChartDataEntry *chartDataObj = [[ChartDataEntry alloc]
                                    initWithX:dataObj.timeGPUReceive.timeIntervalSince1970 y:dataObj.valueGPUUsage];
    if (self.userInterface && [self.userInterface respondsToSelector:@selector(appendChartData:)]) {
        [self.userInterface appendChartData:chartDataObj];
    }
}

@end
