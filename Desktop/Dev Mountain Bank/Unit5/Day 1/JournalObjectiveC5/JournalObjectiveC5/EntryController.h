//
//  EntryController.h
//  JournalObjectiveC5
//
//  Created by Nick Reichard on 3/13/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface EntryController : NSObject

@property (nonatomic, copy) NSArray *entries;
//- (instancetype)init; //?

-(void)addEntry:(Entry *)entry;
-(void)removeEntry:(Entry *)entry;

+(EntryController *)shared;

- (instancetype)init;

@end
