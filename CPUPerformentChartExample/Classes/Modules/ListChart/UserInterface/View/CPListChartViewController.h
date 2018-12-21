//
//  CPListChartViewController.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/11/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPListChartViewInterface.h"

NS_ASSUME_NONNULL_BEGIN
@protocol CPListChartModuleInterface;
@class CPListChartPresenter;

@interface CPListChartViewController : UIViewController <CPListChartViewInterface>

@property (nonatomic, weak) id <CPListChartModuleInterface> eventHandler;

@end

NS_ASSUME_NONNULL_END
