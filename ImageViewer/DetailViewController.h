//
//  DetailViewController.h
//  ImageViewer
//
//  Created by Wilson Oliveira on 02/05/2017.
//  Copyright © 2017 wso277. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageViewer+CoreDataModel.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Event *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

