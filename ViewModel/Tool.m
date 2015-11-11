//
//  Tool.m
//  testPL
//
//  Created by 刘璞峰 on 15/11/10.
//  Copyright © 2015年 patient. All rights reserved.
//

#import "Tool.h"
#import "NetWorkInterFace.h"
#import "DemonStration.h"
NSDictionary *theModules() {
    static NSDictionary *modelInteface = nil;
    static dispatch_once_t oncetoken;
    dispatch_once(&oncetoken, ^{
        modelInteface = @{NetWorkinterface:@protocol(NetWorkInterFace),
                          demonstration:@protocol(DemonStration)};
    });
    return modelInteface;
}

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
    for (NSString *name in theModules().allKeys) {
        Class class = NSClassFromString(name);
        [self bindClass:class toProtocol:theModules()[name]];
    }
}

@end










