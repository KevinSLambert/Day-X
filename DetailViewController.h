//
//  DetailViewController.h
//  DayX
//
//  Created by Kevin Lambert on 1/13/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Entry;//What does this do?

static NSString * const EntryKey = @"entry";

@interface DetailViewController : UIViewController

- (void)updateWithEntry:(Entry *)entry;

@end
