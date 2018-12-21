//
//  CPBaseUsageCoreDataStore.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/18/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class CPManagedBaseUsageItem;

@interface CPBaseUsageCoreDataStore : NSObject

@property (nonatomic, strong, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong, readonly) NSManagedObjectContext *managedObjectContext;

+ (NSString *)dataStoreName;
+ (NSString *)entryUsageName;
- (void)fetchAllEntriesCompeletion:(void (^)(NSArray<CPManagedBaseUsageItem *> * _Nonnull results))completion;
- (CPManagedBaseUsageItem *)newEntry;
- (void)save;

@end

NS_ASSUME_NONNULL_END
