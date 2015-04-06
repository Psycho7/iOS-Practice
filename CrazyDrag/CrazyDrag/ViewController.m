//
//  ViewController.m
//  CrazyDrag
//
//  Created by Chujie Zeng on 4/6/15.
//  Copyright (c) 2015 Psycho7. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert:(id)sender {
    [[[UIAlertView alloc]initWithTitle:@"您好，苍老师" message:@"听说您的新贴转发了499次" delegate:nil cancelButtonTitle:@"我来帮转1次，你懂的" otherButtonTitles:nil, nil]show];
}

@end
