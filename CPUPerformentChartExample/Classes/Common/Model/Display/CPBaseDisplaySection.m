//
//  CPBaseDisplaySection.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/17/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPBaseDisplaySection.h"
#import "CPBaseDisplayItem.h"

@interface CPBaseDisplaySection ()

@property (nonatomic, copy) NSArray<CPBaseDisplayItem *> *items;

@end

@implementation CPBaseDisplaySection

+ (instancetype)displaySectionWithItems:(NSArray<CPBaseDisplayItem *> *)items {
    id displaySection = [self new];
    if (displaySection) {
        [displaySection setItems:[NSArray<CPBaseDisplayItem *> arrayWithArray:items]];
    }
    
    return displaySection;
}

- (BOOL)isEqualToDisplaySection:(CPBaseDisplaySection *)section {
    if (!section) {
        return NO;
    }
    
    BOOL hasEqualItems = [self.items isEqualToArray:section.items];
    
    return hasEqualItems;
}

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[CPBaseDisplaySection class]]) {
        return NO;
    }
    
    return [self isEqualToDisplaySection:object];
}

- (NSUInteger)hash {
    return [self.items hash];
}

@end
