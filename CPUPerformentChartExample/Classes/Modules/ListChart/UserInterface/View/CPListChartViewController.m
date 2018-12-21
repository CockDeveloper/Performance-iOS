//
//  CPListChartViewController.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/11/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPListChartViewController.h"
#import "CPListChartPresenter.h"
#import "CPBaseDisplayData.h"
#import "CPBaseDisplaySection.h"
#import "CPListChartDisplayItem.h"

@interface CPListChartViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UIView *emptyView;
@property (strong, nonatomic) IBOutlet UIView *listChartView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property CPBaseDisplayData *dataList;

@end

@implementation CPListChartViewController

static NSString * const CellIdentifier = @"CPCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.eventHandler updateView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    CPBaseDisplaySection *displaySection = self.dataList.sections[indexPath.section];
    CPListChartDisplayItem *displayItem = (CPListChartDisplayItem *)(displaySection.items[indexPath.row]);
    
    NSString *nameCell = displayItem.name;
    [cell.textLabel setText:nameCell];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CPBaseDisplaySection *displaySection = self.dataList.sections[section];
    return [displaySection.items count];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CPBaseDisplaySection *displaySection = self.dataList.sections[indexPath.section];
    CPListChartDisplayItem *displayItem = (CPListChartDisplayItem *)(displaySection.items[indexPath.row]);

    [self.eventHandler selectedChartItem:displayItem];
}

#pragma mark - CPListChartViewInterface
- (void)showNoContentMessage {
    self.view = self.emptyView;//self.noContentView;
}

- (void)showChartsList:(CPBaseDisplayData *)chartsList {
//    dispatch_async(dispatch_get_main_queue(), ^{
//        <#code#>
//    })
    
    self.dataList = chartsList;
    self.view = self.listChartView;
    [self reloadEntries];
}

- (void)reloadEntries {
    [self.tableView reloadData];
}

@end
