//
//  CPListChartDisplayItem.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/17/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPListChartDisplayItem.h"

@interface CPListChartDisplayItem ()

@property (nonatomic, copy) NSString *name;

@end

@implementation CPListChartDisplayItem

+ (instancetype)displayItemWithIdentifier:(NSString *)identifier andSectionKey:(id _Nonnull)sectionKey andName:(NSString *)name {
    id displayItem = [[self alloc] displayItemWithIdentifier:identifier andSectionKey:sectionKey];
    if (displayItem) {
        [displayItem setName:name];
    }
    
    return displayItem;
}

- (BOOL)isEqualToDisplayItem:(CPListChartDisplayItem *)item {
    if (!item) {
        return NO;
    }
    
    BOOL hasEqualName = [self.name isEqual:item.name];

    return hasEqualName;
}

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[CPListChartDisplayItem class]]) {
        return NO;
    }
    
    return [super isEqual:object] && [self isEqualToDisplayItem:object];
}

- (NSUInteger)hash {
    return [super hash] ^ [self.name hash];
}

@end
