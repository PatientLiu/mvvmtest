//
//  ViewModel.h
//  testPL
//
//  Created by 刘璞峰 on 15/11/5.
//  Copyright © 2015年 patient. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkInterFace.h"

typedef NS_ENUM(NSUInteger, ViewModelDataState) {
    //    ViewModelDataStateUnknow,
    ViewModelDataStateDone,
    ViewModelDataStateError
};

@interface ViewModel : NSObject

@property (readonly) id<NetWorkInterFace> network;
@property (nonatomic,strong) NSString * url;
@property (nonatomic,strong) NSArray *datas;
@property (nonatomic,strong) NSError *error;
@property (nonatomic,assign) ViewModelDataState states;

@end

@interface networktest : ViewModel
-(Class)dataClass;
-(void) loadData;

@end