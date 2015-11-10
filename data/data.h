//
//  data.h
//  testPL
//
//  Created by 刘璞峰 on 15/11/5.
//  Copyright © 2015年 patient. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

@interface data : MTLModel<MTLJSONSerializing>

+(instancetype)dataClass:(Class)class withJson:(NSDictionary *)json;


@end
