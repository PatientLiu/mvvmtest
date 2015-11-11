//
//  NetWorkInterFace.h
//  testPL
//
//  Created by 刘璞峰 on 15/11/9.
//  Copyright © 2015年 patient. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetWorkInterFace <NSObject>
#define NetWorkinterface @"NetWork"
-(void)RequestType:(NSString *)type Url:(NSString *)url Callback:(void (^) (id ,NSError *))callback;

@end
