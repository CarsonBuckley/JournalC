//
//  EntryDetailViewController.h
//  JournalC
//
//  Created by Carson Buckley on 3/25/19.
//  Copyright © 2019 Launch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMBEntryController.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntryDetailViewController : UIViewController

@property (nonatomic, strong) CMBEntry *entry;

@end

NS_ASSUME_NONNULL_END
