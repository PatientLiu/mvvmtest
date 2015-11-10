//
//  NetWork.h
//  testPL
//
//  Created by 刘璞峰 on 15/11/9.
//  Copyright © 2015年 patient. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkInterFace.h"

@interface NetWork : NSObject<NetWorkInterFace>

@property (assign,nonatomic) NSInteger statusCodes;


@end
