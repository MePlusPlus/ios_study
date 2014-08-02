//
//  WLJDoublePickerViewController.h
//  IOSDemos
//
//  Created by Likingwang on 14-7-21.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kBookComponent 0  
#define kCharacterCompont 1

@interface WLJDoublePickerViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) NSArray *bookNames;
@property (strong, nonatomic) NSArray *characterNames;

@end
