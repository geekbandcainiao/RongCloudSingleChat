//
//  WZChatListController.m
//  RongCloudSingleChat
//
//  Created by CollegeDayly on 2017/7/21.
//  Copyright © 2017年 weizhidaoshuo. All rights reserved.
//

#import "WZChatListController.h"

#import "WZSingleChatController.h"

@interface WZChatListController ()

@end

@implementation WZChatListController

- (instancetype)init
{
	self = [super init];
	if (self) {
		[self setDisplayConversationTypes:@[@(ConversationType_PRIVATE)]];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		[self setDisplayConversationTypes:@[@(ConversationType_PRIVATE)]];
	}
	return self;
}

#pragma mark 点击cell

- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath
{
	//默认会话
	if (conversationModelType == RC_CONVERSATION_MODEL_TYPE_NORMAL) {
		WZSingleChatController *wzscc = [[WZSingleChatController alloc] init];
		[self.navigationController pushViewController:wzscc animated:YES];
		wzscc.conversationType = model.conversationType;
		wzscc.targetId = model.targetId;
		//单聊
		if (model.conversationType == ConversationType_PRIVATE) {
			wzscc.displayUserNameInCell = NO; //不显示发送方名字
		}
		[self.navigationController pushViewController:wzscc animated:YES];
	}
	
	//从数据库中读取会话列表数据，并刷新会话列表
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)),dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
			[self refreshConversationTableViewIfNeeded];
		});
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.conversationListTableView.tableFooterView = [[UIView alloc] init];
	self.showConnectingStatusOnNavigatorBar = YES; //在导航栏显示连接中
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

@end
