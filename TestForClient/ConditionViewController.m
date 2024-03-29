//
//  ConditionViewController.m
//  LawnCareDemo
//
//  Created by Rahul kumar on 12/11/13.
//  Copyright (c) 2013 Ramanathan Uthirapathy. All rights reserved.
//

#import "ConditionViewController.h"

@interface ConditionViewController ()

@end

@implementation ConditionViewController
{
    int currentValueOfSlider, previousValueOfSlider;
    NSArray *arrayOfSunlightImages;

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([UIScreen mainScreen].bounds.size.height==480) {
        self.imgBottomConstraint.constant=220;
    }
    
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Backgorun image.jpg"]];
    arrayOfSunlightImages = @[[UIImage imageNamed:@"sunny 1.jpg"], [UIImage imageNamed:@"sunny 2.jpg"], [UIImage imageNamed:@"sunny 3.jpg"], [UIImage imageNamed:@"sunny 4.jpg"], [UIImage imageNamed:@"sunny 5.jpg"],[UIImage imageNamed:@"sunny 6.jpg"]];
    _imageViewOutlet.image = arrayOfSunlightImages[(int)roundf(_sliderOulet.value)];
    
    previousValueOfSlider = (int)roundf(_sliderOulet.value);
    
    [[NSUserDefaults standardUserDefaults] setInteger:previousValueOfSlider forKey:@"PreviousValue"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backBtnAction:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    currentValueOfSlider = (int)roundf(sender.value);
    if (previousValueOfSlider != currentValueOfSlider)
    {
        [UIView transitionWithView:self.imageViewOutlet duration:.5 options:(UIViewAnimationOptionTransitionCrossDissolve) animations:^{
            
            _imageViewOutlet.image = arrayOfSunlightImages[currentValueOfSlider];

        } completion:nil];
        
    }
    previousValueOfSlider = currentValueOfSlider;
    _sliderOulet.value = currentValueOfSlider;
}
@end
