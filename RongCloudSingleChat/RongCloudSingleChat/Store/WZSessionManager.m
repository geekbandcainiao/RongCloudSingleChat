//
//  WZHTTPSessionManager.m
//  RongCloudSingleChat
//
//  Created by CollegeDayly on 2017/7/21.
//  Copyright © 2017年 weizhidaoshuo. All rights reserved.
//

#import "WZHTTPSessionManager.h"

@implementation WZHTTPSessionManager

+ (instancetype)shareManager
{
	static WZHTTPSessionManager *_shareManager = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_shareManager = [[self alloc] init];
		_shareManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
	});
	return _shareManager;
}

@end
