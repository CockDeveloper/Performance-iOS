//
//  CPBaseDisplayItem.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/17/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CPBaseDisplayItem : NSObject

@property (nonatomic, readonly, copy) NSString *__id;
@property (nonatomic, readonly, copy) id sectionKey;

- (instancetype)displayItemWithIdentifier:(NSString *)identifier andSectionKey:(id _Nonnull)sectionKey;

@end

NS_ASSUME_NONNULL_END
