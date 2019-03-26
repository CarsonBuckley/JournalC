//
//  CMBEntryController.h
//  JournalC
//
//  Created by Carson Buckley on 3/25/19.
//  Copyright © 2019 Launch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMBEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface CMBEntryController : NSObject

//Shared Instance
+ (CMBEntryController *)sharedController;

//Source of Truth
@property (nonatomic, strong) NSMutableArray<CMBEntry *> *entries;

//Static Properties - Only in the .m File
-(void)saveToPersistentStorage;
-(void)loadFromPersistentStorage;
-(void)addEntry:(CMBEntry *)entry;
-(void)removeEntry:(CMBEntry *)entry;
-(void)modifyEntry:(CMBEntry *)entry withTitle:(NSString *)title body:(NSString *)body;

@end

NS_ASSUME_NONNULL_END
