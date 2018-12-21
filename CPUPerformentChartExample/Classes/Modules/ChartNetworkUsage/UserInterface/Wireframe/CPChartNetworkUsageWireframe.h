//
//  CPChartNetworkUsageWireframe.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPBaseWireframe.h"

NS_ASSUME_NONNULL_BEGIN
@class CPChartNetworkUsagePresenter;

@interface CPChartNetworkUsageWireframe : CPBaseWireframe

@property (nonatomic, strong) CPChartNetworkUsagePresenter *chartNetworkUsagePresenter;

- (void)pushChartNetworkUsageInterfaceFromViewController:(UIViewController *)viewController;
//- (void)dismissChartNetworkUsageInterface;

@end

NS_ASSUME_NONNULL_END
