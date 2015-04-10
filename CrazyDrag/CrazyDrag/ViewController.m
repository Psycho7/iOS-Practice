//
//  ViewController.m
//  CrazyDrag
//
//  Created by Chujie Zeng on 4/6/15.
//  Copyright (c) 2015 Psycho7. All rights reserved.
//

#import "ViewController.h"
#import "AboutViewController.h"

@interface ViewController () {
    int currentValue;
    int targetValue;
    int score;
    int round;
}

@property (strong, nonatomic) IBOutlet UILabel *targetLabel;

- (IBAction)slideMoved:(UISlider*)sender;

- (IBAction)showAlert:(id)sender;

@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UILabel *roundLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation ViewController

@synthesize slider;
@synthesize targetLabel;
@synthesize scoreLabel;
@synthesize roundLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
    [self.slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    UIImage *thumbImageHighlight = [UIImage imageNamed:@"SliderThumb-Highlighted"];
    [self.slider setThumbImage:thumbImageHighlight forState:UIControlStateHighlighted];
    UIImage *trackLeft = [[UIImage imageNamed:@"SliderTrackLeft"] stretchableImageWithLeftCapWidth:14 topCapHeight:0];
    [self.slider setMinimumTrackImage:trackLeft forState:UIControlStateNormal];
    UIImage *trackRight = [[UIImage imageNamed:@"SliderTrackRight"] stretchableImageWithLeftCapWidth:14 topCapHeight:0];
    [self.slider setMaximumTrackImage:trackRight forState:UIControlStateNormal];
    
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
    int point = 100 - difference;
    score += point;
    NSString *title = nil;
    if (difference == 0) {
        title = @"完美！";
    }
    else if (difference < 15) {
        title = @"还不错！";
    }
    else {
        title = @"再接再厉:)";
    }
    
    NSString *message = [NSString stringWithFormat:@"滑动条当前数值为%d，我们的目标是%d，差值为%d",currentValue,targetValue,difference];
    [[[UIAlertView alloc]initWithTitle:title message:message delegate:self cancelButtonTitle:@"Hello" otherButtonTitles:nil, nil]show];
}

- (IBAction)startOver:(id)sender {
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.duration = 1;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    [self startNewGame];
    [self updateLabels];
    
    [self.view.layer addAnimation:transition forKey:nil];
}

- (void)startNewGame {
    round = 0;
    score = 0;
    [self startNewRound];
}

- (IBAction)startInfo:(id)sender {
    AboutViewController *controller = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];
    controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)updateLabels {
    self.targetLabel.text = [NSString stringWithFormat:@"%d",targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d", round];
}

- (void)startNewRound {
    round++;
    targetValue = 1 + (arc4random() % 100);
    currentValue = 50;
    self.slider.value = currentValue;
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    [self startNewRound];
    [self updateLabels];
}

@end
