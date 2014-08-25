//
//  WLJLocalMovieViewController.m
//  AllVideoDemo
//
//  Created by Likingwang on 14-8-7.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJLocalMovieViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface WLJLocalMovieViewController () <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    MPMoviePlayerController *moviePlayerController;
}
@property (weak, nonatomic) IBOutlet UIView *movieContainer;
- (IBAction)appLocalPlay:(id)sender;
- (IBAction)userLocalPlay:(id)sender;
- (IBAction)networkStreamPlay:(id)sender;
- (IBAction)firstImage:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *networkAddress;
@property (weak, nonatomic) IBOutlet UIImageView *firstFrameImage;

@end

@implementation WLJLocalMovieViewController

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
    
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// 创建播放器，直接播放
- (void)createAndPlayMovieForURL:(NSURL *)movieURL sourceType:(MPMovieSourceType)sourceType
{
    [self createAndPlayMovieWithURL:movieURL sourceType:sourceType];
    [moviePlayerController prepareToPlay];
    [moviePlayerController play];
}

// 私有方法，创建播放器，添加到当前的视图上
- (UIView *)createAndPlayMovieWithURL:(NSURL *)movieURL sourceType:(MPMovieSourceType)sourceType
{
    moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
    if (moviePlayerController) {
        
        [self applyUserSettingsToMoviePlayer];
        // 定义播放的文件或者在线视频
        [moviePlayerController setContentURL:movieURL];
        // 预先设置类型，加快加载速度
        [moviePlayerController setMovieSourceType:sourceType];
        
        // 以原来矩形的中心为中心，进行放大或缩小，如果是-20，相当于加了一个宽为20的边框
        CGRect rect = self.movieContainer.bounds;
        CGRect viewInsetRect = CGRectInset(rect, 20, 20);
        [moviePlayerController.view setFrame:viewInsetRect];
        moviePlayerController.view.backgroundColor = [UIColor lightGrayColor];
        [self.movieContainer addSubview:moviePlayerController.view];
        
        //添加浮层
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(2, 2, 300, 20)];
        label.text = @"正在播放Movie";
        [self.movieContainer addSubview:label];
        
        return moviePlayerController.view;
    }
    return nil;
}



- (void)applyUserSettingsToMoviePlayer
{
    if(moviePlayerController)
    {
        moviePlayerController.scalingMode = MPMovieScalingModeAspectFill;
        moviePlayerController.controlStyle = MPMovieControlModeVolumeOnly;
        moviePlayerController.backgroundView.backgroundColor = [UIColor lightGrayColor];
        moviePlayerController.repeatMode = MPMovieRepeatModeNone;
        
        // 设置back
        // 定义是否可以支持AirPlay的视频在该播放器播放
        moviePlayerController.allowsAirPlay = YES;
    }
}

- (void)playMovieFile:(NSURL *)movieFileURL
{
    [self createAndPlayMovieForURL:movieFileURL sourceType:MPMovieSourceTypeFile];
}




#pragma mark - Navigation
/*

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    
    
    NSURL *theMovieURL = nil;
    // 如果是本地app视频
    if ([segue.identifier isEqualToString:@"applocalvideo"]) {
        
        NSBundle *bundle = [NSBundle mainBundle];
        if (bundle) {
            NSString *moviePath = [bundle pathForResource:@"Movie" ofType:@"m4v"];
            if (moviePath) {
                theMovieURL = [NSURL fileURLWithPath:moviePath];
                
            }
        }
        
    }else  //读取用户手机视频
    {
        
    }
}

*/

// app自带的视频
- (void)playAppLocalVideo
{
    NSURL *theMovieURL = nil;
    NSBundle *bundle = [NSBundle mainBundle];
    if (bundle) {
        // 资源必须通过xcode的add file添加，直接拷贝拖动，无法添加到资源包中
        NSString *moviePath = [bundle pathForResource:@"Movie" ofType:@"m4v"];
        if (moviePath) {
            theMovieURL = [NSURL fileURLWithPath:moviePath];
            [self playMovieFile:theMovieURL];
        }
    }

}

// 用户本地视频
- (void)playUserLocalVideo
{
    
}

- (IBAction)appLocalPlay:(id)sender {
    [self playAppLocalVideo];
}

- (IBAction)userLocalPlay:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"选择视频来源" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"本地视频", @"相机摄像", nil];
    [actionSheet showInView:self.view];
}

- (IBAction)networkStreamPlay:(id)sender {
    NSString *addr = self.networkAddress.text;
    if ([addr length] > 0) {
        NSURL *url = [NSURL URLWithString:addr];
        MPMovieSourceType movieSourceType = MPMovieSourceTypeUnknown;
        if ([[url pathExtension] compare:@"m3u8" options:NSCaseInsensitiveSearch] == NSOrderedSame)
        {
            movieSourceType = MPMovieSourceTypeStreaming;
        }
        [self createAndPlayMovieForURL:url sourceType:movieSourceType];
    }

}

- (IBAction)firstImage:(id)sender {
    
    [self playAppLocalVideo];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didFirstImage:) name:MPMoviePlayerThumbnailImageRequestDidFinishNotification object:nil];
    
    // 必须是double型，整型出错；
    [moviePlayerController requestThumbnailImagesAtTimes:@[[NSNumber numberWithDouble:2.0]] timeOption:MPMovieTimeOptionNearestKeyFrame];
}

- (void)didFirstImage:(NSNotification *)notification
{

    NSError *error = [notification.userInfo objectForKey:MPMoviePlayerThumbnailErrorKey];
    if (error == nil) {
        UIImage *image = [notification.userInfo objectForKey:MPMoviePlayerThumbnailImageKey];
        NSNumber *time = [notification.userInfo objectForKey:MPMoviePlayerThumbnailTimeKey];
        
        self.firstFrameImage.image = image;
    }
    
}

#pragma mark - ActionSheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            //[self saveVideoToAlum];
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            imagePicker.delegate = self;
            imagePicker.allowsEditing = NO;
            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            imagePicker.mediaTypes = @[(NSString *)kUTTypeMovie];
            [self presentViewController:imagePicker animated:YES completion:nil];
            break;
        }
        case 1:
        {

            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            imagePicker.delegate = self;
            imagePicker.allowsEditing = YES;
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            imagePicker.mediaTypes = @[(NSString *)kUTTypeMovie];
            [self presentViewController:imagePicker animated:YES completion:nil];
            break;

        }
        default:
            break;
    }
}

- (void)saveVideoToAlum
{
    NSBundle *bundle = [NSBundle mainBundle];
    
    if (bundle) {
        // 资源必须通过xcode的add file添加，直接拷贝拖动，无法添加到资源包中
        NSString *moviePath = [bundle pathForResource:@"Movie" ofType:@"m4v"];
        BOOL res = UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(moviePath);
        if (res) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(){
                UISaveVideoAtPathToSavedPhotosAlbum(moviePath, nil, nil, nil);
                dispatch_async(dispatch_get_main_queue(), ^(){
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"视频拷贝成功" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles: nil];
                    [alert show];
                });
            });
            
        }
    }
    
    //UIImageWriteToSavedPhotosAlbum(<#UIImage *image#>, <#id completionTarget#>, <#SEL completionSelector#>, <#void *contextInfo#>)
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    if ([[info objectForKey:UIImagePickerControllerMediaType] isEqualToString:(NSString *)kUTTypeMovie]) {
        //NSString *videoPath = [(NSURL *)[info objectForKey:UIImagePickerControllerMediaURL] path];
        [self playMovieFile:(NSURL *)[info objectForKey:UIImagePickerControllerMediaURL]];
        
        
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
