//
//  AppDelegate.h
//  resident
//
//  Created by Xin Qin on 2/6/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end


@class TableViewCell;
@protocol TabelViewCellTouchUpInsideProtocol <NSObject>

@required
- (void)tabelViewCellTouchUpInside:(TableViewCell *)cell;

@end

