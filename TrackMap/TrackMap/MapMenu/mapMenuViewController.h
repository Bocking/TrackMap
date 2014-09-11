//
//  mapMenuViewController.h
//  TrackMap
//
//  Created by Douglas Bocking on 11/09/2014.
//  Copyright (c) 2014 DouglasBocking. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mapMenuModel.h"
#import "mapMenuItem.h"


@interface mapMenuViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) mapMenuModel *model;
@property (strong, nonatomic) NSArray *menuItems;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
