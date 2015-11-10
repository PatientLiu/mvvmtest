//
//  ViewModel.m
//  testPL
//
//  Created by 刘璞峰 on 15/11/5.
//  Copyright © 2015年 patient. All rights reserved.
//

#import "ViewModel.h"
#import <Objection.h>
#import "data.h"

@implementation ViewModel





-(id<NetWorkInterFace>)network
{
    return (id<NetWorkInterFace>)[[JSObjection defaultInjector] getObject:@protocol(NetWorkInterFace)];
}
@end
@implementation networktest

-(id)init
{
    self = [super init];
    if (self) {
//        self.datas = @[];
    }
    return self;
}
-(void)loadData
{
    [self network];
    [[self network] RequestType:@"GET" Url:self.url Callback:^(NSData *data, NSError *error) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray * arraydata = [MTLJSONAdapter modelsOfClass:[self dataClass] fromJSONArray:(NSArray *)dict[@"images"] error:nil];
        self.datas = arraydata;
        self.error = error;
        (arraydata != nil) ? (self.states = ViewModelDataStateDone) : (self.states = ViewModelDataStateError);
    }];
}

-(Class)dataClass{
    NSAssert(NO, @"mast implementation this function in sub class");
    return nil;
}
@end

