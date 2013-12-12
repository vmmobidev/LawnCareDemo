//
//  GrassTypeViewController.h
//  LawnCareDemo
//
//  Created by Rahul kumar on 12/9/13.
//  Copyright (c) 2013 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GrassTypeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISlider *sliderOutlet;
@property (weak, nonatomic) IBOutlet UIImageView *imageOutlet;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightOfImgConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomcon;
@property (weak, nonatomic) IBOutlet UIButton *radioButtonOutlet;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgTopConstraint;
- (IBAction)sliderAction:(UISlider *)sender;
- (IBAction)backButtonAction:(id)sender;
- (IBAction)notSureBtnAction:(UIButton *)sender;

@end
