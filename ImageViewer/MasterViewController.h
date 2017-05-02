//
//  MasterViewController.h
//  ImageViewer
//
//  Created by Wilson Oliveira on 02/05/2017.
//  Copyright © 2017 wso277. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <WebKit/WebKit.h>
#import "ImageViewer+CoreDataModel.h"
#import "NetworkWrapper.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController<Event *> *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

//VIEW

//Controller
@property (strong, nonatomic) NSArray *imageSources;


@end

