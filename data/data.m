//
//  data.m
//  testPL
//
//  Created by 刘璞峰 on 15/11/5.
//  Copyright © 2015年 patient. All rights reserved.
//

#import "data.h"
@implementation data
+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{};
}
+(instancetype)dataClass:(Class)class withJson:(NSDictionary *)json
{
    NSError *error = nil;
    data *data = [MTLJSONAdapter modelOfClass:class fromJSONDictionary:json error:&error];
    NSLog(@"%@",error);
    return data;
}

@end
