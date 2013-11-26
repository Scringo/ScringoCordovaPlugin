
    var cordova = require('cordova'),
        exec = require('cordova/exec');

    var Scringo = function() {
        var self = this;
        this.isInstalled = false;
    }

    Scringo.prototype.initWithAppId = function(appId, successCallback, errorCallback) {
        exec(successCallback, errorCallback, "Scringo", "initWithAppId", [appId]);
    };

    Scringo.prototype.setTestMode = function(testMode) {
        exec(null, null, "Scringo", "setTestMode", [testMode]);
    };

    Scringo.prototype.addSidebar = function(toLeft) {
        exec(null, null, "Scringo", "addSidebar", [toLeft]);
    };

    Scringo.prototype.openSidebar = function() {
        exec(null, null, "Scringo", "openSidebar", []);
    };

    Scringo.prototype.closeSidebar = function() {
        exec(null, null, "Scringo", "closeSidebar", []);
    };

    Scringo.prototype.enableSwipeToOpenSidebar = function() {
        exec(null, null, "Scringo", "enableSwipeToOpenSidebar", []);
    };

    Scringo.prototype.disableSwipeToOpenSidebar = function() {
        exec(null, null, "Scringo", "disableSwipeToOpenSidebar", []);
    };

    Scringo.prototype.isSwipeOpenSidebar = function(successCallback) {
        exec(successCallback, null, "Scringo", "isSwipeOpenSidebar", []);
    };

    Scringo.prototype.isSidebarOpen = function(successCallback) {
        exec(successCallback, null, "Scringo", "isSidebarOpen", []);
    };
    
    Scringo.prototype.preloadActivity = function(successCallback) {
    	exec(successCallback, null, "Scringo", "preloadActivity", []);
    }
               
    Scringo.prototype.preloadChatRooms = function(successCallback) {
    	exec(successCallback, null, "Scringo", "preloadChatRooms", []);
    }
               
    Scringo.prototype.preloadInbox = function(successCallback) {
    	exec(successCallback, null, "Scringo", "preloadInbox", []);
    }
               
    Scringo.prototype.preloadQuizzes = function(successCallback) {
    	exec(successCallback, null, "Scringo", "preloadQuizzes", []);
    }
               
    Scringo.prototype.openMenu = function(errorCallback, openAsModal, useScringoNavController) {
        exec(null, errorCallback, "Scringo", "openMenu", [1, useScringoNavController]);
    }
               
    Scringo.prototype.openQuiz = function(openAsModal, useScringoNavController) {
        exec(null, null, "Scringo", "openQuiz", [1, useScringoNavController]);
    }
               
    Scringo.prototype.openInbox = function(openAsModal, useScringoNavController) {
        exec(null, null, "Scringo", "openInbox", [1, useScringoNavController]);
    }
               
    Scringo.prototype.openChatWithUser = function(userId, openAsModal, useScringoNavController, errorCallback) {
        exec(null, errorCallback, "Scringo", "openChatWithUser", [userId, 1, useScringoNavController]);
    }
               
    Scringo.prototype.openChatRooms = function(openAsModal, useScringoNavController) {
        exec(null, null, "Scringo", "openChatRooms", [1, useScringoNavController]);
    }
               
    Scringo.prototype.openChatRoomWithTopicId = function(topicId, openAsModal, useScringoNavController, errorCallback) {
        exec(null, errorCallback, "Scringo", "openChatRoomWithTopicId", [topicId, 1, useScringoNavController]);
    }
               
    Scringo.prototype.openRadar = function(openAsModal, useScringoNavController) {
        exec(null, null, "Scringo", "openRadar", [1, useScringoNavController]);
    }
               
    Scringo.prototype.openFeedback = function(openAsModal, useScringoNavController) {
        exec(null, null, "Scringo", "openFeedback", [1, useScringoNavController]);
    }
               
    Scringo.prototype.openLeaderboard = function(openAsModal, useScringoNavController) {
        exec(null, null, "Scringo", "openLeaderboard", [1, useScringoNavController]);
    }
               
    Scringo.prototype.openActivity = function(openAsModal, useScringoNavController) {
        exec(null, null, "Scringo", "openActivity", [1, useScringoNavController]);
    }
               
    Scringo.prototype.openTalkToUs = function(openAsModal, useScringoNavController) {
        exec(null, null, "Scringo", "openTalkToUs", [1, useScringoNavController]);
    }
               
    Scringo.prototype.openMyProfile = function(openAsModal, useScringoNavController) {
        exec(null, null, "Scringo", "openMyProfile", [1, useScringoNavController]);
    }
               
    Scringo.prototype.openProfileForUser = function(userId, openAsModal, useScringoNavController, errorCallback) {
        exec(null, errorCallback, "Scringo", "openProfileForUser", [userId, 1, useScringoNavController]);
    }

    Scringo.prototype.openFindInviteFriends = function(openAsModal, useScringoNavController) {
        exec(null, null, "Scringo", "openFindInviteFriends", [1, useScringoNavController]);
    }

    Scringo.prototype.openLogin = function(openAsModal, useScringoNavController) {
        exec(null, null, "Scringo", "openLogin", [1, useScringoNavController]);
    }

    Scringo.prototype.openSignup = function(openAsModal, useScringoNavController) {
        exec(null, null, "Scringo", "openSignup", [1, useScringoNavController]);
    }

    Scringo.prototype.connectFacebook = function() {
    	exec(null, null, "Scringo", "connectFacebook", []);
    }

    Scringo.prototype.disconnectFacebook = function() {
    	exec(null, null, "Scringo", "disconnectFacebook", []);
    }

    Scringo.prototype.setUserScore = function(score, level) {
    	exec(null, null, "Scringo", "setUserScore", [score, level]);
    }

    Scringo.prototype.postToFeed = function(message, errorCallback) {
    	exec(null, errorCallback, "Scringo", "postToFeed", [message]);
    }

    Scringo.prototype.postToFeedWithLink = function(message, link, errorCallback) {
    	exec(null, errorCallback, "Scringo", "postToFeedWithLink", [message, link]);
    }

    Scringo.prototype.postToFeedWithImage = function(message, imageUrl, description, subDesc, actionVerb, actionId, errorCallback) {
    	exec(null, errorCallback, "Scringo", "postToFeedWithImage", [message, imageUrl, description, subDesc, actionVerb, actionId]);
    }
    
    Scringo.prototype.getFeatureBadgeNumber = function(featureId, successCallback, errorCallback) {
    	exec(successCallback, errorCallback, "Scringo", "getFeatureBadgeNumber", [featureId]);
    }
    
    Scringo.prototype.getChatRoomTopics = function(successCallback) {
    	exec(successCallback, null, "Scringo", "getChatRoomTopics", []);
    }

    var scringo = new Scringo();

    module.exports = scringo;

