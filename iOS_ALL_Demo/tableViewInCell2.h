//
//  tableViewInCell2.h
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 20/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^myBlock)();

@interface tableViewInCell2 : UITableViewCell

@property(nonatomic, copy) myBlock BlockName;
@property(nonatomic,assign) NSInteger  count;
@end
