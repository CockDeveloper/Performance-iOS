//
//  CPChartCPUUsageCoreDataStore.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/14/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartCPUUsageCoreDataStore.h"
#import "CPManagedCPUUsageItem.h"

@implementation CPChartCPUUsageCoreDataStore

+ (NSString *)dataStoreName {
    return [CPManagedCPUUsageItem kEntryFileNameUsage];
}

+ (NSString *)entryUsageName {
    return [CPManagedCPUUsageItem kEntryNameUsage];
}

//- (void)configStore {
//    NSError *error = nil;
//    NSURL *applicationDocumentsDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
//    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
//                             [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
//                             [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
//    NSURL *storeURL = [applicationDocumentsDirectory URLByAppendingPathComponent:@"CPUHistory.sqlite"];
//
//    [self.persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
//                                                  configuration:nil
//                                                            URL:storeURL
//                                                        options:options error:&error];
//
//    self.managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
//    self.managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
//    self.managedObjectContext.undoManager = nil;
//}
//
//- (void)fetchAllEntriesCompeletion:(void (^)(NSArray<CPManagedCPUUsageItem *> * _Nonnull results))completion {
//    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:kEntryNameCPUUsage];
////    [fetchRequest setPredicate:predicate];
//    [fetchRequest setSortDescriptors:nil];
//
//    [self.managedObjectContext performBlock:^{
//        NSArray *results = [self.managedObjectContext executeFetchRequest:fetchRequest error:NULL];
//
//        if (completion) {
//            completion(results);
//        }
//    }];
//
//}
//
//- (CPManagedCPUUsageItem *)newEntry {
//    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:kEntryNameCPUUsage
//                                                         inManagedObjectContext:self.managedObjectContext];
//    CPManagedCPUUsageItem *newEntry = (CPManagedCPUUsageItem *)[[NSManagedObject alloc]
//                                                                            initWithEntity:entityDescription
//                                                            insertIntoManagedObjectContext:self.managedObjectContext];
//
//    return newEntry;
//}
//
//- (void)save {
//    [self.managedObjectContext save:NULL];
//}

@end
