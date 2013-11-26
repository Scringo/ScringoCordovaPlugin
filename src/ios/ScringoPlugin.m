//
//  ScringoPlugin.m
//  HelloWorld
//
//  Created by Guy Federovsky on 19/11/13.
//
//

#import <Scringo/Scringo.h>

#import "ScringoPlugin.h"

@interface ScringoPlugin ()
@property (nonatomic, assign) BOOL wasSidebarAdded;
@end

@implementation ScringoPlugin

-(void)pluginInitialize {
    NSLog(@"ScringoPlugin Initialize called");
}

-(void)initWithAppId:(CDVInvokedUrlCommand *)command {
    NSString *appId = [command argumentAtIndex:0];
    NSLog(@"ScringoPlugin: initWithAppId:%@", appId);
    if (appId == nil || [appId length] == 0) {
        NSLog(@"ScringoPlugin: Can't init Scringo with an empty Scringo App Id !!");
        CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"ScringoPlugin: Can't init Scringo with an empty Scringo App Id !!"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        return;
    }

    [Scringo initWithAppId:appId completion:^{
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

-(void)setTestMode:(CDVInvokedUrlCommand *)command {
    BOOL testMode = [[command argumentAtIndex:0 withDefault:[NSNumber numberWithBool:FALSE] andClass:[NSNumber class]] boolValue];
    NSLog(@"ScringoPlugin: setTestMode:%d", testMode);
    [Scringo setTestMode:testMode];
}

-(void)addSidebar:(CDVInvokedUrlCommand *)command {
    BOOL toLeft = [[command argumentAtIndex:0 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    NSLog(@"ScringoPlugin: addSidebar:%d", toLeft);
    [Scringo addSidebar:[UIApplication sharedApplication].keyWindow toLeft:toLeft];
    self.wasSidebarAdded = YES;
}

-(void)openSidebar:(CDVInvokedUrlCommand *)command {
    NSLog(@"ScringoPlugin: openSidebar");
    [Scringo openSidebar];
}

-(void)closeSidebar:(CDVInvokedUrlCommand *)command {
    NSLog(@"ScringoPlugin: closeSidebar");
    [Scringo closeSidebar];
}

-(void)enableSwipeToOpenSidebar:(CDVInvokedUrlCommand *)command {
    NSLog(@"ScringoPlugin: enableSwipeToOpenSidebar");
    [Scringo enableSwipeToOpenSidebar];
}

-(void)disableSwipeToOpenSidebar:(CDVInvokedUrlCommand *)command {
    NSLog(@"ScringoPlugin: disableSwipeToOpenSidebar");
    [Scringo disableSwipeToOpenSidebar];
}

-(void)isSwipeOpenSidebar:(CDVInvokedUrlCommand *)command {
    NSLog(@"ScringoPlugin: isSwipeOpenSidebar");
    BOOL result = [Scringo isSwipeOpenSidebar];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void)isSidebarOpen:(CDVInvokedUrlCommand *)command {
    NSLog(@"ScringoPlugin: isSidebarOpen");
    BOOL result = [Scringo isSidebarOpen];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void)preloadActivity:(CDVInvokedUrlCommand *)command {
    NSLog(@"ScringoPlugin: preloadActivity");
    [Scringo preloadActivityWithCompletion:^{
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

-(void)preloadChatRooms:(CDVInvokedUrlCommand *)command {
    NSLog(@"ScringoPlugin: preloadChatRooms");
    [Scringo preloadChatRoomsWithCompletion:^{
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

-(void)preloadInbox:(CDVInvokedUrlCommand *)command {
    NSLog(@"ScringoPlugin: preloadInbox");
    [Scringo preloadInboxWithCompletion:^{
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

-(void)preloadQuizzes:(CDVInvokedUrlCommand *)command {
    NSLog(@"ScringoPlugin: preloadQuizzes");
    [Scringo preloadQuizzesWithCompletion:^{
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

-(void)openMenu:(CDVInvokedUrlCommand *)command {
    if (self.wasSidebarAdded) {
        NSLog(@"ScringoPlugin: Will NOT open Menu as Sidebar was already added");
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"ScringoPlugin: Will NOT open Menu as Sidebar was already added"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        return;
    }

    BOOL openAsModal = [[command argumentAtIndex:0 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    BOOL useScringoNavController = [[command argumentAtIndex:1 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    NSLog(@"ScringoPlugin: openMenu - openAsModal:%d; useScringoNavController:%d", openAsModal, useScringoNavController);
    
    UINavigationController *navController = (openAsModal ? nil : [self.viewController navigationController]);
    if (navController == nil) {
        useScringoNavController = TRUE;
    }
    [Scringo openMenuWithNavigationController:navController withScringoNavControllerEnabled:useScringoNavController];
}

-(void)openQuiz:(CDVInvokedUrlCommand *)command {
    BOOL openAsModal = [[command argumentAtIndex:0 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    BOOL useScringoNavController = [[command argumentAtIndex:1 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    NSLog(@"ScringoPlugin: openQuiz - openAsModal:%d; useScringoNavController:%d", openAsModal, useScringoNavController);
    
    UINavigationController *navController = (openAsModal ? nil : [self.viewController navigationController]);
    if (navController == nil) {
        useScringoNavController = TRUE;
    }
    [Scringo openQuizWithNavigationController:navController withScringoNavControllerEnabled:useScringoNavController];
}

-(void)openChatRooms:(CDVInvokedUrlCommand *)command {
    BOOL openAsModal = [[command argumentAtIndex:0 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    BOOL useScringoNavController = [[command argumentAtIndex:1 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    NSLog(@"ScringoPlugin: openChatRooms - openAsModal:%d; useScringoNavController:%d", openAsModal, useScringoNavController);
    
    UINavigationController *navController = (openAsModal ? nil : [self.viewController navigationController]);
    if (navController == nil) {
        useScringoNavController = TRUE;
    }
    [Scringo openChatRoomsWithNavigationController:navController withScringoNavControllerEnabled:useScringoNavController];
}

-(void)openInbox:(CDVInvokedUrlCommand *)command {
    BOOL openAsModal = [[command argumentAtIndex:0 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    BOOL useScringoNavController = [[command argumentAtIndex:1 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    NSLog(@"ScringoPlugin: openInbox - openAsModal:%d; useScringoNavController:%d", openAsModal, useScringoNavController);
    
    UINavigationController *navController = (openAsModal ? nil : [self.viewController navigationController]);
    if (navController == nil) {
        useScringoNavController = TRUE;
    }
    [Scringo openInboxWithNavigationController:navController withScringoNavControllerEnabled:useScringoNavController];
}

-(void)openActivity:(CDVInvokedUrlCommand *)command {
    BOOL openAsModal = [[command argumentAtIndex:0 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    BOOL useScringoNavController = [[command argumentAtIndex:1 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    NSLog(@"ScringoPlugin: openActivity - openAsModal:%d; useScringoNavController:%d", openAsModal, useScringoNavController);
    
    UINavigationController *navController = (openAsModal ? nil : [self.viewController navigationController]);
    if (navController == nil) {
        useScringoNavController = TRUE;
    }
    [Scringo openActivityWithNavigationController:navController withScringoNavControllerEnabled:useScringoNavController];
}

-(void)openFeedback:(CDVInvokedUrlCommand *)command {
    BOOL openAsModal = [[command argumentAtIndex:0 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    BOOL useScringoNavController = [[command argumentAtIndex:1 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    NSLog(@"ScringoPlugin: openFeedback - openAsModal:%d; useScringoNavController:%d", openAsModal, useScringoNavController);
    
    UINavigationController *navController = (openAsModal ? nil : [self.viewController navigationController]);
    if (navController == nil) {
        useScringoNavController = TRUE;
    }
    [Scringo openFeedbackWithNavigationController:navController withScringoNavControllerEnabled:useScringoNavController];
}

-(void)openFindInviteFriends:(CDVInvokedUrlCommand *)command {
    BOOL openAsModal = [[command argumentAtIndex:0 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    BOOL useScringoNavController = [[command argumentAtIndex:1 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    NSLog(@"ScringoPlugin: openFindInviteFriends - openAsModal:%d; useScringoNavController:%d", openAsModal, useScringoNavController);
    
    UINavigationController *navController = (openAsModal ? nil : [self.viewController navigationController]);
    if (navController == nil) {
        useScringoNavController = TRUE;
    }
    [Scringo openFindInviteFriendsWithNavigationController:navController withScringoNavControllerEnabled:useScringoNavController];
}

-(void)openLeaderboard:(CDVInvokedUrlCommand *)command {
    BOOL openAsModal = [[command argumentAtIndex:0 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    BOOL useScringoNavController = [[command argumentAtIndex:1 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    NSLog(@"ScringoPlugin: openLeaderboard - openAsModal:%d; useScringoNavController:%d", openAsModal, useScringoNavController);
    
    UINavigationController *navController = (openAsModal ? nil : [self.viewController navigationController]);
    if (navController == nil) {
        useScringoNavController = TRUE;
    }
    [Scringo openLeaderboardWithNavigationController:navController withScringoNavControllerEnabled:useScringoNavController];
}

-(void)openLogin:(CDVInvokedUrlCommand *)command {
    BOOL openAsModal = [[command argumentAtIndex:0 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    BOOL useScringoNavController = [[command argumentAtIndex:1 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    NSLog(@"ScringoPlugin: openLogin - openAsModal:%d; useScringoNavController:%d", openAsModal, useScringoNavController);
    
    UINavigationController *navController = (openAsModal ? nil : [self.viewController navigationController]);
    if (navController == nil) {
        useScringoNavController = TRUE;
    }
    [Scringo openLoginWithNavigationController:navController withScringoNavControllerEnabled:useScringoNavController];
}

-(void)openSignup:(CDVInvokedUrlCommand *)command {
    BOOL openAsModal = [[command argumentAtIndex:0 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    BOOL useScringoNavController = [[command argumentAtIndex:1 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    NSLog(@"ScringoPlugin: openSignup - openAsModal:%d; useScringoNavController:%d", openAsModal, useScringoNavController);
    
    UINavigationController *navController = (openAsModal ? nil : [self.viewController navigationController]);
    if (navController == nil) {
        useScringoNavController = TRUE;
    }
    [Scringo openSignupWithNavigationController:navController withScringoNavControllerEnabled:useScringoNavController];
}

-(void)openMyProfile:(CDVInvokedUrlCommand *)command {
    BOOL openAsModal = [[command argumentAtIndex:0 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    BOOL useScringoNavController = [[command argumentAtIndex:1 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    NSLog(@"ScringoPlugin: openMyProfile - openAsModal:%d; useScringoNavController:%d", openAsModal, useScringoNavController);
    
    UINavigationController *navController = (openAsModal ? nil : [self.viewController navigationController]);
    if (navController == nil) {
        useScringoNavController = TRUE;
    }
    [Scringo openMyProfileWithNavigationController:navController withScringoNavControllerEnabled:useScringoNavController];
}

-(void)openRadar:(CDVInvokedUrlCommand *)command {
    BOOL openAsModal = [[command argumentAtIndex:0 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    BOOL useScringoNavController = [[command argumentAtIndex:1 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    NSLog(@"ScringoPlugin: openRadar - openAsModal:%d; useScringoNavController:%d", openAsModal, useScringoNavController);
    
    UINavigationController *navController = (openAsModal ? nil : [self.viewController navigationController]);
    if (navController == nil) {
        useScringoNavController = TRUE;
    }
    [Scringo openRadarWithNavigationController:navController withScringoNavControllerEnabled:useScringoNavController];
}

-(void)openTalkToUs:(CDVInvokedUrlCommand *)command {
    BOOL openAsModal = [[command argumentAtIndex:0 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    BOOL useScringoNavController = [[command argumentAtIndex:1 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    NSLog(@"ScringoPlugin: openTalkToUs - openAsModal:%d; useScringoNavController:%d", openAsModal, useScringoNavController);
    
    UINavigationController *navController = (openAsModal ? nil : [self.viewController navigationController]);
    if (navController == nil) {
        useScringoNavController = TRUE;
    }
    [Scringo openTalkToUsWithNavigationController:navController withScringoNavControllerEnabled:useScringoNavController];
}

-(void)openChatRoomWithTopicId:(CDVInvokedUrlCommand *)command {
    int topicId = [[command argumentAtIndex:0 withDefault:[NSNumber numberWithInt:-1] andClass:[NSNumber class]] intValue];
    if (topicId < 0) {
        NSLog(@"ScringoPlugin: Got illegal Chat Room Topic Id (%d)", topicId);
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:@"ScringoPlugin: Got illegal Chat Room Topic Id (%d)", topicId]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        return;
    }

    BOOL openAsModal = [[command argumentAtIndex:1 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    BOOL useScringoNavController = [[command argumentAtIndex:2 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    NSLog(@"ScringoPlugin: openChatRoomWithTopicId - openAsModal:%d; useScringoNavController:%d", openAsModal, useScringoNavController);
    
    UINavigationController *navController = (openAsModal ? nil : [self.viewController navigationController]);
    if (navController == nil) {
        useScringoNavController = TRUE;
    }
    [Scringo openChatRoomWithTopicId:topicId withNavigationController:navController withScringoNavControllerEnabled:useScringoNavController];
}

-(void)openChatWithUser:(CDVInvokedUrlCommand *)command {
    NSString *userId = [command argumentAtIndex:0 withDefault:@"" andClass:[NSString class]];
    if (userId == nil || [userId length] == 0) {
        NSLog(@"ScringoPlugin: Got an empty Scringo User Id");
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"ScringoPlugin: Got an empty Scringo User Id"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        return;
    }
    
    BOOL openAsModal = [[command argumentAtIndex:1 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    BOOL useScringoNavController = [[command argumentAtIndex:2 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    NSLog(@"ScringoPlugin: openChatWithUser - openAsModal:%d; useScringoNavController:%d", openAsModal, useScringoNavController);
    
    UINavigationController *navController = (openAsModal ? nil : [self.viewController navigationController]);
    if (navController == nil) {
        useScringoNavController = TRUE;
    }
    [Scringo openChatWithUser:userId withNavigationController:navController withScringoNavControllerEnabled:useScringoNavController];
}

-(void)openProfileForUser:(CDVInvokedUrlCommand *)command {
    NSString *userId = [command argumentAtIndex:0 withDefault:@"" andClass:[NSString class]];
    if (userId == nil || [userId length] == 0) {
        NSLog(@"ScringoPlugin: Got an empty Scringo User Id");
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"ScringoPlugin: Got an empty Scringo User Id"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        return;
    }
    
    BOOL openAsModal = [[command argumentAtIndex:1 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    BOOL useScringoNavController = [[command argumentAtIndex:2 withDefault:[NSNumber numberWithBool:TRUE] andClass:[NSNumber class]] boolValue];
    NSLog(@"ScringoPlugin: openProfileForUser - openAsModal:%d; useScringoNavController:%d", openAsModal, useScringoNavController);
    
    UINavigationController *navController = (openAsModal ? nil : [self.viewController navigationController]);
    if (navController == nil) {
        useScringoNavController = TRUE;
    }
    [Scringo openProfileForUser:userId withNavigationController:navController withScringoNavControllerEnabled:useScringoNavController];
}

// Facebook integration
-(void)handleOpenURL:(NSNotification *)notification {
    NSLog(@"ScringoPlugin: handleOpenUrl");
    NSURL* url = [notification object];
    if (![url isKindOfClass:[NSURL class]]) {
        return;
    }

    [Scringo handleOpenURL:url];
}

-(void)connectFacebook:(CDVInvokedUrlCommand *)command {
    NSLog(@"ScringoPlugin: connectFacebook");
    [Scringo connectFacebook];
}

-(void)disconnectFacebook:(CDVInvokedUrlCommand *)command {
    NSLog(@"ScringoPlugin: disconnectFacebook");
    [Scringo disconnectFacebook];
}

// Activity Feed post
-(void)postToFeed:(CDVInvokedUrlCommand *)command {
    NSString *message = [command argumentAtIndex:0 withDefault:@"" andClass:[NSString class]];
    if (message == nil || [message length] == 0) {
        NSLog(@"ScringoPlugin: Got an empty Message");
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"ScringoPlugin: Got an empty Message"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        return;
    }
    
    NSLog(@"ScringoPlugin: postToFeed");
    [Scringo postToFeed:message];
}

-(void)postToFeedWithLink:(CDVInvokedUrlCommand *)command {
    NSString *message = [command argumentAtIndex:0 withDefault:@"" andClass:[NSString class]];
    NSString *link = [command argumentAtIndex:1 withDefault:@"" andClass:[NSString class]];
    if (message == nil || [message length] == 0 || link == nil || [link length] == 0) {
        NSLog(@"ScringoPlugin: Got an empty Message or Link");
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"ScringoPlugin: Got an empty Message or Link"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        return;
    }
    
    NSLog(@"ScringoPlugin: postToFeedWithLink");
    [Scringo postToFeed:message withLink:link];
}

-(void)postToFeedWithImage:(CDVInvokedUrlCommand *)command {
    NSString *message = [command argumentAtIndex:0 withDefault:@"" andClass:[NSString class]];
    NSString *imageUrl = [command argumentAtIndex:1 withDefault:@"" andClass:[NSString class]];
    if (message == nil || [message length] == 0 || imageUrl == nil || [imageUrl length] == 0) {
        NSLog(@"ScringoPlugin: Got an empty Message or Image URL");
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"ScringoPlugin: Got an empty Message or image URL"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        return;
    }
    NSString *description = [command argumentAtIndex:2 withDefault:@"" andClass:[NSString class]];
    NSString *subDesc = [command argumentAtIndex:3 withDefault:@"" andClass:[NSString class]];
    NSString *actionVerb = [command argumentAtIndex:4 withDefault:@"" andClass:[NSString class]];
    NSString *actionId = [command argumentAtIndex:5 withDefault:@"" andClass:[NSString class]];
    
    NSLog(@"ScringoPlugin: postToFeedWithImage");
    [Scringo postToFeed:message withImage:imageUrl withDescription:description withSubDesc:subDesc withActionVerb:actionVerb withActionId:actionId];
}

// Model
-(void)getFeatureBadgeNumber:(CDVInvokedUrlCommand *)command {
    int featureId = [[command argumentAtIndex:0 withDefault:[NSNumber numberWithInt:SCRINGO_FEATURE_UNKNOWN] andClass:[NSNumber class]] intValue];
    if (featureId == SCRINGO_FEATURE_UNKNOWN) {
        NSLog(@"ScringoPlugin: Got illegal feature Id (%d)", featureId);
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:@"ScringoPlugin: Got illegal feature Id (%d)", featureId]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        return;
    }
    
    NSLog(@"ScringoPlugin: getFeatureBadgeNumber (%d)", featureId);
    int badgeNumber = [Scringo getFeatureBadgeNumber:featureId];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:badgeNumber];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void)getChatRoomTopics:(CDVInvokedUrlCommand *)command {
    NSLog(@"ScringoPlugin: getChatRoomTopics");
    NSArray *chatRooms = [Scringo getChatRoomTopics];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:chatRooms];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void)setUserScore:(CDVInvokedUrlCommand *)command {
    long score = [[command argumentAtIndex:0 withDefault:[NSNumber numberWithLong:0] andClass:[NSNumber class]] longValue];
    NSString *level = [command argumentAtIndex:1 withDefault:@"" andClass:[NSString class]];
    NSLog(@"ScringoPlugin: setUserScore");
    [Scringo setUserScore:score withLevel:level];
}

@end
