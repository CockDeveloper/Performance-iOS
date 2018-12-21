//
//  CPStoryboardUtility.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/11/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CPStoryboardUtility : NSObject

+ (UIStoryboard *)mainStoryboard;
+ (UIViewController *)getViewController:(Class)viewControllerClass;

@end

NS_ASSUME_NONNULL_END
