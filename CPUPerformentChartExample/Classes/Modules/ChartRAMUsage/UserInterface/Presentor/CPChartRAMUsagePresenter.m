//
//  CPChartRAMUsagePresenter.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartRAMUsagePresenter.h"
#import "CPChartRAMUsageViewInterface.h"
//#import "CPUPerformentChartExample-Swift.h"
#import "CPChartRAMUsageItem.h"

@implementation CPChartRAMUsagePresenter

- (void)updateView {
    // TODO: get all data current for chart
    [self.chartInteractor findAllRAMUsage];
}

#pragma mark - CPChartRAMUsageOutput

- (void)foundRAMUsage:(NSArray<CPChartRAMUsageItem *> *)dataList {
    if (self.userInterface) {
        if (dataList.count <= 0) {
            if ([self.userInterface respondsToSelector:@selector(showNoContentMessage)]) {
                [self.userInterface showNoContentMessage];
            }
        }
        else {
            NSArray<ChartDataEntry *> *dataListDisplay = [dataList arrayFromObjectsCollectedWithBlock:^id _Nonnull(id  _Nonnull object) {
                CPChartRAMUsageItem *dataObj = (CPChartRAMUsageItem *)object;
                ChartDataEntry *chartDataObj = [[ChartDataEntry alloc]
                                                initWithX:dataObj.timeRAMReceive.timeIntervalSince1970 y:dataObj.valueRAMUsage];
                return chartDataObj;
            }];
            if ([self.userInterface respondsToSelector:@selector(showChartData:)]) {
                [self.userInterface showChartData:dataListDisplay];
            }
        }
    }
}

- (void)receiveItemNewest:(CPChartRAMUsageItem *)itemNewest {
    CPChartRAMUsageItem *dataObj = itemNewest;
    ChartDataEntry *chartDataObj = [[ChartDataEntry alloc]
                                    initWithX:dataObj.timeRAMReceive.timeIntervalSince1970 y:dataObj.valueRAMUsage];
    if (self.userInterface && [self.userInterface respondsToSelector:@selector(appendChartData:)]) {
        [self.userInterface appendChartData:chartDataObj];
    }
}

@end
