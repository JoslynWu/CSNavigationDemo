//
//  CSCustomShareCtl.m
//  NavigationDemo
//
//  Created by Joslyn wu on 2016/12/29.
//  Copyright © 2016年 joslyn. All rights reserved.
//

#import "CSCustomShareCtl.h"
#import "CSNavigationView.h"
#import "CSDefaultCtl.h"

#define kHeaderHeight (375)

static NSString *deqIdentifier = @"CSCustomShareCtlCell";

@interface CSCustomShareCtl () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) CSNavigationView *navView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *headerImgView;

@end

@implementation CSCustomShareCtl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self stepUI];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.automaticallyAdjustsScrollViewInsets = NO;             //取消自动偏移
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

-(void)stepUI {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:deqIdentifier];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    
    //header view
    _headerImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, kHeaderHeight)];
    _headerImgView.contentMode = UIViewContentModeScaleAspectFill;
    _headerImgView.clipsToBounds = YES;
    _headerImgView.backgroundColor = [UIColor whiteColor];
    _headerImgView.image = [UIImage imageNamed:@"ant_bg"];
    
    self.tableView.tableHeaderView = _headerImgView;
    
    //custom navigation View
    _navView = [[CSNavigationView alloc] init];
    [self.view addSubview:_navView];
    typeof(self) weakSelf = self;
    _navView.leftItemBlock = ^(){
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
}

#pragma mark    ==
#pragma mark    UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:deqIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Custom shade %zd",indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CSDefaultCtl *vc = [CSDefaultCtl new];
    vc.navBarType = NavigationBarTypeSystemConfig;
    [self.navigationController pushViewController:vc animated:YES];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    });
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offset = scrollView.contentOffset.y;
    if (offset < 0) {
        self.tableView.scrollEnabled = NO;
    }else {
        self.tableView.scrollEnabled = YES;
        CGFloat min = kHeaderHeight - 64;
        offset = MIN(min, offset);
        CGFloat prograss = offset / min;
        self.navView.backgroundColor = [UIColor cs_colorWithHex:0xF9F9F9 alpha:prograss];
        self.navView.separateView.backgroundColor = [UIColor cs_colorWithHex:0xD9D8D9 alpha:prograss];
        self.navView.titleLabel.textColor = (prograss > 0.5) ? [UIColor blackColor] : kDefaultColor;
    }
    
}

@end
