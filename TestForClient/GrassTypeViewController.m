//
//  GrassTypeViewController.m
//  LawnCareDemo
//
//  Created by Rahul kumar on 12/9/13.
//  Copyright (c) 2013 Vmoksha. All rights reserved.
//

#import "GrassTypeViewController.h"

@interface GrassTypeViewController ()

@end

@implementation GrassTypeViewController
{
    NSArray *arrayOfGrassImg, *arrayOfGrassNames;
    int currentValueOfSlider, previousValueOfSlider;
    UILabel *labelToBeHighlighted;
    UIFont *fontForNotSlectedLabels;
    UIColor *colorForNotSelectedLabels;
    BOOL radioButtonCondition;
   
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
	// Do any additional setup after loading the view.
    
    arrayOfGrassImg = @[[UIImage imageNamed:@"Fescue Grass.png"], [UIImage imageNamed:@"BlueGrass.png"], [UIImage imageNamed:@"Bent Grass 1.png"], [UIImage imageNamed:@"Zoysia.png"], [UIImage imageNamed:@"Bermuda Grass.png"],[UIImage imageNamed:@"st.augustine grass.png"]];
    arrayOfGrassNames = @[@"Fescue",@"Bluegrass",@"Bentgrass",@"Zoysia",@"Bermudagrass", @"St.Augustine"];
    
    _imageOutlet.image = arrayOfGrassImg[(int)roundf(_sliderOutlet.value)];
    
    previousValueOfSlider = (int)roundf(_sliderOutlet.value);
    
//to get the font and color of not selected labels.
    UILabel *labelOfNotSelectedGrass = (UILabel *)[self.view viewWithTag:101 + previousValueOfSlider];
    fontForNotSlectedLabels = labelOfNotSelectedGrass.font;
    colorForNotSelectedLabels = labelOfNotSelectedGrass.textColor;
    
//To set the bold and colour of label of selected grass.
    NSInteger tagValueOfLabelToBeHighlighted = 100 + previousValueOfSlider;
    
    labelToBeHighlighted = (UILabel *)[self.view viewWithTag:tagValueOfLabelToBeHighlighted];
    
    labelToBeHighlighted.textColor = [UIColor redColor];
    labelToBeHighlighted.font = [UIFont boldSystemFontOfSize:18.0];
    
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Backgorun image.jpg"]];
    
    if ([UIScreen mainScreen].bounds.size.height == 480) {
        //self.heightOfImgConstraint.constant=260;
        self.bottomcon.constant = 90;
    } else
    {
        self.imgTopConstraint.constant=60;
        _imageOutlet.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    radioButtonCondition = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderAction:(UISlider *)sender
{
    currentValueOfSlider = (int)roundf(sender.value);
    
    if (radioButtonCondition)
    {
        [self updateUIElemntsForIndex:currentValueOfSlider];

    }
    
    if (previousValueOfSlider != currentValueOfSlider)
    {
        [self updateUIElemntsForIndex:currentValueOfSlider];
        
        [self revertColorAndFontOfLabelWithIndex:previousValueOfSlider];
        
        CGRect frameOfHighlightedLabel = labelToBeHighlighted.frame;
        
        if (currentValueOfSlider <= 2)
        {
            frameOfHighlightedLabel.origin.x = frameOfHighlightedLabel.origin.x + 10;
        } else
            frameOfHighlightedLabel.origin.x = frameOfHighlightedLabel.origin.x - 10;
    }
    
    previousValueOfSlider = currentValueOfSlider;
    _sliderOutlet.value = currentValueOfSlider;


}

- (void) updateUIElemntsForIndex:(NSInteger)index
{
    if (radioButtonCondition)
    {
        [UIView transitionWithView:self.imageOutlet duration:.6 options:(UIViewAnimationOptionTransitionCrossDissolve) animations:^{
            
            _imageOutlet.image = arrayOfGrassImg[index];
            
        } completion:nil];
        
        radioButtonCondition = NO;
        [_radioButtonOutlet setImage:[UIImage imageNamed:@"radio-button-off-icon.png"] forState:(UIControlStateNormal)];

    } else {
        _imageOutlet.image = arrayOfGrassImg[(int)roundf(_sliderOutlet.value)];
    }
    NSInteger tagValueOfLabelToBeHighlighted = 100 + index;
    
    labelToBeHighlighted = (UILabel *)[self.view viewWithTag:tagValueOfLabelToBeHighlighted];
    
    [UIView transitionWithView:labelToBeHighlighted duration:.6 options:(UIViewAnimationOptionTransitionCrossDissolve) animations:^{
        labelToBeHighlighted.textColor = [UIColor redColor];
        labelToBeHighlighted.font = [UIFont boldSystemFontOfSize:18.0];
        } completion:nil];
}

- (void)revertColorAndFontOfLabelWithIndex:(NSInteger)index
{
    UILabel *labelOfPreviousGrass = (UILabel *)[self.view viewWithTag:100 + index];

        labelOfPreviousGrass.textColor = colorForNotSelectedLabels;
        labelOfPreviousGrass.font = fontForNotSlectedLabels;
}

- (IBAction)backButtonAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)notSureBtnAction:(UIButton *)sender
{
    if (!radioButtonCondition)
    {
        radioButtonCondition = YES;
        [sender setImage:[UIImage imageNamed:@"radio-button-on-icon.png"] forState:(UIControlStateNormal)];
        labelToBeHighlighted.font = fontForNotSlectedLabels;
        labelToBeHighlighted.textColor = colorForNotSelectedLabels;
        [UIView transitionWithView:self.imageOutlet duration:.5 options:(UIViewAnimationOptionTransitionCrossDissolve) animations:^{
            _imageOutlet.image = [UIImage imageNamed:@"Not_Sure.png"];

        } completion:nil];
    } else
    {
        [self updateUIElemntsForIndex:(int)roundf(_sliderOutlet.value)];
    }
    
}
@end
