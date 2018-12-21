//
//  CPStoryboardUtility.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/11/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPStoryboardUtility.h"

@implementation CPStoryboardUtility

+ (UIStoryboard *)mainStoryboard {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    return storyBoard;
}

+ (UIViewController *)getViewController:(Class)viewControllerClass {
    NSString *vcName = NSStringFromClass(viewControllerClass);
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:vcName bundle:[NSBundle mainBundle]];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:vcName];
    
    return vc;
}

@end
