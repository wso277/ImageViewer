//
//  OauthViewPresenter.h
//  ImageViewer
//
//  Created by Wilson Oliveira on 02/05/2017.
//  Copyright © 2017 wso277. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SafariServices/SafariServices.h>
#import "APIWrapper.h"
#import "ImgurAPI.h"

@interface NetworkWrapper : NSObject <SFSafariViewControllerDelegate>

@property (strong, nonatomic) ImgurAPI *imgur;
@property (strong, nonatomic) id<APIProtocol> wrapper;

+(instancetype)sharedInstanceWithSchema:(SchemaType) schema;

-(void)presentOauthControllerInViewController:(UIViewController *)viewController;

@end
