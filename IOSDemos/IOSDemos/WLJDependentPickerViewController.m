//
//  WLJDependentPickerViewController.m
//  IOSDemos
//
//  Created by Likingwang on 14-7-21.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJDependentPickerViewController.h"
#define kBookComponent 0
#define kPersionComponent 1
@interface WLJDependentPickerViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
- (IBAction)buttonPressed:(id)sender;

@end

@implementation WLJDependentPickerViewController

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
    // 从plist中加载数据
    NSBundle *bundle = [NSBundle mainBundle];
    //会在所有的WLJNovelData.plist中读取值，由于本代码是直接写在应用的的plist中；
    //NSURL *plistURL = [bundle URLForResource:@"WLJNovelData" withExtension:@"plist"];
    //self.bookPersons = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    self.bookPersons = [bundle objectForInfoDictionaryKey:@"WLJNovelData"];
    
    NSArray *allBooks = [self.bookPersons allKeys];
    NSArray *sortedBooks = [allBooks sortedArrayUsingSelector:@selector(compare:)];
    self.books = sortedBooks;
    
    NSString *selectedState = self.books[0]; //默认选中第一个
    self.persons = self.bookPersons[selectedState];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == kBookComponent) {
        return self.books.count;
    }else
    {
        //这个会改变，随着第一个组件被选择
        return self.persons.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == kBookComponent) {
        return self.books[row];
    }else
    {
        return self.persons[row];
    }
}

// 真正关联的方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == kBookComponent) {
        NSString *selected = self.books[row];
        self.persons = self.bookPersons[selected];
        [self.picker reloadComponent:kPersionComponent];
        [self.picker selectRow:0 inComponent:kPersionComponent animated:YES];
    }
}

// 由于每个组件宽度不一定一样，可以这里设置，默认相等
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component == kBookComponent) {
        return 200;
    }else
        return 90;
}

- (IBAction)buttonPressed:(id)sender {
    NSInteger bookRow = [self.picker selectedRowInComponent:kBookComponent];
    NSInteger characterRow = [self.picker selectedRowInComponent:kPersionComponent];
    NSString *msg = [NSString stringWithFormat:@"您选择了%@%@", self.books[bookRow], self.persons[characterRow]];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles: nil];
    [alert show];
}
@end
