//
//  main.m
//  StringEncode
//
//  Created by Likingwang on 14-6-27.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //字符串对象的length方法，对于字符统计，只计算个数，不是按照字节来的
        NSString *str = @"泰山123";
        NSLog(@"字符串对象长度：%lu",[str length]);
        
        //输出9 因为按照UTF-8编码，刚好九个字节,本件本身是UTF-8编码
        char* str1 = "泰山123";
        NSLog(@"C语言长度:%lu", strlen(str1));
        for (int i=0; i<strlen(str1); i++) {
            printf("%x ", *(str1+i));
        }
        
        printf("\n");
        
        //输入以后的编码也是utf-8
        char a[100];
        scanf("%s", a);
        NSLog(@"%lu", strlen(a));
        for (int i=0; i<strlen(a); i++) {
            printf("%x ", *(a+i));
        }
        
    }
    return 0;
}

