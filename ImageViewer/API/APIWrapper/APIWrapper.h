//
//  APIWrapper.h
//  ImageViewer
//
//  Created by Wilson Oliveira on 02/05/2017.
//  Copyright © 2017 wso277. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SchemaType) {
    IMGUR_SCHEMA
};

@protocol APIProtocol <NSObject>
@required
-(NSURL*)getOauthURL;
@end

//@interface APIWrapper : NSObject <APIProtocol>

//@end
