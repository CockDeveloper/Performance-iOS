//
//  CPListChartPresenter.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/11/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPListChartPresenter.h"
#import "CPListChartInteractor.h"
#import "CPListChartWireframe.h"
#import "CPListChartViewInterface.h"
#import "CPChartItem.h"
#import "CPListChartDisplayDataCollector.h"
#import "CPListChartDisplayItem.h"

@implementation CPListChartPresenter

#pragma mark - CPListChartModuleInterface
- (void)updateView {
    [self.listInteractor findAllCharts];
}

- (void)selectedChartItem:(CPListChartDisplayItem *)displayItem {
    if ([kChartIdCPUUsage isEqualToString:displayItem.__id]) {
        [self.listWireframe presentChartCPUUsageInterface];
    }
    else if ([kChartIdRAMUsage isEqualToString:displayItem.__id]) {
        [self.listWireframe presentChartRAMUsageInterface];
    }
    else if ([kChartIdNetworkUsage isEqualToString:displayItem.__id]) {
        [self.listWireframe presentChartNetworkUsageInterface];
    }
    else if ([kChartIdGPUUsage isEqualToString:displayItem.__id]) {
        [self.listWireframe presentChartGPUUsageInterface];
    }
}

#pragma mark - CPListChartOutput
- (void)foundAllCharts:(NSArray<CPChartItem *> *)listCharts {
    if (self.userInterface) {
        if (listCharts.count <= 0) {
            if ([self.userInterface respondsToSelector:@selector(showNoContentMessage)]) {
                [self.userInterface showNoContentMessage];
            }
        }
        else {
            if ([self.userInterface respondsToSelector:@selector(showChartsList:)]) {
                [self.userInterface showChartsList:[self displayDataWithItems:listCharts]];
            }
        }
    }
}

- (CPBaseDisplayData *)displayDataWithItems:(NSArray<CPChartItem *> *)items {
    CPListChartDisplayDataCollector *collector = [CPListChartDisplayDataCollector new];
    [collector addItems:items];
    
    return [collector collectedDisplayData];
}

@end
