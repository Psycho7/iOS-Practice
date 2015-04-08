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
    int targetValue;
}

@property (strong, nonatomic) IBOutlet UILabel *targetLabel;

- (IBAction)slideMoved:(UISlider*)sender;

- (IBAction)showAlert:(id)sender;

@property (strong, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ViewController

@synthesize slider;

@synthesize targetLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self startNewRound];
    [self updateLabels];
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
    int difference = abs(targetValue - currentValue);
    NSString *message = [NSString stringWithFormat:@"滑动条当前数值为%d，我们的目标是%d，差值为%d",currentValue,targetValue,difference];
    [[[UIAlertView alloc]initWithTitle:@"您好" message:message delegate:nil cancelButtonTitle:@"Hello" otherButtonTitles:nil, nil]show];
    [self startNewRound];
    [self updateLabels];
}

- (void)updateLabels {
    self.targetLabel.text = [NSString stringWithFormat:@"%d",targetValue];
}

- (void)startNewRound {
    targetValue = 1 + (arc4random() % 100);
    currentValue = 50;
    self.slider.value = currentValue;
}

@end
