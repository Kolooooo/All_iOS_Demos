//
//  UITableViewCell+Category.h
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 16/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Category)

/**
 去掉UITableView中的某cell条分割线

 @param indexPath indexPath
 @param section section
 @param row row
 */
- (void)removeBottomLineWithIndexPath:(NSIndexPath *_Nonnull)indexPath
                              section:(NSInteger)section
                                  row:(NSInteger)row;

@end
