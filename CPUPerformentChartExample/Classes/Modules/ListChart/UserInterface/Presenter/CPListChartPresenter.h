//
//  CPListChartPresenter.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/11/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPListChartModuleInterface.h"
#import "CPListChartIO.h"

NS_ASSUME_NONNULL_BEGIN
@class CPListChartWireframe;
@protocol CPListChartViewInterface;

@interface CPListChartPresenter : NSObject <CPListChartModuleInterface, CPListChartOutput>

@property (strong, nonatomic) id<CPListChartInput> listInteractor;
@property (weak, nonatomic) CPListChartWireframe *listWireframe;
@property (weak, nonatomic) UIViewController<CPListChartViewInterface> *userInterface;

@end

NS_ASSUME_NONNULL_END
