//
//  ModelManager.h
//  ImageViewer
//
//  Created by Wilson Oliveira on 03/05/2017.
//  Copyright © 2017 wso277. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface ModelManager : NSObject

@property (strong, nonatomic) NSManagedObjectContext *mainContext;
@property (strong, nonatomic) NSManagedObjectContext *writerContext;

+(instancetype)sharedInstanceWithContext:(NSManagedObjectContext*)context;
+(instancetype)sharedInstance;

-(NSManagedObjectContext*)getWriterContext;
-(NSManagedObjectContext*)getMainContext;
-(void)saveAndWait;

@end
