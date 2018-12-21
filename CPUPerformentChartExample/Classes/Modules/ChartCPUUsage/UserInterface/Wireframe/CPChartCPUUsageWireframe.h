//
//  CPChartCPUUsageWireframe.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPBaseWireframe.h"

NS_ASSUME_NONNULL_BEGIN
@class CPChartCPUUsagePresenter;

@interface CPChartCPUUsageWireframe : CPBaseWireframe

@property (nonatomic, strong) CPChartCPUUsagePresenter *chartCPUUsagePresenter;

- (void)pushChartCPUUsageInterfaceFromViewController:(UIViewController *)viewController;
//- (void)dismissChartCPUUsageInterface;

@end

NS_ASSUME_NONNULL_END
