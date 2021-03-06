//
//  TipViewControllerViewController.m
//  tipCalculator
//
//  Created by Eugenia Leong on 3/11/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;
- (void)updateValues;

@end

NSArray *tipValues;

@implementation TipViewController
@synthesize billTextField;
@synthesize tipLabel;
@synthesize totalLabel;
@synthesize tipControl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateValues];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    
    tipValues = [NSArray arrayWithObjects:
       [NSNumber numberWithFloat:0.1],
       [NSNumber numberWithFloat:0.15],
       [NSNumber numberWithFloat:0.2], nil];
}

- (void)viewDidUnload
{
    [self setBillTextField:nil];
    [self setTipLabel:nil];
    [self setTotalLabel:nil];
    [self setTipControl:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues{
    
    float tipPercentage = [[tipValues objectAtIndex:tipControl.selectedSegmentIndex] floatValue];
    [self calculateTipAndTotal:tipPercentage];

}

- (void)calculateTipAndTotal:(float)tipPercentage {
    
    float billAmount = [self.billTextField.text floatValue];
    float tipAmount = billAmount*tipPercentage;
    float total = billAmount + tipAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", total];
}

- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipAmountIndex = [defaults floatForKey:@"defaultTipAmountIndex"];
    float defaultTipAmount = [[tipValues objectAtIndex:defaultTipAmountIndex] floatValue];
    [self calculateTipAndTotal:defaultTipAmount];
    
    // update segmented control as well!
    [tipControl setSelectedSegmentIndex:defaultTipAmountIndex];
}

- (void)viewDidAppear:(BOOL)animated {
    
}

- (void)viewWillDisappear:(BOOL)animated {

}

- (void)viewDidDisappear:(BOOL)animated {

}

@end

