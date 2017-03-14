//
//  EntryController.m
//  JournalObjectiveC5
//
//  Created by Nick Reichard on 3/13/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

#import "EntryController.h"

static NSString * const EntriesKey = @"entries";

@interface EntryController ()

@property(nonatomic, strong)NSMutableArray *internalEntries;

@end

@implementation EntryController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalEntries = [[NSMutableArray alloc] init];
    }
    return self;
}

+(EntryController *)shared
{
    static EntryController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [EntryController new];
        [shared loadFromPersistentStore];
        
    });
    return shared;
}

- (void)addEntry:(Entry *)entry
{
    [self.internalEntries addObject:entry];
    [self saveToPersistentStorage];
}

- (void)removeEntry:(Entry *)entry
{
    [self.internalEntries removeObject:entry];
    [self saveToPersistentStorage];
}

- (void)saveToPersistentStorage {
    // take self.entries, convert entries to dictionaries, save dictionaries to NSUserDefaults, synchronize NSuserdefaults
    
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (Entry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryCopy];
    }
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:EntriesKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)loadFromPersistentStore {
    // pull dictionaries from NSUserDefaults, conver to Entries, and set self.entries
    NSMutableArray *entries = [NSMutableArray new];
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:EntriesKey];
    
    for (NSDictionary *dictionary in entryDictionaries) {
        Entry *entry = [[Entry alloc] initWithDictionary:dictionary];
        [entries addObject:entry];
    }
    self.internalEntries = entries;
}

// Sets it
- (NSArray *)entries
{
    return self.internalEntries;
}


@end
