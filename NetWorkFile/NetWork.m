//
//  NetWork.m
//  testPL
//
//  Created by 刘璞峰 on 15/11/9.
//  Copyright © 2015年 patient. All rights reserved.
//

#import "NetWork.h"
#import "AppDelegate.h"
@interface NetWork ()<NSURLSessionDelegate>

@end
@implementation NetWork
-(void)RequestType:(NSString *)type Url:(NSString *)url Callback:(void (^) (id ,NSError *))callback
{
    NSString *rootUrl = BiYingapi;
    NSMutableURLRequest *request = [NSMutableURLRequest new];
    request.HTTPMethod = type;
    request.URL = [NSURL URLWithString:[rootUrl stringByAppendingPathComponent:url]];
    request.timeoutInterval = 5;
    request.cachePolicy = NSURLRequestUseProtocolCachePolicy;
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if ([(NSHTTPURLResponse *)response statusCode] == 200) {
            callback(data,nil);
        } else if ([(NSHTTPURLResponse *)response statusCode] < 500 && [(NSHTTPURLResponse *)response statusCode] >= 400) {
            NSError *error = [NSError errorWithDomain:@"请求失败" code:404 userInfo:@{@"message":@"请求失败"}];
            callback(nil,error);
        } else if ([(NSHTTPURLResponse *)response statusCode] >= 500) {
            NSError *error = [NSError errorWithDomain:@"请求失败" code:404 userInfo:@{@"message":@"服务器故障"}];
            callback(nil,error);
        }
    }];
    [task resume];
}



@end
