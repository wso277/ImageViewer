//
//  ImageSourcesModel.m
//  ImageViewer
//
//  Created by Wilson Oliveira on 03/05/2017.
//  Copyright © 2017 wso277. All rights reserved.
//

#import "ImageSourcesModel.h"

@implementation ImageSourcesModel

+(void)saveImageSrcForImgur:(NSDictionary *)params
{
    NSManagedObjectContext *writer = [[ModelManager sharedInstance] getWriterContext];
    
    [writer performBlockAndWait:^{
        ImageSources *src = [NSEntityDescription insertNewObjectForEntityForName:@"ImageSources" inManagedObjectContext:writer];
        
        [src setName:@"Imgur"];
        [src setAccount_id:[params objectForKey:@"account_id"]];
        [src setAccess_token:[params objectForKey:@"access_token"]];
        [src setRefresh_token:[params objectForKey:@"refresh_token"]];
        [src setAccount_username:[params objectForKey:@"account_username"]];
        
        [[ModelManager sharedInstance] saveAndWait];
    
    }];
}

+(void)getAllImageSrc
{
    NSManagedObjectContext *context = [[ModelManager sharedInstance] getMainContext];
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"ImageSources"];
    
    NSError *error = nil;
    NSArray *results = [context executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching Employee objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }

}

@end
