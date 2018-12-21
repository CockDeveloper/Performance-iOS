//
//  CPChartRAMUsageViewController.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPChartRAMUsageViewInterface.h"

NS_ASSUME_NONNULL_BEGIN
@protocol CPChartRAMUsageModuleInterface;

@interface CPChartRAMUsageViewController : UIViewController <CPChartRAMUsageViewInterface>

@property (weak, nonatomic) id <CPChartRAMUsageModuleInterface> eventHandler;

@end

NS_ASSUME_NONNULL_END
