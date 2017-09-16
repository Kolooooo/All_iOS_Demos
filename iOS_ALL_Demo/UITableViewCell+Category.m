//
//  UITableViewCell+Category.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 16/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "UITableViewCell+Category.h"

@implementation UITableViewCell (Category)

- (void)removeBottomLineWithIndexPath:(NSIndexPath *_Nonnull)indexPath section:(NSInteger)section row:(NSInteger)row{
    if (indexPath.section == section && indexPath.row == row) {
        [self setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 10000000)];
    }
}

@end
