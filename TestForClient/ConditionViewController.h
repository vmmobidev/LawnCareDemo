//
//  ConditionViewController.h
//  LawnCareDemo
//
//  Created by Rahul kumar on 12/11/13.
//  Copyright (c) 2013 Ramanathan Uthirapathy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConditionViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageViewOutlet;
@property (weak, nonatomic) IBOutlet UISlider *sliderOulet;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgBottomConstraint;
- (IBAction)backBtnAction:(UIButton *)sender;
- (IBAction)sliderValueChanged:(UISlider *)sender;

@end
