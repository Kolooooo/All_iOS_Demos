//
//  UISearchViewController+Category.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 20/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "UISearchController+Category.h"

@implementation UISearchController (Category)

- (void)setBackgroundColorWithImage:(UIImage *_Nonnull)image {
    // searchBar 背景颜色
    self.searchBar.backgroundImage = image;
}

- (void)setPlaceholder:(NSString *_Nonnull)placeholder{
    self.searchBar.placeholder = placeholder;
}

- (void)setCancelButtonText:(NSString *_Nonnull)cancelButtonText{
    // 取消按钮
    [self.searchBar setValue:cancelButtonText forKey:@"_cancelButtonText"];
}

- (void)setMagnifierWithImage:(UIImage *_Nonnull)magnifierImage{
    // 放大镜
    [self.searchBar setImage:magnifierImage forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
}

- (void)setSearchFieldBlackgroundColor:(UIColor *_Nonnull)searchFieldBlackgroundColor{
    // 搜索框颜色
    UITextField *searchField = [self.searchBar valueForKey:@"searchField"];
    searchField.backgroundColor = searchFieldBlackgroundColor;
}

- (void)setBlackLineWithColor:(UIColor *_Nonnull)color{
    // 黑线是可以设置的
    UISearchBar *searchBar = self.searchBar;
    UIImageView *barImageView = [[[searchBar.subviews firstObject] subviews] firstObject];
    barImageView.layer.borderColor = color.CGColor;
    barImageView.layer.borderWidth = 1;
}

@end
