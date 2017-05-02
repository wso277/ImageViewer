//
//  ImgurAPI.m
//  ImageViewer
//
//  Created by Wilson Oliveira on 02/05/2017.
//  Copyright © 2017 wso277. All rights reserved.
//

#import "ImgurAPI.h"

@implementation ImgurAPI

-(NSString*)getOauthString
{
    return [IMGUR_URL stringByAppendingString:@"/oauth2/authorize?client_id=CLIENT_ID&response_type=token&state=IMGVIEWER_LOGIN"];
}

-(NSURL *)getOauthURL
{
    NSString *urlStr = [[self getOauthString] stringByReplacingOccurrencesOfString:@"CLIENT_ID" withString:IMGUR_CLIENT_ID];
    
    return [NSURL URLWithString:urlStr];
}

@end
