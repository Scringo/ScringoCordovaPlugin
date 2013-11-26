Scringo Plugin for Apache Cordova
=====================================
created by Guy Federovsky (guy@scringo.com)

Follows the [Cordova Plugin spec](http://cordova.apache.org/docs/en/3.0.0/plugin_ref_spec.md), so that it works with [Plugman](https://github.com/apache/cordova-plugman)
To import the plugin please use [Plugman](http://npmjs.org/plugman)     or the [Cordova CLI tool](http://npmjs.org/cordova)    

The "scringo" variable is installed globally. 

// Initialize Scringo with your App Id first
scringo.initWithAppId("YOUR SCRINGO APP ID", function() {console.log("Scringo is now initialized");});

/*
 Add Scringo's Sidebar.
 @param toLeft Is the Sidebar situated to the left (true) or to the right (false).
*/
scringo.addSidebar(toLeft);
        
/*
 Open Scringo's Sidebar. Note that the sidebar should be added first, using scringo.addSidebar(toLeft);.
*/
scringo.openSidebar();
        
/*
 Set Scringo's test mode.
 @param isInTestMode Whether test mode is active (true) or not (false).
*/
scringo.setTestMode(isInTestMode);
