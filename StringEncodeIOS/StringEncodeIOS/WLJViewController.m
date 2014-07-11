//
//  WLJViewController.m
//  StringEncodeIOS
//
//  Created by Likingwang on 14-6-27.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "WLJViewController.h"

@interface WLJViewController ()

@end

@implementation WLJViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
        NSLog(@"%@", self.tipLabel.text);
    self.nameTextField.delegate = self;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"start begining");
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"end ");
    int length = [self.nameTextField.text length];
    self.charLabel.text = [[NSString alloc] initWithFormat:@"%d/30",length];
    self.tipLabel.text = [[NSString alloc] initWithFormat:@"%d/30",[self getByteNumberFromString:self.nameTextField.text]];
    
    [self writeStringToFile:self.nameTextField.text];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.nameTextField resignFirstResponder];
    return YES;
}

- (IBAction)editingChanged:(UITextField *)sender {
    
    NSLog(@"value changed");
    NSString *text = self.nameTextField.text;
    int length = [text length];
    self.charLabel.text = [[NSString alloc] initWithFormat:@"%d/30",length];
    self.tipLabel.text = [[NSString alloc] initWithFormat:@"%d/30",[self getByteNumberFromString:text]];
}

- (int) getByteNumberFromString:(NSString *) string
{
    NSLog(@"%@", string);
    /*
    //无法直接使用 \0求长度，因为字符编码中可能有\0编码作为前缀
    const char *str = [string cStringUsingEncoding:NSUnicodeStringEncoding];
    char *t = str;
    while(*t != '\0')
    {
        printf("%x ", *t);
        t++;
    }
    printf("\n");
    return strlen(str);*/
    //unicode编码是16位的
   // return [string lengthOfBytesUsingEncoding:NSUnicodeStringEncoding];
    return [string lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
}

-(void) writeStringToFile:(NSString *)string
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"%@", paths);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSLog(@"%@", documentsDirectory);
    
    [fileManager changeCurrentDirectoryPath:[documentsDirectory stringByExpandingTildeInPath]];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"test.txt"];
    NSLog(@"%@", path);
    
    NSMutableData *writer = [[NSMutableData alloc] init];
    
    [writer appendData:[string dataUsingEncoding:NSUTF8StringEncoding]];
    
    [writer writeToFile:path atomically:YES];

}

@end
