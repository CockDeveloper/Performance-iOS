//
//  CPChartCPUUsagePresenter.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartCPUUsagePresenter.h"
#import "CPChartCPUUsageViewInterface.h"
#import "CPUPerformentChartExample-Swift.h"
#import "CPChartCPUUsageItem.h"

@implementation CPChartCPUUsagePresenter

- (void)updateView {
    // TODO: get all data current for chart
    [self.chartInteractor findAllCPUUsage];
}

#pragma mark - CPChartCPUUsageOutput

- (void)foundCPUUsage:(NSArray<CPChartCPUUsageItem *> *)dataList {
    if (self.userInterface) {
        if (dataList.count <= 0) {
            if ([self.userInterface respondsToSelector:@selector(showNoContentMessage)]) {
                [self.userInterface showNoContentMessage];
            }
        }
        else {
            NSArray<ChartDataEntry *> *dataListDisplay = [dataList arrayFromObjectsCollectedWithBlock:^id _Nonnull(id  _Nonnull object) {
                CPChartCPUUsageItem *dataObj = (CPChartCPUUsageItem *)object;
                ChartDataEntry *chartDataObj = [[ChartDataEntry alloc]
                                                initWithX:dataObj.timeCPUReceive.timeIntervalSince1970 y:dataObj.valueCPUUsage];
                return chartDataObj;
            }];
            if ([self.userInterface respondsToSelector:@selector(showChartData:)]) {
                [self.userInterface showChartData:dataListDisplay];
            }
        }
    }
}

- (void)receiveItemNewest:(CPChartCPUUsageItem *)itemNewest {
    CPChartCPUUsageItem *dataObj = itemNewest;
    ChartDataEntry *chartDataObj = [[ChartDataEntry alloc]
                                    initWithX:dataObj.timeCPUReceive.timeIntervalSince1970 y:dataObj.valueCPUUsage];
    if (self.userInterface && [self.userInterface respondsToSelector:@selector(appendChartData:)]) {
        [self.userInterface appendChartData:chartDataObj];
    }
}

@end
