//
//  Entry.m
//  JournalObjectiveC5
//
//  Created by Nick Reichard on 3/13/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

#import "Entry.h"

static NSString * const TitleKey = @"title";
static NSString * const TextKey = @"body";
static NSString * const TimestampKey = @"timestamp";

@implementation Entry


- (instancetype)initWithTitle:(NSString *)title entryBody:(NSString *)entryBody timestamp:(NSDate *)timestamp
{
    self = [self init];
    if (self) {
        _title = title;
        _entryBody = entryBody;
        _timestamp = [[NSDate alloc] init];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _title = dictionary[TitleKey];
        _entryBody = dictionary[TextKey];
        _timestamp = dictionary[TimestampKey];
    }
    return self;
}

// Dictionary Representation -- 
- (NSDictionary *)dictionaryCopy {
    
    return  @{
              @"title": self.title,
              @"body": self.entryBody,
              @"timestamp": self.timestamp
              };
}

@end
