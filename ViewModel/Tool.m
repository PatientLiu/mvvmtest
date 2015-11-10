//
//  Tool.m
//  testPL
//
//  Created by 刘璞峰 on 15/11/10.
//  Copyright © 2015年 patient. All rights reserved.
//

#import "Tool.h"
#import "NetWorkInterFace.h"
#import "NetWork.h"
@implementation Tool
+(void)load
{
    JSObjectionInjector *injector = [JSObjection defaultInjector];
    injector = injector ?: [JSObjection createInjector];
    injector = [injector withModule:[[self alloc] init]];
    [JSObjection setDefaultInjector:injector];
}
-(void)configure
{
    [self bindClass:[NetWork class] toProtocol:@protocol(NetWorkInterFace)];
}
@end
