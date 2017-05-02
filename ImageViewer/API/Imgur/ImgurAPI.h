//
//  ImgurAPI.h
//  ImageViewer
//
//  Created by Wilson Oliveira on 02/05/2017.
//  Copyright © 2017 wso277. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIWrapper.h"

#define IMGUR_CLIENT_ID @"d36cf904b72332d"
#define IMGUR_CLIENT_SECRET @"5365fef45c918b9b50eb2bd4ea1a6c253db0d3b1"

#define IMGUR_URL @"https://api.imgur.com/"

@interface ImgurAPI : NSObject <APIProtocol>

-(NSURL*)getOauthURL;

@end
