//
//  ImageSourcesModel.h
//  ImageViewer
//
//  Created by Wilson Oliveira on 03/05/2017.
//  Copyright © 2017 wso277. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageViewer+CoreDataModel.h"
#import "ModelManager.h"

@interface ImageSourcesModel : NSObject

+(void)saveImageSrcForImgur:(NSDictionary*)params;

@end
