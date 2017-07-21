//
//  WZHTTPSessionManager.h
//  RongCloudSingleChat
//
//  Created by CollegeDayly on 2017/7/21.
//  Copyright © 2017年 weizhidaoshuo. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface WZSessionManager : AFHTTPSessionManager

+ (instancetype)shareManager;

@end
