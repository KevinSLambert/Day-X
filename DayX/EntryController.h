//
//  EntryController.h
//  DayX
//
//  Created by Kevin Lambert on 1/17/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface EntryController : NSObject

@property (nonatomic, readonly, strong) NSArray *entries;

+ (EntryController *)sharedInstance;

- (void)replaceEntry:(Entry *)oldEntry withEntry:(Entry *)newEntry;
- (void)removeEntry:(Entry *)entry;
- (void)addEntry:(Entry *)entry;


@end
