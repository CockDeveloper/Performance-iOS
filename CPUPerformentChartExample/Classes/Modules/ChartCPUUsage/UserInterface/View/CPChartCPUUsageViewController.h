//
//  CPChartCPUUsageViewController.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPChartCPUUsageViewInterface.h"

NS_ASSUME_NONNULL_BEGIN
@protocol CPChartCPUUsageModuleInterface;

@interface CPChartCPUUsageViewController : UIViewController <CPChartCPUUsageViewInterface>

@property (weak, nonatomic) id <CPChartCPUUsageModuleInterface> eventHandler;

@end

NS_ASSUME_NONNULL_END
