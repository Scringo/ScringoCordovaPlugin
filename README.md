Scringo Plugin for Phonegap (Apache Cordova)
============================================
Created by Guy Federovsky (guy@scringo.com)

Follows the [Cordova Plugin spec](http://cordova.apache.org/docs/en/3.0.0/plugin_ref_spec.md), so that it works with [Plugman](https://github.com/apache/cordova-plugman).  
To import the plugin please use [Plugman](http://npmjs.org/plugman) or the [Cordova CLI tool](http://npmjs.org/cordova).  

Note: For this to work you need to download and install **Scringo SDK** within your project. Please see http://docs.scringo.com/ios-guides/hello/ for more details.  
Note: **iOS only** for now  

The "scringo" variable is installed globally.

Quick Example (initialization and Sidebar adding)
-------------------------------------------------
```js
scringo.initWithAppId("YOUR SCRINGO APP ID",  
                      function() {  
                      	console.log("Done Init Scringo");  
                      	scringo.addSidebar(toLeft);  
                      },  
                      function(errorMessage) {  
                      	alert("Scringo failed to start: " + errorMessage);  
                      });  
scringo.setTestMode(1);  
```

Full Example
------------
```html
<!DOCTYPE html>
<html>
    <head>
        <title>Cordova Scringo Example</title>
        
        <script type="text/javascript" charset="utf-8" src="phonegap.js"></script>
        <script type="text/javascript" charset="utf-8">
            
        var deviceReady = false;
            
        /**
         * Function called when page has finished loading.
         */
        function init() {
            document.addEventListener("deviceready", function() {
                                      scringo.initWithAppId("TEST_APP", function() {
                                                            console.log("Done Init Scringo");
                                                            }, function(errorMessage) {
                                                            alert("Scringo failed to start: " + errorMessage);
                                                            });
                                      scringo.setTestMode(1);
                                        deviceReady = true;
                                        console.log("Device="+device.platform+" "+device.version);
                                      },
                                      false);
            window.setTimeout(function() {
                                if (!deviceReady) {
                                    alert("Error: Apache Cordova did not initialize.  Demo will not run correctly.");
                                }
                              },
                              1000);
        }
        
        function addScringo() {
            scringo.addSidebar(1);
        }

        function openScringo() {
            scringo.isSidebarOpen(function(isOpen) {
                                    if (!isOpen) {
                                        scringo.openSidebar();
                                    }
                                  });
        }
        
        function openMenu() {
            scringo.openMenu(function(errorMessage) {alert("Failed opening Scringo Menu: " + errorMessage);}, 0, 0);
        }
        
        function preloadQuizzes() {
            scringo.preloadQuizzes(function() {alert("Quizzes were preloaded");});
        }

        function openQuiz() {
            scringo.openQuiz(1, 1);
        }

        function preloadChatRooms() {
            scringo.preloadChatRooms(function() {alert("Chat Rooms were preloaded");});
        }
        
        function openChatRooms() {
            scringo.openChatRooms(1, 1);
        }
        
        function openMyProfile() {
            scringo.openMyProfile(1, 1);
        }
        
        function postToFeed() {
            scringo.postToFeed("Testing Phonegap client", function(errorMessage) {alert(errorMessage);});
        }
        
        function getInboxBadgeNumber() {
            scringo.getFeatureBadgeNumber(1, function(badge) {alert("Inbox badge is " + badge);}, function(errorMessage) {alert(errorMessage);});
        }
        
        function openChatWithTestUser() {
            scringo.openChatWithUser("testUser2", 1, 1, function(errorMessage) {alert(errorMessage);});
        }
        
        </script>
        
    </head>
    <body onload="init();" id="stage" class="theme">
        
        <h1>Scringo Sample</h1>
        <h2>Sidebar</h2>
        <div class="btn large" onclick="addScringo();">Add Scringo Sidebar</div>
        <div class="btn large" onclick="openScringo();">Open Scringo Sidebar</div>
        <h2>Screens</h2>
        <div class="btn large" onclick="openMenu();">Open Menu</div>
        <div class="btn large" onclick="openQuiz();">Open Quizzes</div>
        <div class="btn large" onclick="openMyProfile();">Open My Profile</div>
        <div class="btn large" onclick="preloadChatRooms();">Preload Chat Rooms</div>
        <div class="btn large" onclick="openChatRooms();">Open Chat Rooms</div>
        <h2>Advanced</h2>
        <div class="btn large" onclick="postToFeed();">Post To Feed</div>
        <div class="btn large" onclick="getInboxBadgeNumber();">Get Inbox Badge Number</div>
        <div class="btn large" onclick="openChatWithTestUser();">open Chat With Test User</div>
        <h2> </h2><div class="backBtn" onclick="backHome();">Back</div>
    </body>
</html>
```
