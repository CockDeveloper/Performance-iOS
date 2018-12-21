//
//  CPChartNetworkUsagePresenter.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartNetworkUsagePresenter.h"
#import "CPChartNetworkUsageViewInterface.h"
//#import "CPUPerformentChartExample-Swift.h"
#import "CPChartNetworkUsageItem.h"

@implementation CPChartNetworkUsagePresenter

- (void)updateView {
    // TODO: get all data current for chart
    [self.chartInteractor findAllNetworkUsage];
}

#pragma mark - CPChartNetworkUsageOutput

- (void)foundNetworkUsage:(NSArray<CPChartNetworkUsageItem *> *)dataList {
    if (self.userInterface) {
        if (dataList.count <= 0) {
            if ([self.userInterface respondsToSelector:@selector(showNoContentMessage)]) {
                [self.userInterface showNoContentMessage];
            }
        }
        else {
            NSArray<ChartDataEntry *> *dataListDisplay = [dataList arrayFromObjectsCollectedWithBlock:^id _Nonnull(id  _Nonnull object) {
                CPChartNetworkUsageItem *dataObj = (CPChartNetworkUsageItem *)object;
                ChartDataEntry *chartDataObj = [[ChartDataEntry alloc]
                                                initWithX:dataObj.timeNetworkReceive.timeIntervalSince1970 y:dataObj.valueNetworkUsage];
                return chartDataObj;
            }];
            if ([self.userInterface respondsToSelector:@selector(showChartData:)]) {
                [self.userInterface showChartData:dataListDisplay];
            }
        }
    }
}

- (void)receiveItemNewest:(CPChartNetworkUsageItem *)itemNewest {
    CPChartNetworkUsageItem *dataObj = itemNewest;
    ChartDataEntry *chartDataObj = [[ChartDataEntry alloc]
                                    initWithX:dataObj.timeNetworkReceive.timeIntervalSince1970 y:dataObj.valueNetworkUsage];
    if (self.userInterface && [self.userInterface respondsToSelector:@selector(appendChartData:)]) {
        [self.userInterface appendChartData:chartDataObj];
    }
}

@end
