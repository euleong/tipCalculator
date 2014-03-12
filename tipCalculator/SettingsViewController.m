//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by Eugenia Leong on 3/11/14.
//  Copyright (c) 2014 Eugenia Leong. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;

- (IBAction)onValueChanged:(id)sender;
@end

@implementation SettingsViewController
@synthesize defaultTipControl;

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
    // Do any additional setup after loading the view from its nib.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipAmountIndex = [defaults floatForKey:@"defaultTipAmountIndex"];
    [defaultTipControl setSelectedSegmentIndex:defaultTipAmountIndex];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateValues {

}

- (IBAction)onValueChanged:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:defaultTipControl.selectedSegmentIndex forKey:@"defaultTipAmountIndex"];
    [defaults synchronize];
}
@end
