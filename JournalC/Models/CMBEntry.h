//
//  Entry.h
//  JournalC
//
//  Created by Carson Buckley on 3/25/19.
//  Copyright © 2019 Launch. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CMBEntry : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) NSDate *timestamp;

- (instancetype)initWithTitle:(NSString *)title body:(NSString *)body timestamp:(NSDate *)timestamp;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

//MARK: - Helpers
-(NSDictionary *)dictionaryRespresentation;

@end

NS_ASSUME_NONNULL_END
