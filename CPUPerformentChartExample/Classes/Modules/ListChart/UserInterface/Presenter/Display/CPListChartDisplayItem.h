//
//  CPListChartDisplayItem.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/17/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPBaseDisplayItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface CPListChartDisplayItem : CPBaseDisplayItem

@property (nonatomic, readonly, copy) NSString *name;

+ (instancetype)displayItemWithIdentifier:(NSString *)identifier andSectionKey:(id _Nonnull)sectionKey andName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
