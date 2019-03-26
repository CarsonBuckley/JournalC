//
//  CMBEntryController.m
//  JournalC
//
//  Created by Carson Buckley on 3/25/19.
//  Copyright © 2019 Launch. All rights reserved.
//

#import "CMBEntryController.h"

@implementation CMBEntryController

//Shared Instance
+ (CMBEntryController *)sharedController
{
    static CMBEntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CMBEntryController alloc] init];
        sharedInstance.entries = [NSMutableArray new];
        [sharedInstance loadFromPersistentStorage];
    });
    return sharedInstance;
}

- (void)saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (CMBEntry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryRespresentation];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:@"Entries"];
}

-(void)loadFromPersistentStorage
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:@"Entries"];
    for (NSDictionary *dictionary in entryDictionaries) {
        CMBEntry *entry = [[CMBEntry new] initWithDictionary:dictionary];
        [self addEntry:entry];
    }
}

-(void)addEntry:(CMBEntry *)entry
{
    [self.entries addObject:entry];
    [self saveToPersistentStorage];
}

-(void)removeEntry:(CMBEntry *)entry
{
    [self.entries removeObject:entry];
    [self saveToPersistentStorage];
}

-(void)modifyEntry:(CMBEntry *)entry withTitle:(NSString *)title body:(NSString *)body
{
    entry.title = title;
    entry.body = body;
    [self saveToPersistentStorage];
}

@end
