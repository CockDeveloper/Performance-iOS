//
//  CPChartRAMUsageWireframe.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPBaseWireframe.h"

NS_ASSUME_NONNULL_BEGIN
@class CPChartRAMUsagePresenter;

@interface CPChartRAMUsageWireframe : CPBaseWireframe

@property (nonatomic, strong) CPChartRAMUsagePresenter *chartRAMUsagePresenter;

- (void)pushChartRAMUsageInterfaceFromViewController:(UIViewController *)viewController;
//- (void)dismissChartRAMUsageInterface;

@end

NS_ASSUME_NONNULL_END
