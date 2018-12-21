//
//  CPBaseDisplayItem.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/17/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPBaseDisplayItem.h"

@interface CPBaseDisplayItem ()

@property (nonatomic, copy) NSString *__id;
@property (nonatomic, copy) id sectionKey;

@end

@implementation CPBaseDisplayItem

- (instancetype)displayItemWithIdentifier:(NSString *)identifier andSectionKey:(id _Nonnull)sectionKey {
    id displayItem = [self init];
    if (displayItem) {
        [displayItem set__id:identifier];
        [displayItem setSectionKey:sectionKey];
    }
    
    return displayItem;
}

- (BOOL)isEqualToDisplayItem:(CPBaseDisplayItem *)item {
    if (!item) {
        return NO;
    }
    
    BOOL hasEqualId = [self.__id isEqualToString:item.__id];
    BOOL hasEqualSectionKey = [self.sectionKey isEqual:item.sectionKey];
    
    return hasEqualId && hasEqualSectionKey;
}

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[CPBaseDisplayItem class]]) {
        return NO;
    }
    
    return [self isEqualToDisplayItem:object];
}

- (NSUInteger)hash {
    return [self.sectionKey hash] ^ [self.__id hash];
}

@end
