//
//  WLJDependentPickerViewController.h
//  IOSDemos
//
//  Created by Likingwang on 14-7-21.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLJDependentPickerViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

// 小说与任务对应的字典数据
@property (strong, nonatomic)NSDictionary *bookPersons;
// 小说列表
@property (strong, nonatomic)NSArray *books;
// 某部小说的人物列表
@property (strong, nonatomic)NSArray *persons;

@end
