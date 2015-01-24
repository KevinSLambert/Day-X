//
//  ListViewController.m
//  DayX
//
//  Created by Kevin Lambert on 1/16/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ListViewController.h"
#import "DetailViewController.h"
#import "ListTableViewDataSource.h"
#import "EntryController.h"

@interface ListViewController () <UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ListTableViewDataSource *dataSource;

@end

@implementation ListViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    self.dataSource = [ListTableViewDataSource new];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;

    [self.dataSource registerTableView:self.tableView];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailViewController *detailViewController = [DetailViewController new];
    [detailViewController updateWithEntry:[EntryController sharedInstance].entries[indexPath.row]];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)add:(id)sender {
    
    DetailViewController *detailViewController = [DetailViewController new];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
