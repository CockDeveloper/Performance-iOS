//
//  CPChartGPUUsageViewController.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartGPUUsageViewController.h"
#import "CPChartGPUUsageModuleInterface.h"
#import "CPDateValueFormatter.h"

@interface CPChartGPUUsageViewController ()
@property (strong, nonatomic) IBOutlet UIView *noContentView;
@property (strong, nonatomic) IBOutlet UIView *dataContentView;
@property (weak, atomic) IBOutlet LineChartView *chartView;

@end

@implementation CPChartGPUUsageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupChart];
    self.view = self.dataContentView;
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

- (void)showChartData:(NSArray<ChartDataEntry *> *)dataList {
    NSLog(@"%@ IN - count=%@", NSStringFromSelector(_cmd), @(dataList.count));
    // TODO: showChartData
    LineChartDataSet *set1 = nil;
    NSMutableArray *values = [NSMutableArray arrayWithArray:dataList];
    if (self.chartView.data.dataSetCount > 0)
    {
        [self.chartView.data clearValues];
        [self addListData:values intoChartView:self.chartView];
    }
    else
    {
        set1 = [[LineChartDataSet alloc] initWithValues:values label:@"DataSet 1"];
        set1.axisDependency = AxisDependencyLeft;
        set1.valueTextColor = [UIColor colorWithRed:51/255.0 green:181/255.0 blue:229/255.0 alpha:1.0];
        set1.lineWidth = 1.5;
        set1.drawCirclesEnabled = NO;
        set1.drawValuesEnabled = NO;
        set1.fillAlpha = 0.26;
        set1.fillColor = [UIColor colorWithRed:51/255.0 green:181/255.0 blue:229/255.0 alpha:1.0];
        set1.highlightColor = [UIColor colorWithRed:224/255.0 green:117/255.0 blue:117/255.0 alpha:1.0];
        set1.drawCircleHoleEnabled = NO;
        
        NSMutableArray *dataSets = [[NSMutableArray alloc] init];
        [dataSets addObject:set1];
        
        LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
        [data setValueTextColor:UIColor.whiteColor];
        [data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:9.0]];
        
        self.chartView.data = data;
    }
//    dispatch_async(dispatch_get_main_queue(), ^{
        self.view = self.dataContentView;
//    });
    [self reloadEntries];
}

- (void)showNoContentMessage {
    self.chartView.data = nil;
    self.view = self.noContentView;
//    [self.chartView removeFromSuperview];
}

- (void)appendChartData:(ChartDataEntry *)data {
    if (self.chartView.data.dataSetCount > 0) {
        [self addListData:@[data] intoChartView:self.chartView];
    }
}

- (void)addListData:(NSArray<ChartDataEntry *> *)dataList intoChartView:(ChartViewBase *)chartView {
    LineChartDataSet *set1 = (LineChartDataSet *)chartView.data.dataSets[0];
    NSMutableArray *tmpValues = [set1.values mutableCopy];
    [tmpValues addObjectsFromArray:dataList];
    set1.values = tmpValues;
    [self.chartView.data notifyDataChanged];
    //        dispatch_async(dispatch_get_main_queue(), ^{
    [self.chartView notifyDataSetChanged];
    //        });
}

- (void)reloadEntries {
    // TODO: reload data
//    [UIView animateWithDuration:(NSTimeInterval) animations:^{
//        //
//    } completion:^(BOOL finished) {
//        //
//    }];
}

- (void)setupChart {
//    self.chartView.chartDescription.enabled = NO;
    ChartXAxis *xAxis = self.chartView.xAxis;
    xAxis.labelPosition = XAxisLabelPositionTopInside;
    xAxis.labelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:10.f];
    xAxis.labelTextColor = [UIColor colorWithRed:255/255.0 green:192/255.0 blue:56/255.0 alpha:1.0];
    xAxis.drawAxisLineEnabled = NO;
    xAxis.drawGridLinesEnabled = YES;
    xAxis.centerAxisLabelsEnabled = YES;
    xAxis.granularity = 30.0;
    xAxis.valueFormatter = [CPDateValueFormatter new];
    
//    ChartYAxis *leftAxis = self.chartView.leftAxis;
//    leftAxis.labelPosition = YAxisLabelPositionInsideChart;
//    leftAxis.labelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:12.f];
//    leftAxis.labelTextColor = [UIColor colorWithRed:51/255.0 green:181/255.0 blue:229/255.0 alpha:1.0];
//    leftAxis.drawGridLinesEnabled = YES;
//    leftAxis.granularityEnabled = YES;
//    leftAxis.axisMinimum = 0.0;
//    leftAxis.axisMaximum = 170.0;
//    leftAxis.yOffset = -9.0;
//    leftAxis.labelTextColor = [UIColor colorWithRed:255/255.0 green:192/255.0 blue:56/255.0 alpha:1.0];
}


@end
