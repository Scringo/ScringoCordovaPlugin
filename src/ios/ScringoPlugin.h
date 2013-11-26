//
//  ScringoPlugin.h
//  HelloWorld
//
//  Created by Guy Federovsky on 19/11/13.
//
//

#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface ScringoPlugin : CDVPlugin

-(void)initWithAppId:(CDVInvokedUrlCommand *)command;
-(void)setTestMode:(CDVInvokedUrlCommand *)command;

// Sidebar methods
-(void)addSidebar:(CDVInvokedUrlCommand *)command;
-(void)openSidebar:(CDVInvokedUrlCommand *)command;
-(void)closeSidebar:(CDVInvokedUrlCommand *)command;
-(void)enableSwipeToOpenSidebar:(CDVInvokedUrlCommand *)command;
-(void)disableSwipeToOpenSidebar:(CDVInvokedUrlCommand *)command;
-(void)isSwipeOpenSidebar:(CDVInvokedUrlCommand *)command;
-(void)isSidebarOpen:(CDVInvokedUrlCommand *)command;

// Feature methods
-(void)openMenu:(CDVInvokedUrlCommand *)command;

-(void)preloadInbox:(CDVInvokedUrlCommand *)command;
-(void)preloadActivity:(CDVInvokedUrlCommand *)command;
-(void)preloadChatRooms:(CDVInvokedUrlCommand *)command;
-(void)preloadQuizzes:(CDVInvokedUrlCommand *)command;

-(void)openQuiz:(CDVInvokedUrlCommand *)command;
-(void)openInbox:(CDVInvokedUrlCommand *)command;;
-(void)openChatRooms:(CDVInvokedUrlCommand *)command;
-(void)openFeedback:(CDVInvokedUrlCommand *)command;
-(void)openRadar:(CDVInvokedUrlCommand *)command;
-(void)openLeaderboard:(CDVInvokedUrlCommand *)command;
-(void)openActivity:(CDVInvokedUrlCommand *)command;
-(void)openLogin:(CDVInvokedUrlCommand *)command;
-(void)openSignup:(CDVInvokedUrlCommand *)command;
-(void)openMyProfile:(CDVInvokedUrlCommand *)command;
-(void)openTalkToUs:(CDVInvokedUrlCommand *)command;
-(void)openFindInviteFriends:(CDVInvokedUrlCommand *)command;

-(void)openChatRoomWithTopicId:(CDVInvokedUrlCommand *)command;
-(void)openChatWithUser:(CDVInvokedUrlCommand *)command;
-(void)openProfileForUser:(CDVInvokedUrlCommand *)command;

// Model
-(void)getFeatureBadgeNumber:(CDVInvokedUrlCommand *)command;
-(void)getChatRoomTopics:(CDVInvokedUrlCommand *)command;

// Facebook connectivity
-(void)connectFacebook:(CDVInvokedUrlCommand *)command;
-(void)disconnectFacebook:(CDVInvokedUrlCommand *)command;

// Post to Activity Feed
-(void)postToFeed:(CDVInvokedUrlCommand *)command;
-(void)postToFeedWithLink:(CDVInvokedUrlCommand *)command;
-(void)postToFeedWithImage:(CDVInvokedUrlCommand *)command;

-(void)setUserScore:(CDVInvokedUrlCommand *)command;

@end
