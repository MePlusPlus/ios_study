//
//  WLJAVVideoCaptureViewController.m
//  AllVideoDemo
//
//  Created by Likingwang on 14-8-11.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJAVVideoCaptureViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface WLJAVVideoCaptureViewController () <AVCaptureVideoDataOutputSampleBufferDelegate>
@property (nonatomic) AVCaptureSession *avCaputureSession;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


- (IBAction)startVideo:(id)sender;
- (IBAction)stopVideo:(id)sender;

@end

@implementation WLJAVVideoCaptureViewController

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
    // Do any additional setup after loading the view.
    [self initVideoCapture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initVideoCapture
{
    // 创建会话，负责协调输入和输出
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    session.sessionPreset = AVCaptureSessionPresetMedium; //录制输出的质量
    
    // 创建和配置设备和设备输入
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = nil;
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if (!input) {
        NSLog(@"设备输入错误");
    }else
    {
        [session addInput:input];
    }
    
    // 创建和配置视频输出
    AVCaptureVideoDataOutput *output = [[AVCaptureVideoDataOutput alloc] init];
    [session addOutput:output];
    output.videoSettings = @{(NSString *)kCVPixelBufferPixelFormatTypeKey: @(kCVPixelFormatType_32BGRA)};
    // 使用AVCaptureConnection的属性设置
    output.minFrameDuration = CMTimeMake(1, 15);
    dispatch_queue_t queue = dispatch_queue_create("MyQueue", NULL);
    [output setSampleBufferDelegate:self queue:queue];
    
    self.avCaputureSession = session;
  //  dispatch_release(queue);
    
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didDropSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection
{
    
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection
{
    UIImage *image = [self imageFromSampleBuffer:sampleBuffer];
    self.imageView.image = image;
    NSLog(@"xxxx");
}

- (UIImage *)imageFromSampleBuffer:(CMSampleBufferRef)sampleBuffer
{
    // 从媒体数据中获取 视频图像
    CVImageBufferRef imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
    // 锁定像素缓冲区
    CVPixelBufferLockBaseAddress(imageBuffer, 0);

    void *baseAddress = CVPixelBufferGetBaseAddress(imageBuffer);
    // 获取像素缓冲区每行的字节数
    size_t bytesPerRow = CVPixelBufferGetBytesPerRow(imageBuffer);
    size_t width = CVPixelBufferGetWidth(imageBuffer);
    size_t height = CVPixelBufferGetHeight(imageBuffer);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef context = CGBitmapContextCreate(baseAddress, width, height, 8, bytesPerRow, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
    CGImageRef quartzImage = CGBitmapContextCreateImage(context);
    CVPixelBufferUnlockBaseAddress(imageBuffer, 0);
    
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    UIImage *image = [UIImage imageWithCGImage:quartzImage];
    CGImageRelease(quartzImage);
    return image;
}

- (void)canAccessCamera
{
    NSString *mediaType = AVMediaTypeVideo;
    __typeof(self) __weak weakself = self;
    [AVCaptureDevice requestAccessForMediaType:mediaType completionHandler:^(BOOL granted)
      {
          if (granted) {
              [weakself startCapture];
          }
         
      }];
}

- (void)startCapture
{
    [self.avCaputureSession startRunning];
}

- (void)stopCaputure
{
    [self.avCaputureSession startRunning];
}

- (IBAction)startVideo:(id)sender {
    [self canAccessCamera];
}

- (IBAction)stopVideo:(id)sender {
    [self stopCaputure];
}
@end
