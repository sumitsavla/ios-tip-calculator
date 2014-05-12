//
//  SecondViewController.m
//  TIpCalculator
//
//  Created by Savla, Sumit on 5/4/14.
//  Copyright (c) 2014 Sumit Savla. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *splitDefault;
@property (weak, nonatomic) IBOutlet UITextField *tipDefault;

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Load Defaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int splitValue = [defaults integerForKey:@"splitDefault"];
    self.splitDefault.text = [NSString stringWithFormat:@"%d", splitValue];
    int tipValue = [defaults integerForKey:@"tipDefault"];
    self.tipDefault.text = [NSString stringWithFormat:@"%d%s", tipValue, "%"];
	
}

- (IBAction)onTap:(id)sender {
    // Save defaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:[self.splitDefault.text intValue]forKey:@"splitDefault"];
    [defaults setInteger:[self.tipDefault.text intValue] forKey:@"tipDefault"];
    [defaults synchronize];
    
    [self.view endEditing:(YES)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
