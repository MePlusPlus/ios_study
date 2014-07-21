//
//  WLJViewController.m
//  MoveDeleteUI
//
//  Created by Likingwang on 14-7-11.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "WLJViewController.h"
#import "WLJMessageModel.h"
#import "WLJMessageTableViewCell.h"

@interface WLJViewController ()

@property (weak, nonatomic) IBOutlet UITableView *messageTable;

@end

@implementation WLJViewController 

NSArray *data ;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    data = [WLJMessageModel getMessageData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
        return data.count;
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WLJMessageTableViewCell *cell = nil;
    if (indexPath.section == 0) {
        cell = (WLJMessageTableViewCell *)[self.messageTable dequeueReusableCellWithIdentifier:@"MessageCell"];
        /*
        UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
        recognizer.direction = UISwipeGestureRecognizerDirectionDown;
        [cell addGestureRecognizer:recognizer];
        
        UISwipeGestureRecognizer *recognizer2 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
        recognizer2.direction = UISwipeGestureRecognizerDirectionUp;
        [cell addGestureRecognizer:recognizer2];
         
         */
        
        WLJMessageModel *model = data[indexPath.row];
        cell.title.text = model.title;
        cell.time.text = model.time;
        cell.count.text = model.count;
        cell.summary.text = model.summary;
        cell.logo.image = [UIImage imageNamed:@"bg_interest_photo"];
    }
    
    return  cell;
}

- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)recoginer
{
    NSString *msg = nil;
    // 要监控下拉操作，必须得将scrollview的事件屏蔽，否则将被拦截；
    if (recoginer.direction == UISwipeGestureRecognizerDirectionDown)
        msg = @"向下拉";
    else if (recoginer.direction == UISwipeGestureRecognizerDirectionUp)
        msg = @"向上拉";
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [view show];
    NSLog(@"xxxx");
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
