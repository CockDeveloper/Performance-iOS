//
//  NSArray+HOM.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/12/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "NSArray+HOM.h"

@implementation NSArray (HOM)

- (NSArray *)arrayFromObjectsCollectedWithBlock:(id (^)(id object))blockConvert {
    __block NSMutableArray *collection = [NSMutableArray arrayWithCapacity:[self count]];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [collection addObject:blockConvert(obj)];
    }];
    return collection;
}

@end

