//
//  ViewController.h
//  TestForClient
//
//  Created by Ramanathan Uthirapathy on 25/11/13.
//  Copyright (c) 2013 Ramanathan Uthirapathy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISlider *sliderOutlet;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewOutlet;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageBottomConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageTopConstraint;
- (IBAction)shareButtonIsPressed:(id)sender;
- (IBAction)valueOfSliderChanged:(UISlider *)sender;

@end
