//
//  ListTableViewDataSource.m
//  DayX
//
//  Created by Kevin Lambert on 1/16/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ListTableViewDataSource.h"
#import "EntryController.h"

@implementation ListTableViewDataSource

- (void)registerTableView:(UITableView *)tableView {
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray *entries = [Entry loadEntriesFromDefaults];
    return entries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    
    Entry *entry = [EntryController sharedInstance].entries[indexPath.row];
    cell.textLabel.text = entry.title;
    
    return cell;
}

@end
