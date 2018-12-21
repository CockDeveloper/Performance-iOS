//
//  CPChartNetworkUsageViewController.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPChartNetworkUsageViewInterface.h"

NS_ASSUME_NONNULL_BEGIN
@protocol CPChartNetworkUsageModuleInterface;

@interface CPChartNetworkUsageViewController : UIViewController <CPChartNetworkUsageViewInterface>

@property (weak, nonatomic) id <CPChartNetworkUsageModuleInterface> eventHandler;

@end

NS_ASSUME_NONNULL_END
