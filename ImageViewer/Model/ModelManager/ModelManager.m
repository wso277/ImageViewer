//
//  ModelManager.m
//  ImageViewer
//
//  Created by Wilson Oliveira on 03/05/2017.
//  Copyright © 2017 wso277. All rights reserved.
//

#import "ModelManager.h"

@implementation ModelManager

+(instancetype)sharedInstanceWithContext:(NSManagedObjectContext*)context
{
    [ModelManager sharedInstance].mainContext = context;
    return [ModelManager sharedInstance];
}

+(instancetype)sharedInstance
{
    static dispatch_once_t once;
    static ModelManager *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [self alloc];
    });
    return sharedInstance;
}

-(NSManagedObjectContext*)getWriterContext
{
    if (self.writerContext) {
        return self.writerContext;
    }
    
    self.writerContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    self.writerContext.parentContext = self.mainContext;
    
    return self.writerContext;
}

-(void)saveAndWait
{
    __block NSError *error = nil;

    [self.mainContext performBlockAndWait:^{
        [self.mainContext save:&error];
        
        [self.writerContext performBlockAndWait:^{
            [self.writerContext save:&error];
        }];
    }];
    
    if (error) {
        NSLog(@"Error saving context");
    }
}

@end
