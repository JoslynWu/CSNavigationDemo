//
//  ViewController.m
//  NavigationDemo
//
//  Created by Joslyn wu on 2016/12/26.
//  Copyright © 2016年 joslyn. All rights reserved.
//

#import "ViewController.h"
#import "CSShadeAndPullCtl.h"
#import "CSDefaultCtl.h"
#import "CSCustomShareCtl.h"

static NSString *homeCellId = @"homeCell";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSDictionary *dataDict;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _dataDict = @{@(NavigationBarTypeSystemDefault)         :   @"System default",
                  @(NavigationBarTypeSystemConfig)          :   @"System + 调整",
                  @(NavigationBarTypeCustomShade)           :   @"Custom + 渐变",
                  @(NavigationBarTypeCustomShadeAndPull)    :   @"Custom +   渐变 + 拉伸"
                  };
    
    self.navigationItem.title = @"Joslyn";

    [self setupUI];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.barTintColor = nil;
}

-(void)setupUI {
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:homeCellId];
    
    [self.view addSubview:_tableView];
}

#pragma mark  -  UITableView delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataDict.count + 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:homeCellId forIndexPath:indexPath];
    
    if (indexPath.row < self.dataDict.count) {
        
        cell.textLabel.text = [self.dataDict objectForKey:@(indexPath.row)];
    }else {
        
        cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row - self.dataDict.count];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case NavigationBarTypeSystemDefault:
        {
            CSDefaultCtl *vc = [[CSDefaultCtl alloc] initWithType:NavigationBarTypeSystemDefault];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case NavigationBarTypeSystemConfig:
        {
            CSDefaultCtl *vc = [[CSDefaultCtl alloc] initWithType:NavigationBarTypeSystemConfig];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case NavigationBarTypeCustomShade:
            
            [self.navigationController pushViewController:[CSCustomShareCtl new] animated:YES];
            break;
            
        case NavigationBarTypeCustomShadeAndPull:
            
            [self.navigationController pushViewController:[CSShadeAndPullCtl new] animated:YES];
            
            break;
            
        default:
            break;
    }
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    });
}

@end
