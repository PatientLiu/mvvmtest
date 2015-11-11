//
//  DemonStration.h
//  testPL
//
//  Created by 刘璞峰 on 15/11/11.
//  Copyright © 2015年 patient. All rights reserved.
//

#import <Foundation/Foundation.h>
#define demonstration @"DemoObj"
@protocol DemonStration <NSObject>

-(void)demo:(NSString *)str Callback:(void (^) (NSString *))callback;

@end
