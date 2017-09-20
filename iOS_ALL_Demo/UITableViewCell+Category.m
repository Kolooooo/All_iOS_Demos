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

- (UITableView *_Nullable)getParentTableView {
    UIView *parent = self.superview;
    while (![parent isKindOfClass:[UITableView class]] && parent.superview){
        parent = parent.superview;
    }
    
    if ([parent isKindOfClass:[UITableView class]]){
        UITableView *tableView = (UITableView *) parent;
        return tableView;
    } else {
        // This should not be reached unless really you do bad practice (like creating the cell with [[UITableView alloc] init])
        // This means that the cell is not part of a tableView's view hierarchy
        // @throw NSInternalInconsistencyException
        return nil;
    }
}

@end
