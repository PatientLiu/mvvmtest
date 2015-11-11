//
//  DemoObj.m
//  testPL
//
//  Created by 刘璞峰 on 15/11/11.
//  Copyright © 2015年 patient. All rights reserved.
//

#import "DemoObj.h"

@implementation DemoObj
-(void)demo:(NSString *)str Callback:(void (^)(NSString *))callback
{
    [self demoTwo:str Callback:callback];
}
-(void)demoTwo:(NSString *)str Callback:(void (^)(NSString *))callback
{
    callback([@"模块2callback:" stringByAppendingString:str]);
}
@end
