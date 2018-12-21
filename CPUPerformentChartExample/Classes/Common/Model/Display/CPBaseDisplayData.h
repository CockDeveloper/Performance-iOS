//
//  CPBaseDisplayData.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/17/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class CPBaseDisplaySection;

@interface CPBaseDisplayData : NSObject

@property (nonatomic, readonly, copy) NSArray<CPBaseDisplaySection *> *sections;

+ (instancetype)displayDataWithSections:(NSArray<CPBaseDisplaySection *> *)sections;

@end

NS_ASSUME_NONNULL_END
