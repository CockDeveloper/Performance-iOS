//
//  CPListChartWireframe.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/10/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPBaseWireframe.h"

NS_ASSUME_NONNULL_BEGIN

//@class CPChartCPUUsageWireframe;
@class CPListChartPresenter;
@class CPRootWireframe;
@class CPChartCPUUsageWireframe;
@class CPChartRAMUsageWireframe;
@class CPChartNetworkUsageWireframe;
@class CPChartGPUUsageWireframe;

@interface CPListChartWireframe : CPBaseWireframe

@property (strong, nonatomic) CPListChartPresenter *listChartPresenter;
@property (strong, nonatomic) CPRootWireframe *rootWireframe;
@property (strong, nonatomic) CPChartCPUUsageWireframe *chartCPUUsageWireframe;
@property (strong, nonatomic) CPChartRAMUsageWireframe *chartRAMUsageWireframe;
@property (strong, nonatomic) CPChartNetworkUsageWireframe *chartNetworkUsageWireframe;
@property (strong, nonatomic) CPChartGPUUsageWireframe *chartGPUUsageWireframe;

- (void)presentListChartInterfaceFromWindow:(UIWindow *)window;
- (void)presentChartCPUUsageInterface;
- (void)presentChartRAMUsageInterface;
- (void)presentChartNetworkUsageInterface;
- (void)presentChartGPUUsageInterface;

@end

NS_ASSUME_NONNULL_END
