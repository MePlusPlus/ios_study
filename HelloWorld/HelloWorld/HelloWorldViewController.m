//
//  HelloWorldViewController.m
//  HelloWorld
//
//  Created by Likingwang on 14-6-9.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "HelloWorldViewController.h"

@interface HelloWorldViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)changeGreeting:(id)sender;

@end

@implementation HelloWorldViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeGreeting:(id)sender {
    
    self.userName = self.textField.text;
    NSString *nameString = self.userName;
    if([nameString length] == 0){
        nameString = @"Likingwang";
    }
    NSString *greeting = [[NSString alloc] initWithFormat:@"您好,%@!", nameString];
    self.label.text = greeting;
}

-(BOOL) textFieldShouldReturn:(UITextField *)theTextField{
    if (theTextField == self.textField) {
        
        [theTextField resignFirstResponder];
    }
    return YES;
}

- (IBAction)editingChanged:(UITextField *)sender {
    NSLog(@"xxx");
}

@end
