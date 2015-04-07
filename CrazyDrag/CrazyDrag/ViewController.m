//
//  ViewController.m
//  CrazyDrag
//
//  Created by Chujie Zeng on 4/6/15.
//  Copyright (c) 2015 Psycho7. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    int currentValue;
}

- (IBAction)slideMoved:(UISlider*)sender;

- (IBAction)showAlert:(id)sender;

@property (strong, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ViewController

@synthesize slider;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    currentValue = self.slider.value;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)slideMoved:(UISlider*)sender {
    currentValue = (int)lroundf(slider.value);
    // NSLog(@"当前值为%f", slider.value);
}

- (IBAction)showAlert:(id)sender {
    NSString *message = [NSString stringWithFormat:@"滑动条当前数值为%d",currentValue];
    [[[UIAlertView alloc]initWithTitle:@"您好" message:message delegate:nil cancelButtonTitle:@"Hello" otherButtonTitles:nil, nil]show];
}

@end
