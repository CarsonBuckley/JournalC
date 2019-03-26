//
//  Entry.m
//  JournalC
//
//  Created by Carson Buckley on 3/25/19.
//  Copyright © 2019 Launch. All rights reserved.
//

#import "CMBEntry.h"

@implementation CMBEntry

-(instancetype)initWithTitle:(NSString *)title body:(NSString *)body timestamp:(NSDate *)timestamp
{
    //[super init] == super.init()
    self = [super init];
    if (self) {
        _title = title;
        _body = body;
        _timestamp = timestamp;
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSString *body = dictionary[@"body"];
    NSDate *timestamp = dictionary[@"timestamp"];
    return [self initWithTitle:title body:body timestamp:timestamp];
}

//MARK: - Helpers
-(NSDictionary *)dictionaryRespresentation
{
    return @{
             @"title": self.title,
             @"body": self.body,
             @"timestamp": self.timestamp
             };
}

@end
