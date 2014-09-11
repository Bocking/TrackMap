//
//  mapMenuModel.m
//  TrackMap
//
//  Created by Douglas Bocking on 11/09/2014.
//  Copyright (c) 2014 DouglasBocking. All rights reserved.
//

#import "mapMenuModel.h"
#import "mapMenuItem.h"

@implementation mapMenuModel

- (NSArray *)getMenuItems
{
    NSMutableArray *menuItemArray = [[NSMutableArray alloc] init];
    
    //copy and paste this for more items on the menu
    mapMenuItem *item1 = [[mapMenuItem alloc] init];
    item1.menuTitle = @"Nightcap Conservation Area";
    [menuItemArray addObject:item1];
    
    
    mapMenuItem *item2 = [[mapMenuItem alloc] init];
    item1.menuTitle = @"Goonengerry National Park";
    [menuItemArray addObject:item2];
    
    return menuItemArray;
    
}


@end
