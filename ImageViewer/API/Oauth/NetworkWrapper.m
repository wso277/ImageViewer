//
//  OauthViewPresenter.m
//  ImageViewer
//
//  Created by Wilson Oliveira on 02/05/2017.
//  Copyright © 2017 wso277. All rights reserved.
//

#import "NetworkWrapper.h"

@implementation NetworkWrapper

-(void)setSchema:(SchemaType) schema
{
    switch (schema) {
        case IMGUR_SCHEMA:
            if (self.imgur) {
                self.wrapper = self.imgur;
            } else {
                self.imgur = [ImgurAPI alloc];
                self.wrapper = self.imgur;
            }
            break;
            
        default:
            break;
    }
}

+(instancetype)sharedInstanceWithSchema:(SchemaType)schema
{
    static dispatch_once_t once;
    static NetworkWrapper *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [self alloc];
        [sharedInstance setSchema:schema];
    });
    return sharedInstance;
}

-(void)presentOauthControllerInViewController:(UIViewController *)viewController
{
    NSURL *url = [self.wrapper getOauthURL];
    
    SFSafariViewController *safari = [[SFSafariViewController alloc] initWithURL:url];
    
    [viewController presentViewController:safari animated:YES completion:nil];
}

//DELEGATE

@end
