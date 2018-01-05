//
//  ViewController.m
//  test
//
//  Created by Sunny_Ken_MacBook on 3/25/16.
//  Copyright © 2016 Sunny_Ken. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+PropertyList.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSDictionary *dict = @{
                           @"name" : @"ken",
                           @"age" : @"23"
                           };
    [Person objWithDict:dict];
    
    [[[Person alloc] init] logKen];
}

@end
