//
//  PerformanceViewCell.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 2017/10/25.
//  Copyright © 2017年 Ken lu. All rights reserved.
//

#import "PerformanceViewCell.h"
#import "UIView+__Performance.h"

const static CGFloat cellHeight = 70.0f;
const static CGFloat viewsSize = 50.0f;

@interface PerformanceViewCell()

@property (nonatomic, assign) BOOL  isBest;

@property (nonatomic, strong) UIButton *cornerButton;
@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UILabel *label;

@end

@implementation PerformanceViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
    }
    return self;
}

+ (NSString *)identifier{
    return NSStringFromClass(self);
}

+ (CGFloat)cellHeight{
    return cellHeight;
}

- (void)badProformances{
    self.cornerButton.alpha = 0.5;
    self.imageView.alpha = 0.5;
    self.label.backgroundColor = [UIColor clearColor];
    
    self.layer.shouldRasterize = NO;
}

- (void)bestProformances{
    self.cornerButton.alpha = 1;
    self.cornerButton.layer.opaque = YES;
    self.imageView.alpha = 1;
    self.label.backgroundColor = [UIColor whiteColor];
    
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [[UIScreen mainScreen] scale];
}

- (void)initUI{
    UIButton *cornerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cornerButton = cornerButton;
    cornerButton.frame = CGRectMake(10, 10, viewsSize, viewsSize);
    
    
    UIButton *cornerButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [cornerButton1 setTitle:@"圆角" forState:UIControlStateNormal];
    cornerButton1.backgroundColor = [UIColor grayColor];
    cornerButton1.frame = CGRectMake(10, 10, viewsSize, viewsSize);
    cornerButton1.layer.cornerRadius = 10.0f;
    cornerButton1.layer.borderWidth = 3.0f;
    cornerButton1.layer.borderColor = [UIColor redColor].CGColor;
    cornerButton1.layer.shadowColor = [UIColor purpleColor].CGColor;
    cornerButton1.layer.shadowOffset = CGSizeMake(6.0, 6.0);
    cornerButton1.layer.shadowOpacity = 1.0f;
    
    CGSize kensize = CGSizeMake(cornerButton1.width + 10, cornerButton1.height + 10);
    UIImage *viewImage = [cornerButton1 __createViewImage:kensize];
    //cornerButton.backgroundColor = [UIColor colorWithPatternImage:viewImage];
    cornerButton.layer.contents = (id)viewImage.CGImage;
    
    
    UIImageView *imageView = [[UIImageView alloc] init];
    self.imageView1 = imageView;
    imageView.frame = CGRectMake(CGRectGetMaxX(cornerButton.frame) + 10, 10, viewsSize, viewsSize);
    imageView.image = [UIImage imageNamed:@"Class_Tree"];
    
    UILabel *label = [[UILabel alloc] init];
    self.label = label;
    label.text = @"我是 label";
    label.width = 100;
    label.height = cellHeight;
    label.x = CGRectGetMaxX(imageView.frame) + 10;
    label.centerX = self.centerX;
    label.backgroundColor = [UIColor whiteColor];
    label.layer.masksToBounds = YES;
    
    [self addSubview:cornerButton];
    [self addSubview:imageView];
    [self addSubview:label];
    
    //    self.isBest = YES;
    //    if (self.isBest) {
    //        [self bestProformances];
    //    }
    //    else{
    //        [self badProformances];
    //    }
}

@end
