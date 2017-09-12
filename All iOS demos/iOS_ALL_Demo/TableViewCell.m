//
//  TableViewCell.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 02/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell()

@end

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
//    self.textLabel.numberOfLines = 0;
    [self.textLabel sizeToFit];
}

@end
