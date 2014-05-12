//
//  FirstViewController.m
//  TIpCalculator
//
//  Created by Savla, Sumit on 5/4/14.
//  Copyright (c) 2014 Sumit Savla. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billInput;
@property (weak, nonatomic) IBOutlet UISlider *splitNumSlider;
@property (weak, nonatomic) IBOutlet UILabel *splitNumLbl;
@property (weak, nonatomic) IBOutlet UILabel *tipPctLbl;
@property (weak, nonatomic) IBOutlet UIStepper *tipAmtStepper;
@property (weak, nonatomic) IBOutlet UILabel *totalLbl;
@property (weak, nonatomic) IBOutlet UILabel *tipAmtLbl;
@property (weak, nonatomic) IBOutlet UILabel *splitAmtLbl;

- (IBAction)onTap:(id)sender;
- (void) calculateValues;

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self calculateValues];
}

// on Slider change event
- (IBAction)updateSliderLbl:(id)sender {
    UISlider *slider = (UISlider *)sender;
    NSUInteger val = slider.value;
    self.splitNumLbl.text = [NSString stringWithFormat:@"%d",val];
    [self calculateValues];
}

// on Stepper change event
- (IBAction)updateTipAmtLbl:(UIStepper *)sender {
    NSUInteger value = sender.value;
    [self.tipPctLbl setText:[NSString stringWithFormat:@"%d%s", (int)value,"%"]];
    [self calculateValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {    
    // Load default values and update UI controls
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int splitValue = [defaults integerForKey:@"splitDefault"];
    // when app starts very first time 
    if(splitValue == 0){
        splitValue = 2;
    }
    self.splitNumLbl.text = [NSString stringWithFormat:@"%d", splitValue];
    int tipValue = [defaults integerForKey:@"tipDefault"];
    if(tipValue == 0){
        tipValue = 10;
    }
    self.tipPctLbl.text = [NSString stringWithFormat:@"%d%s", tipValue, "%"];
    
    // Update values
    self.splitNumSlider.value = splitValue;
    self.tipAmtStepper.value = tipValue;
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:(YES)];
    [self calculateValues];
}

- (void) calculateValues {
    float billAmt = [self.billInput.text floatValue];
    float tipPct = self.tipAmtStepper.value / 100;
    float tipAmt = billAmt * tipPct;
    float totalAmt = billAmt + tipAmt;
    float splitAmt = totalAmt/[self.splitNumLbl.text intValue];
    
    self.tipAmtLbl.text = [NSString stringWithFormat:@"$%.2f", tipAmt];
    self.totalLbl.text = [NSString stringWithFormat:@"$%.2f", totalAmt];
    self.splitAmtLbl.text = [NSString stringWithFormat:@"$%.2f", splitAmt];
}
     
@end
