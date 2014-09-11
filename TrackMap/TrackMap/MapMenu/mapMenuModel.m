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
    
    mapMenuItem *item0 = [[mapMenuItem alloc] init];
    item0.menuTitle = @"Nightcap Conservation Area";
    item0.screenType = ScreenTypeNightcap;
    [menuItemArray addObject:item0];
    
    
    mapMenuItem *item1 = [[mapMenuItem alloc] init];
    item1.menuTitle = @"Goonengerry National Park";
    item1.screenType = ScreenTypeGoonengerry;
    [menuItemArray addObject:item1];
    
    return menuItemArray;
    
}


@end
