//
//  FISViewController.m
//  theFinalCountdown
//
//  Created by Joe Burgess on 7/9/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setInitialConstraints];
    
    self.countdownDisplayLabel.hidden = YES;
    self.pauseButton.enabled = NO;
    self.countdownDisplayLabel.adjustsFontSizeToFitWidth = YES;


	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)startButtonTapped:(id)sender {
    [self toggleButtons];
    
    CGFloat hours = floor(self.counter/3600.0f);
    CGFloat minutes = floor(self.counter/60.0f);
    NSUInteger seconds = self.counter % 60;
    self.counter = self.datePicker.countDownDuration;
    self.countdownDisplayLabel.text = [NSString stringWithFormat:@"%.f:%.f:%lu",hours,minutes,seconds];

    [self startCountdown];
    
}
- (IBAction)PauseButtonTapped:(id)sender {
    self.isPaused = !self.isPaused;

}


-(void)startCountdown {
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                  target:self
                                                selector:@selector(countdownTimer:)
                                                userInfo:nil
                                                 repeats:YES];
}

-(void)countdownTimer:(NSTimer *)timer {
    
    if(!self.isPaused) {
        self.counter--;
    }
    CGFloat hours = floor(self.counter/3600.0f);
    CGFloat minutes = floor((self.counter % 3600) / 60);
    NSUInteger seconds = self.counter % 60;
    self.countdownDisplayLabel.text = [NSString stringWithFormat:@"%.f:%.f:%lu",hours,minutes,seconds];

    if (self.counter <= 0) {
        [timer invalidate];
        //  Here the counter is 0 and you can take call another method to take action;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)toggleButtons {
    
    self.countdownDisplayLabel.hidden = !(self.countdownDisplayLabel.hidden);
    self.pauseButton.enabled = !(self.pauseButton.enabled);
    self.datePicker.enabled = !(self.datePicker.enabled);
    self.datePicker.hidden = !(self.datePicker.hidden);
    
}

-(void)setInitialConstraints {
    
    self.datePicker.translatesAutoresizingMaskIntoConstraints = NO;
    self.buttonViewHelper.translatesAutoresizingMaskIntoConstraints = NO;
    self.startButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.pauseButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.countdownDisplayLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint deactivateConstraints:self.view.constraints];
    [NSLayoutConstraint deactivateConstraints:self.datePicker.constraints];
    [NSLayoutConstraint deactivateConstraints:self.buttonViewHelper.constraints];
    [NSLayoutConstraint deactivateConstraints:self.startButton.constraints];
    [NSLayoutConstraint deactivateConstraints:self.pauseButton.constraints];
    [NSLayoutConstraint deactivateConstraints:self.countdownDisplayLabel.constraints];
    
    [self.datePicker.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [self.datePicker.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    [self.datePicker.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.datePicker.bottomAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    
    [self.buttonViewHelper.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:0.5].active = YES;
    [self.buttonViewHelper.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.buttonViewHelper.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [self.buttonViewHelper.topAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    
    [self.startButton.leftAnchor constraintEqualToAnchor:self.buttonViewHelper.leftAnchor].active = YES;
    [self.startButton.centerYAnchor constraintEqualToAnchor:self.buttonViewHelper.centerYAnchor].active = YES;
     
    [self.pauseButton.rightAnchor constraintEqualToAnchor:self.buttonViewHelper.rightAnchor].active = YES;
    [self.pauseButton.centerYAnchor constraintEqualToAnchor:self.buttonViewHelper.centerYAnchor].active = YES;
    
    [self.countdownDisplayLabel.topAnchor constraintEqualToAnchor:self.datePicker.topAnchor constant:10].active = YES;
    [self.countdownDisplayLabel.leftAnchor constraintEqualToAnchor:self.datePicker.leftAnchor constant:10].active = YES;
    [self.countdownDisplayLabel.bottomAnchor constraintEqualToAnchor:self.datePicker.bottomAnchor constant:-10].active = YES;
    [self.countdownDisplayLabel.rightAnchor constraintEqualToAnchor:self.datePicker.rightAnchor constant:-10].active = YES;
    
    
    
    
}






@end
