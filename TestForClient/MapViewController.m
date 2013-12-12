//
//  MapViewController.m
//  LawnCareDemo
//
//  Created by Ramanathan Uthirapathy on 26/11/13.
//  Copyright (c) 2013 Ramanathan Uthirapathy. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController
{
    NSMutableArray *selectedStateOfButtons;
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
    
    if ([UIScreen mainScreen].bounds.size.height) {
        self.topVIewConstraint.constant=100;
    }
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Backgorun image.jpg"]]];


    selectedStateOfButtons = [[NSMutableArray alloc] initWithObjects:@"NO",@"NO",@"NO",@"NO",@"NO",nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateUI
{
    NSString *imageName;
    
    for (int i = 0; i < [selectedStateOfButtons count]; i++)
    {
        if ([[selectedStateOfButtons objectAtIndex:i] isEqualToString:@"YES"])
        {
            imageName = @"radio-button-on-icon.png";
        } else
            imageName = @"radio-button-off-icon.png";
        
        UIButton *button = (UIButton *)[self.view viewWithTag:(101 + i)];
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
}
- (IBAction)backButtonIsPressed:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)buttonIsPressed:(UIButton *)sender
{
    NSInteger indexOfButton;
    
    if (sender.tag > 200)
    {
        indexOfButton = sender.tag - 201;
    } else if (sender.tag > 100)
        indexOfButton = sender.tag - 101;
    
    NSLog(@"tag of sender is %li", (long)sender.tag);
    
    for (int i = 0; i < [selectedStateOfButtons count]; i++)
    {
        if ( i != indexOfButton)
        {
            [selectedStateOfButtons replaceObjectAtIndex:i withObject:@"NO"];
        }
    }
    
    if ([[selectedStateOfButtons objectAtIndex:indexOfButton] isEqualToString:@"NO"])
    {
        [selectedStateOfButtons replaceObjectAtIndex:indexOfButton withObject:@"YES"];
    }
    
    [self updateUI];
}
@end
