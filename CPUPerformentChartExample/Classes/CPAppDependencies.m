//
//  CPAppDependencies.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/11/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPAppDependencies.h"
#import "CPRootWireframe.h"

#import "CPListChartWireframe.h"
#import "CPListChartPresenter.h"
#import "CPListChartDataManager.h"
#import "CPListChartInteractor.h"

#import "CPChartCPUUsageWireframe.h"
#import "CPChartCPUUsagePresenter.h"
#import "CPChartCPUUsageInteractor.h"
#import "CPChartCPUUsageDataManager.h"

#import "CPChartRAMUsageWireframe.h"
#import "CPChartRAMUsagePresenter.h"
#import "CPChartRAMUsageInteractor.h"
#import "CPChartRAMUsageDataManager.h"

#import "CPChartNetworkUsageWireframe.h"
#import "CPChartNetworkUsagePresenter.h"
#import "CPChartNetworkUsageInteractor.h"
#import "CPChartNetworkUsageDataManager.h"

#import "CPChartGPUUsageWireframe.h"
#import "CPChartGPUUsagePresenter.h"
#import "CPChartGPUUsageInteractor.h"
#import "CPChartGPUUsageDataManager.h"

@interface CPAppDependencies ()

@property (strong, nonatomic) CPListChartWireframe *listChartWireframe;

@end

@implementation CPAppDependencies

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configureDependencies];
    }
    return self;
}

- (void)installRootViewControllerIntoWindow:(UIWindow *)window {
    [self.listChartWireframe presentListChartInterfaceFromWindow:window];
}

- (void)configureDependencies {
    [self configureListChartDependencies];
    [self configureChartCPUUsageDependencies];
    [self configureChartRAMUsageDependencies];
    [self configureChartNetworkUsageDependencies];
    [self configureChartGPUUsageDependencies];
    // TODO: continue config dependencies
}

- (void)configureListChartDependencies {
    CPListChartWireframe *listChartWireframe = [CPListChartWireframe new];
    CPRootWireframe *rootWireframe = [CPRootWireframe new];
    CPListChartPresenter *listPresenter = [CPListChartPresenter new];
    CPListChartDataManager *dataManager = [CPListChartDataManager new];
    CPListChartInteractor *listInteractor = [[CPListChartInteractor alloc] initWithDataManager:dataManager];
    
    listInteractor.output = listPresenter;
    
    listPresenter.listWireframe = listChartWireframe;
    listPresenter.listInteractor = listInteractor;
    
    listChartWireframe.listChartPresenter = listPresenter;
    listChartWireframe.rootWireframe = rootWireframe;
    self.listChartWireframe = listChartWireframe;
}

- (void)configureChartCPUUsageDependencies {
    CPChartCPUUsageWireframe *chartCPUUsageWireframe = [CPChartCPUUsageWireframe new];
    CPChartCPUUsagePresenter *chartCPUUsagePresenter = [CPChartCPUUsagePresenter new];
    CPChartCPUUsageDataManager *dataManager = [CPChartCPUUsageDataManager new];
    CPChartCPUUsageInteractor *chartInteractor = [[CPChartCPUUsageInteractor alloc] initWithDataManager:dataManager];
    
    dataManager.input = chartInteractor;
    chartInteractor.output = chartCPUUsagePresenter;
    
    chartCPUUsagePresenter.chartInteractor = chartInteractor;
    
    chartCPUUsageWireframe.chartCPUUsagePresenter = chartCPUUsagePresenter;
    self.listChartWireframe.chartCPUUsageWireframe = chartCPUUsageWireframe;
}

- (void)configureChartRAMUsageDependencies {
    CPChartRAMUsageWireframe *chartRAMUsageWireframe = [CPChartRAMUsageWireframe new];
    CPChartRAMUsagePresenter *chartRAMUsagePresenter = [CPChartRAMUsagePresenter new];
    CPChartRAMUsageDataManager *dataManager = [CPChartRAMUsageDataManager new];
    CPChartRAMUsageInteractor *chartInteractor = [[CPChartRAMUsageInteractor alloc] initWithDataManager:dataManager];
    
    dataManager.input = chartInteractor;
    chartInteractor.output = chartRAMUsagePresenter;
    
    chartRAMUsagePresenter.chartInteractor = chartInteractor;
    
    chartRAMUsageWireframe.chartRAMUsagePresenter = chartRAMUsagePresenter;
    self.listChartWireframe.chartRAMUsageWireframe = chartRAMUsageWireframe;
}

- (void)configureChartNetworkUsageDependencies {
    CPChartNetworkUsageWireframe *chartNetworkUsageWireframe = [CPChartNetworkUsageWireframe new];
    CPChartNetworkUsagePresenter *chartNetworkUsagePresenter = [CPChartNetworkUsagePresenter new];
    CPChartNetworkUsageDataManager *dataManager = [CPChartNetworkUsageDataManager new];
    CPChartNetworkUsageInteractor *chartInteractor = [[CPChartNetworkUsageInteractor alloc] initWithDataManager:dataManager];
    
    dataManager.input = chartInteractor;
    chartInteractor.output = chartNetworkUsagePresenter;
    
    chartNetworkUsagePresenter.chartInteractor = chartInteractor;
    
    chartNetworkUsageWireframe.chartNetworkUsagePresenter = chartNetworkUsagePresenter;
    self.listChartWireframe.chartNetworkUsageWireframe = chartNetworkUsageWireframe;
}

- (void)configureChartGPUUsageDependencies {
    CPChartGPUUsageWireframe *chartGPUUsageWireframe = [CPChartGPUUsageWireframe new];
    CPChartGPUUsagePresenter *chartGPUUsagePresenter = [CPChartGPUUsagePresenter new];
    CPChartGPUUsageDataManager *dataManager = [CPChartGPUUsageDataManager new];
    CPChartGPUUsageInteractor *chartInteractor = [[CPChartGPUUsageInteractor alloc] initWithDataManager:dataManager];
    
    dataManager.input = chartInteractor;
    chartInteractor.output = chartGPUUsagePresenter;
    
    chartGPUUsagePresenter.chartInteractor = chartInteractor;
    
    chartGPUUsageWireframe.chartGPUUsagePresenter = chartGPUUsagePresenter;
    self.listChartWireframe.chartGPUUsageWireframe = chartGPUUsageWireframe;
}

@end
