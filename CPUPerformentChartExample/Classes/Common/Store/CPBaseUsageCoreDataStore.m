//
//  CPBaseUsageCoreDataStore.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/18/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPBaseUsageCoreDataStore.h"
#import "CPManagedBaseUsageItem.h"

@interface CPBaseUsageCoreDataStore ()

@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation CPBaseUsageCoreDataStore

+ (NSString *)dataStoreName {
    return @"";
}

+ (NSString *)entryUsageName {
    return @"";
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:@[[NSBundle bundleForClass:[self class]]]];
        
        self.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        
        [self configStore];
    }
    return self;
}

- (void)configStore {
    NSString *dataStoreName = [[self class] dataStoreName];
    if (dataStoreName.length == 0) {
        [NSException raise:@"Invalid dataStoreName" format:@"Here is not implement [%@ dataStoreName]", NSStringFromClass([self class])];
    }
    else {
        [self configStore:dataStoreName];
    }
}

- (void)configStore:(NSString *)storeName {
    NSString *fileStoreName = [NSString stringWithFormat:@"%@.sqlite", storeName];
    NSError *error = nil;
    NSURL *applicationDocumentsDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                             [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
    NSURL *storeURL = [applicationDocumentsDirectory URLByAppendingPathComponent:fileStoreName];
    
    [self.persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                  configuration:nil
                                                            URL:storeURL
                                                        options:options error:&error];
    
    self.managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    self.managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
    self.managedObjectContext.undoManager = nil;
}

- (void)fetchAllEntriesCompeletion:(void (^)(NSArray<CPManagedBaseUsageItem *> * _Nonnull results))completion {
    NSString *entryUsageName = [[self class] entryUsageName];
    if (entryUsageName.length == 0) {
        [NSException raise:@"Invalid entryUsageName" format:@"fetchAllEntriesCompeletion is not implement [%@ entryUsageName]", NSStringFromClass([self class])];
        if (completion) {
            NSArray<CPManagedBaseUsageItem *> * results = [NSArray<CPManagedBaseUsageItem *> new];
            completion(results);
        }
    }
    else {
        [self fetchAllEntries:entryUsageName
              withCompeletion:^(NSArray<CPManagedBaseUsageItem *> * _Nonnull results) {
                  if (completion) {
                      completion(results);
                  }
              }];
    }
}

- (void)fetchAllEntries:(NSString * _Nonnull)entryUsageName
        withCompeletion:(void (^)(NSArray<CPManagedBaseUsageItem *> * _Nonnull results))completion {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:entryUsageName];
    //    [fetchRequest setPredicate:predicate];
    [fetchRequest setSortDescriptors:nil];
    
    [self.managedObjectContext performBlock:^{
        NSArray *results = [self.managedObjectContext executeFetchRequest:fetchRequest error:NULL];
        if (completion) {
            completion(results);
        }
    }];
}

- (CPManagedBaseUsageItem *)newEntry {
    CPManagedBaseUsageItem *newEntry = nil;
    NSString *entryUsageName = [[self class] entryUsageName];
    if (entryUsageName.length == 0) {
        [NSException raise:@"Invalid entryUsageName" format:@"newEntry is not implement [%@ entryUsageName]", NSStringFromClass([self class])];
    }
    else {
        newEntry = [self newEntryWithEntryUsageName:entryUsageName];
    }
    
    return newEntry;
}

- (CPManagedBaseUsageItem *)newEntryWithEntryUsageName:(NSString * _Nonnull)entryUsageName {
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:entryUsageName
                                                         inManagedObjectContext:self.managedObjectContext];
     CPManagedBaseUsageItem *newEntry = (CPManagedBaseUsageItem *)[[NSManagedObject alloc]
                                                                                    initWithEntity:entityDescription
                                                                    insertIntoManagedObjectContext:self.managedObjectContext];
    
    return newEntry;
}

- (void)save {
    [self.managedObjectContext save:NULL];
}

@end
