//
//  ViewControllerInterface.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/10/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#ifndef ViewControllerInterface_h
#define ViewControllerInterface_h

@protocol ViewControllerInterface <NSObject>

- (void)showChartsList:(NSArray<NSString *> *)chartsList;
- (void)showNoContentMessage;
- (void)reloadEntries;

@end

#endif /* ViewControllerInterface_h */
