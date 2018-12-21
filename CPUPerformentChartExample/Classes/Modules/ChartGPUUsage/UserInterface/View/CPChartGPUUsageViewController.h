//
//  CPChartGPUUsageViewController.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPChartGPUUsageViewInterface.h"

NS_ASSUME_NONNULL_BEGIN
@protocol CPChartGPUUsageModuleInterface;

@interface CPChartGPUUsageViewController : UIViewController <CPChartGPUUsageViewInterface>

@property (weak, nonatomic) id <CPChartGPUUsageModuleInterface> eventHandler;

@end

NS_ASSUME_NONNULL_END
