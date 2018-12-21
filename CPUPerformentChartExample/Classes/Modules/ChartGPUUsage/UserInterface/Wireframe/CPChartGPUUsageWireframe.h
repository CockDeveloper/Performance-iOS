//
//  CPChartGPUUsageWireframe.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPBaseWireframe.h"

NS_ASSUME_NONNULL_BEGIN
@class CPChartGPUUsagePresenter;

@interface CPChartGPUUsageWireframe : CPBaseWireframe

@property (nonatomic, strong) CPChartGPUUsagePresenter *chartGPUUsagePresenter;

- (void)pushChartGPUUsageInterfaceFromViewController:(UIViewController *)viewController;
//- (void)dismissChartGPUUsageInterface;

@end

NS_ASSUME_NONNULL_END
