//
//  CSShadeAndPullCtl.m
//  NavigationDemo
//
//  Created by Joslyn wu on 2016/12/26.
//  Copyright © 2016年 joslyn. All rights reserved.
//

#import "CSShadeAndPullCtl.h"
#import "CSNavigationView.h"

#define kHeaderHeight (250)

static NSString *deqIdentifier = @"CSShadeAndPullCtlCell";

@interface CSShadeAndPullCtl () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIImageView *headerImgView;
@property (nonatomic, strong) UIView *linesView;
@property (nonatomic, assign) UIStatusBarStyle statusStyle;
@property (nonatomic, strong) CSNavigationView *navView;

@end

@implementation CSShadeAndPullCtl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self stepUI];
    _statusStyle = UIStatusBarStyleLightContent;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.automaticallyAdjustsScrollViewInsets = NO;             //取消自动偏移
    
    [self.navigationController setNavigationBarHidden:YES];
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return self.statusStyle;
}

-(void)stepUI {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:deqIdentifier];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    
    //top view
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, kHeaderHeight)];
    _headerView.backgroundColor = [UIColor cs_colorWithHex:0xF9F9F9];
    [self.view addSubview:self.headerView];
    
    //navigation bar
    _navView = [CSNavigationView new];
    [self.view addSubview:_navView];
    _navView.titleLabel.text = @"OuterSpace";
    _navView.titleLabel.textColor = [UIColor whiteColor];
    typeof(self) weakSelf = self;
    _navView.leftItemBlock = ^(){
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    
    // header image view
    _headerImgView = [[UIImageView alloc] initWithFrame:self.headerView.bounds];
    _headerImgView.contentMode = UIViewContentModeScaleAspectFill;
    _headerImgView.clipsToBounds = YES;
    _headerImgView.backgroundColor = [UIColor brownColor];
    _headerImgView.image = [UIImage imageNamed:@"outer_space"];
    
    [self.headerView addSubview:_headerImgView];
    
    self.tableView.contentInset             = UIEdgeInsetsMake(kHeaderHeight, 0, 0, 0);
    self.tableView.scrollIndicatorInsets    = self.tableView.contentInset;              //指示器的inset
    
    //separate
    CGFloat lines_h = 1 / [UIScreen mainScreen].scale;
    self.linesView = [[UIView alloc] initWithFrame:CGRectMake(0, kHeaderHeight - lines_h, _headerView.width, lines_h)];
    self.linesView.backgroundColor = [UIColor cs_colorWithHex:0xD9D8D9];
    [self.headerView addSubview:_linesView];
}

#pragma mark    ==
#pragma mark    UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:deqIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row];
    
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offset = scrollView.contentOffset.y + scrollView.contentInset.top;
    
    if (offset <= 0) {
        self.headerImgView.alpha = 1;
        self.headerView.top = 0;
        self.headerView.height = kHeaderHeight - offset;
        self.headerImgView.height = self.headerView.height;
        self.linesView.top = self.headerView.height - _linesView.height;
    }else {
        CGFloat min = kHeaderHeight - 64;
        self.headerView.top = -MIN(min, offset);
        CGFloat prograss = 1 - (offset/min);
        self.headerImgView.alpha = prograss;
        self.statusStyle = (prograss < 0.5) ? UIStatusBarStyleDefault : UIStatusBarStyleLightContent;
        [self.navigationController setNeedsStatusBarAppearanceUpdate];
        self.navView.titleLabel.textColor = (prograss < 0.5) ? [UIColor blackColor] : [UIColor whiteColor];
    }
    
}

@end
