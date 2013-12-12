//
//  ViewController.m
//  TestForClient
//
//  Created by Ramanathan Uthirapathy on 25/11/13.
//  Copyright (c) 2013 Ramanathan Uthirapathy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@end

@implementation ViewController
{
    NSArray *pageImages;
    NSMutableArray *pageViews;
    NSInteger preiousValueOfSlider;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    if ([UIScreen mainScreen].bounds.size.height==480) {
        self.imageTopConstraint.constant=20;
        self.imageBottomConstraint.constant=210;
    }
    
    self.navigationController.navigationBarHidden = YES;
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Backgorun image.jpg"]]];
    
    pageViews = [[NSMutableArray alloc] init];
    
    pageImages = [NSArray arrayWithObjects:
                       [UIImage imageNamed:@"lawn_state_1.png"],
                       [UIImage imageNamed:@"lawn_state_2.png"],
                       [UIImage imageNamed:@"lawn_state_3.png"],
                       [UIImage imageNamed:@"lawn_state_4.png"],
                       [UIImage imageNamed:@"lawn_state_5.png"],
                       [UIImage imageNamed:@"lawn_state_6.png"],
                       [UIImage imageNamed:@"lawn_state_7.png"],
                       nil];
    
    NSLog(@"count of pageImage = %lu, also pageViews count = %lu", (unsigned long)[pageImages count], (unsigned long)[pageViews count]);
    
    _imageViewOutlet.contentMode = UIViewContentModeScaleAspectFit;
    
    _sliderOutlet.minimumValue = 0;
    _sliderOutlet.maximumValue = [pageImages count] - 1;
    
    
    preiousValueOfSlider = 0;
    
    _imageViewOutlet.image = [pageImages objectAtIndex:_sliderOutlet.value];

}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    CGSize scrollViewSize = _scrollView.frame.size;
    
//    _scrollView.contentSize = CGSizeMake(scrollViewSize.width * [pageImages count], scrollViewSize.height);
//    
//    [self loadImagesForSliderValue:_sliderOutlet.value];

    
//    CGPoint offset = self.scrollView.contentOffset;
//    CGPoint newOffset = CGPointMake(offset.x+100, offset.y);
//    
//    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAutoreverse |UIViewAnimationOptionRepeat animations:^{
//        [UIView setAnimationRepeatCount: 2];
//        [self.scrollView setContentOffset:newOffset animated: NO];
//    } completion:^(BOOL finished) {
//        [self.scrollView setContentOffset:offset animated:NO];
//    }];
    
}

//- (void)loadImageViews:(NSInteger)indexOfImage
//{
//    if (indexOfImage < 0 || indexOfImage >= [pageViews count])
//    {
//        return;
//    }
//    
//    UIView *view = [pageViews objectAtIndex:indexOfImage];
//    
//    if ((NSNull *)view == [NSNull null])
//    {
//        CGRect frameOfCurrentImage = self.scrollView.bounds;
//        frameOfCurrentImage.origin.x = frameOfCurrentImage.size.width * indexOfImage;
//        frameOfCurrentImage.origin.y = 0.0f;
//        
//        UIImageView *currentImageView = [[UIImageView alloc] initWithImage:[pageImages objectAtIndex:indexOfImage]];
//        currentImageView.frame = frameOfCurrentImage;
//        currentImageView.contentMode = UIViewContentModeScaleAspectFit;
//        
//        [self.scrollView addSubview:currentImageView];
//        
//        [pageViews replaceObjectAtIndex:indexOfImage withObject:currentImageView];
//    }
//}
//
//- (void)purgeImageView:(NSInteger)indexOfImage
//{
//    if (indexOfImage < 0 || indexOfImage >= [pageViews count])
//    {
//        return;
//    }
//    
//    UIView *view = [pageViews objectAtIndex:indexOfImage];
//    
//    if ((NSNull *)view != [NSNull null])
//    {
//        [view removeFromSuperview];
//        [pageViews replaceObjectAtIndex:indexOfImage withObject:[NSNull null]];
//    }
//}
//
//- (void)loadImagesForSliderValue:(NSInteger)sliderValue
//{
//    NSInteger indexOfPreviousImage = sliderValue - 3;
//    NSInteger indexOfNextPage = sliderValue + 3;
//    
//// purge any image before Previous Image
//    for (int i = 0; i < indexOfPreviousImage; i++)
//    {
//        [self purgeImageView:i];
//    }
//    
//// Load images which we need
//    for (NSInteger i = indexOfPreviousImage; i <= indexOfNextPage; i++)
//    {
//        [self loadImageViews:i];
//    }
//    
////remove images after Next Image
//    for (NSInteger i = indexOfNextPage + 1; i < [pageViews count]; i++)
//    {
//        [self purgeImageView:i];
//    }
//    
//    
//    
//
//    [UIView animateWithDuration:0.3 delay:0 options: UIViewAnimationOptionBeginFromCurrentState
//                     animations:^{
//                            [_scrollView setContentOffset:CGPointMake(_scrollView.bounds.size.width *sliderValue, 0) animated:NO];
//                                }
//                     completion:^(BOOL finished) {
//    }];
//    
//    
//    
//    
//    
//    
////    [_scrollView setContentOffset:CGPointMake(_scrollView.bounds.size.width *sliderValue, 0) animated:YES];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareButtonIsPressed:(id)sender
{
    UIImage *imageToShare = [UIImage imageNamed:@"Backgorun image.jpg"];
    NSArray* dataToShare = @[@"test akgsaiugaskh",imageToShare];
    UIActivityViewController *activity = [[UIActivityViewController alloc] initWithActivityItems:dataToShare applicationActivities:Nil];
    activity.excludedActivityTypes = @[ UIActivityTypeCopyToPasteboard, UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll,UIActivityTypeMessage];
    [self presentViewController:activity animated:TRUE completion:nil];
}

- (IBAction)valueOfSliderChanged:(UISlider *)sender
{
    NSInteger currentValue = lroundf(_sliderOutlet.value);
    
    if (currentValue != preiousValueOfSlider)
    {

        _imageViewOutlet.image = [pageImages objectAtIndex:currentValue];
    }
    
    _sliderOutlet.value = currentValue;
    
    preiousValueOfSlider = currentValue;
}


- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
//    for (int i = 0; i < [pageViews count]; i++)
//    {
//        [self purgeImageView:i];
//    }
//    
//    [self loadImagesForSliderValue:lroundf(_sliderOutlet.value)];
    
}
@end
