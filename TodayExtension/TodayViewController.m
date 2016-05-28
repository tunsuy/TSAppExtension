//
//  TodayViewController.m
//  TodayExtension
//
//  Created by tunsuy on 10/5/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.preferredContentSize = CGSizeMake(0, 100);
    
    UIButton *vcBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, (self.preferredContentSize.height-30)/2, self.view.bounds.size.width-60, 30)];
    vcBtn.layer.cornerRadius = 15;
    vcBtn.backgroundColor = [UIColor orangeColor];
    [vcBtn setTitle:@"进入主界面" forState:UIControlStateNormal];
    [vcBtn addTarget:self action:@selector(vcBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:vcBtn];

}

- (void)vcBtnClick:(UIButton *)sender {
    [self.extensionContext openURL:[NSURL URLWithString:@"com.sangfor.TSAppExtension://mainVC"]
                 completionHandler:^(BOOL success){
                     NSLog(@"Result is %d", success);
                 }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    return UIEdgeInsetsZero;
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
