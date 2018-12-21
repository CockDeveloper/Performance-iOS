//
//  CPChartNetworkUsageWireframe.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartNetworkUsageWireframe.h"
#import "CPChartNetworkUsageViewController.h"
#import "CPChartNetworkUsagePresenter.h"

@interface CPChartNetworkUsageWireframe ()

@property (nonatomic, weak) CPChartNetworkUsageViewController *presentedViewController;

@end

@implementation CPChartNetworkUsageWireframe

- (void)pushChartNetworkUsageInterfaceFromViewController:(UIViewController *)viewController {
    CPChartNetworkUsageViewController *chartVC = [self chartNetworkUsageViewController];
    // TODO: config chartVC
    chartVC.eventHandler = self.chartNetworkUsagePresenter;
    
    self.chartNetworkUsagePresenter.userInterface = chartVC;
    self.presentedViewController = chartVC;
    [viewController.navigationController pushViewController:chartVC animated:YES];
}

//- (void)dismissChartNetworkUsageInterface {
//    [self.presentedViewController.navigationController popViewControllerAnimated:YES];
//}

- (CPChartNetworkUsageViewController *)chartNetworkUsageViewController {
    return (CPChartNetworkUsageViewController *)[CPStoryboardUtility getViewController:[CPChartNetworkUsageViewController class]];
}

@end
