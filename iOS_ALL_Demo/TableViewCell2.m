//
//  TableViewCell2.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 03/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "TableViewCell2.h"

@interface TableViewCell2()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelMaginLeft;
@property (nonatomic, strong) UIButton  *button;
@end

@implementation TableViewCell2

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.text2Label.numberOfLines = 0;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    
    self.text2Label.preferredMaxLayoutWidth = self.width;
    
    
    // [super layoutSubviews];
    
}

@end
