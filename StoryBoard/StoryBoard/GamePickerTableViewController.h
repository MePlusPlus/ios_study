//
//  GamePickerTableViewController.h
//  StoryBoard
//
//  Created by Likingwang on 14-6-26.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  GamePickerTableViewController;

@protocol GamePickerViewControllerDelegate <NSObject>

- (void)gamePickerViewController:(GamePickerTableViewController *)controller didSelectGame:(NSString *)game;

@end

@interface GamePickerTableViewController : UITableViewController

@property (nonatomic, weak) id <GamePickerViewControllerDelegate> delegate;
@property (nonatomic, strong) NSString *game;

@end
