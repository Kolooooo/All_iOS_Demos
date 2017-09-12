//
//  AutoLayoutViewController.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 08/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "AutoLayoutViewController.h"

@interface AutoLayoutViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label1;

@end

@implementation AutoLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLayoutConstraint *layoutConstraint = self.label1.constraints[0];
    
    NSLog(@"%@", layoutConstraint);
}

@end
