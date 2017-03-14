//
//  Entry.h
//  JournalObjectiveC5
//
//  Created by Nick Reichard on 3/13/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entry : NSObject

// Why is it strong vs copy? 
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *entryBody;
@property(nonatomic, strong) NSDate *timestamp;

@property (strong, nonatomic) NSDictionary *dictionaryCopy;

-(instancetype)initWithTitle:(NSString *)title entryBody:(NSString *)entryBody timestamp:(NSDate *)timestamp;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end
