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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissSafari) name:ADD_ACCOUNT_NOTIFICATION object:nil];
    
    self.webview = [[SFSafariViewController alloc] initWithURL:url];
    
    [viewController presentViewController:self.webview animated:YES completion:nil];
}

//NOTIFICATION

-(void)dismissSafari
{
    [self.webview dismissViewControllerAnimated:YES completion:nil];
}

//DELEGATE

-(void)safariViewControllerDidFinish:(SFSafariViewController *)controller
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ADD_ACCOUNT_NOTIFICATION object:nil];
}

@end
