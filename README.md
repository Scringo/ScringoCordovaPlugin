Scringo Plugin for Phonegap (Apache Cordova)
============================================
Created by Guy Federovsky (guy@scringo.com)

Follows the [Cordova Plugin spec](http://cordova.apache.org/docs/en/3.0.0/plugin_ref_spec.md), so that it works with [Plugman](https://github.com/apache/cordova-plugman)
To import the plugin please use [Plugman](http://npmjs.org/plugman)     or the [Cordova CLI tool](http://npmjs.org/cordova)

Note: For this to work you need to download and install Scringo SDK within your project. Please see http://docs.scringo.com/ios-guides/hello/ for more details.

The "scringo" variable is installed globally.

Sample Scringo initialisation and Sidebar adding:

scringo.initWithAppId("TEST_APP",
                      function() {
                      	console.log("Done Init Scringo");
                      	scringo.addSidebar(toLeft);
                      },
                      function(errorMessage) {
                      	alert("Scringo failed to start: " + errorMessage);
                      });
scringo.setTestMode(1);
