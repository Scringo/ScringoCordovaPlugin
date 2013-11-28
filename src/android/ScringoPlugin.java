/**
 * 
 */
package com.scringo.cordova.plugin;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

import android.util.Log;

import com.scringo.Scringo;
import com.scringo.ScringoEventHandler;

/**
 * @author Guy Federovsky (guy@scringo.com)
 *
 */
public class ScringoPlugin extends CordovaPlugin {

	private Scringo scringo;
	private boolean wasSidebarAdded;
	private boolean started;

	/**
	 * 
	 */
	public ScringoPlugin() {
		scringo = null;
		wasSidebarAdded = false;
		started = false;
	}
	
	@Override
	public void onResume(boolean multitasking) {
		Log.i("GFGF", "ScringoPlugin:onResume");
		super.onResume(multitasking);
		if (! started && scringo != null) {
			Log.i("GFGF", "ScringoPlugin:called scringo.onStart");
			scringo.onStart();
			started = true;
		}
	}
	
	@Override
	public void onPause(boolean multitasking) {
		Log.i("GFGF", "ScringoPlugin:onPause");
		super.onPause(multitasking);
		if (started && scringo != null) {
			Log.i("GFGF", "ScringoPlugin:called scringo.onStop");
			scringo.onStop();
			started = false;
		}
	}

	@Override
	public boolean execute(String action, JSONArray args, final CallbackContext callbackContext) throws JSONException {
		boolean result = false;
		if (action.equals("initWithAppId")) {
			String appId = args.getString(0);
			if (appId == null || appId.length() == 0) {
				callbackContext.error("ScringoPlugin: Can't init Scringo with an empty Scringo App Id !!");
			} else {
				Scringo.setAppId(appId);
				scringo = new Scringo(cordova.getActivity());
				scringo.init(new ScringoEventHandler() {
					@Override
					public void onInitCompleted() {
						scringo.onStart();
						started = true;
						callbackContext.success();
					}
				});
			}
			result = true;
		} else if (action.equals("setTestMode")) {
			boolean isDebug = args.getBoolean(0);
			Scringo.setDebugMode(isDebug);
			result = true;
		} else if (action.equals("addSidebar")) {
			if (scringo != null && ! wasSidebarAdded) {
				cordova.getActivity().runOnUiThread(new Runnable() {
					@Override
					public void run() {
						scringo.addSidebar();
						if (started) {
							scringo.onStop();
						}
						scringo.onStart();
						started = true;
						wasSidebarAdded = true;
					}
				});
			}
			result = true;
		} else if (action.equals("openSidebar")) {
			if (scringo != null && ! scringo.isSidebarOpen()) {
				cordova.getActivity().runOnUiThread(new Runnable() {
					@Override
					public void run() {
						scringo.openSidebar();
					}
				});
			}
			result = true;
		} else if (action.equals("closeSidebar")) {
			if (scringo != null && scringo.isSidebarOpen()) {
				cordova.getActivity().runOnUiThread(new Runnable() {
					@Override
					public void run() {
						scringo.closeSidebar();
					}
				});
			}
			result = true;
		} else if (action.equals("enableSwipeToOpenSidebar")) {
			if (scringo != null) {
				scringo.enableSwipeToOpenSidebar();
				result = true;
			}
		} else if (action.equals("disableSwipeToOpenSidebar")) {
			if (scringo != null) {
				scringo.disableSwipeToOpenSidebar();
				result = true;
			}
		} else if (action.equals("isSwipeOpenSidebar")) {
			if (scringo != null) {
				boolean val = scringo.isSwipeOpenSidebar();
				callbackContext.success((val ? 1 : 0));
				result = true;
			}
		} else if (action.equals("isSidebarOpen")) {
			if (scringo != null) {
				boolean val = scringo.isSidebarOpen();
				callbackContext.success((val ? 1 : 0));
				result = true;
			}
		} else if (action.equals("openMenu")) {
			cordova.getActivity().runOnUiThread(new Runnable() {
				@Override
				public void run() {
					Scringo.openMenu(cordova.getActivity());
				}
			});
			result = true;
		} else if (action.equals("openQuiz")) {
			cordova.getActivity().runOnUiThread(new Runnable() {
				@Override
				public void run() {
					Scringo.openQuiz(cordova.getActivity());
				}
			});
			result = true;
		} else if (action.equals("openInbox")) {
			cordova.getActivity().runOnUiThread(new Runnable() {
				@Override
				public void run() {
					Scringo.openInbox(cordova.getActivity());
				}
			});
			result = true;
		} else if (action.equals("openChatRooms")) {
			cordova.getActivity().runOnUiThread(new Runnable() {
				@Override
				public void run() {
					Scringo.openChatRooms(cordova.getActivity());
				}
			});
			result = true;
		} else if (action.equals("openRadar")) {
			cordova.getActivity().runOnUiThread(new Runnable() {
				@Override
				public void run() {
					Scringo.openRadar(cordova.getActivity());
				}
			});
			result = true;
		} else if (action.equals("openFeedback")) {
			cordova.getActivity().runOnUiThread(new Runnable() {
				@Override
				public void run() {
					Scringo.openFeedback(cordova.getActivity());
				}
			});
			result = true;
		} else if (action.equals("openLeaderboard")) {
			cordova.getActivity().runOnUiThread(new Runnable() {
				@Override
				public void run() {
					Scringo.openLeaderboard(cordova.getActivity());
				}
			});
			result = true;
		} else if (action.equals("openActivity")) {
			cordova.getActivity().runOnUiThread(new Runnable() {
				@Override
				public void run() {
					Scringo.openActivityFeed(cordova.getActivity());
				}
			});
			result = true;
		} else if (action.equals("openTalkToUs")) {
			cordova.getActivity().runOnUiThread(new Runnable() {
				@Override
				public void run() {
					Scringo.openTalkToUs(cordova.getActivity());
				}
			});
			result = true;
		} else if (action.equals("openMyProfile")) {
			cordova.getActivity().runOnUiThread(new Runnable() {
				@Override
				public void run() {
					Scringo.openMyProfile(cordova.getActivity());
				}
			});
			result = true;
		} else if (action.equals("openFindInviteFriends")) {
			cordova.getActivity().runOnUiThread(new Runnable() {
				@Override
				public void run() {
					Scringo.openFindFriends(cordova.getActivity());
				}
			});
			result = true;
		} else if (action.equals("openLogin")) {
			cordova.getActivity().runOnUiThread(new Runnable() {
				@Override
				public void run() {
					Scringo.openLogin(cordova.getActivity());
				}
			});
			result = true;
		} else if (action.equals("openSignup")) {
			cordova.getActivity().runOnUiThread(new Runnable() {
				@Override
				public void run() {
					Scringo.openSignup(cordova.getActivity());
				}
			});
			result = true;
		} else if (action.equals("openChatWithUser")) {
			final String otherUserId = args.getString(0);
			if (otherUserId == null || otherUserId.length() == 0) {
				callbackContext.error("ScringoPlugin: Got an empty Scringo User Id");
			} else {
				cordova.getActivity().runOnUiThread(new Runnable() {
					@Override
					public void run() {
						Scringo.openChat(cordova.getActivity(), otherUserId);
					}
				});
				result = true;
			}
		} else if (action.equals("openProfileForUser")) {
			final String otherUserId = args.getString(0);
			if (otherUserId == null || otherUserId.length() == 0) {
				callbackContext.error("ScringoPlugin: Got an empty Scringo User Id");
			} else {
				cordova.getActivity().runOnUiThread(new Runnable() {
					@Override
					public void run() {
						Scringo.openProfile(cordova.getActivity(), otherUserId);
					}
				});
				result = true;
			}
		} else if (action.equals("preloadInbox")) {
			Scringo.preloadInbox();
			callbackContext.success();
			result = true;
		} else if (action.equals("preloadActivity")) {
			Scringo.preloadActivityFeed();
			callbackContext.success();
			result = true;
		} else if (action.equals("preloadChatRooms")) {
			Scringo.preloadChatRooms();
			callbackContext.success();
			result = true;
		} else if (action.equals("setUserScore")) {
			int score = args.getInt(0);
			String level = args.optString(1);
			Scringo.setScore(score, level);
			result = true;
		} else if (action.equals("postToFeed")) {
			String message = args.optString(0);
			if (message == null || message.length() == 0) {
				callbackContext.error("ScringoPlugin: Got an empty Message");
			} else {
				Scringo.sendFeed(message, null, null, null, null, null);
				result = true;
			}
		} else if (action.equals("postToFeedWithLink")) {
			String message = args.optString(0);
			String link = args.optString(1);
			if (message == null || message.length() == 0 || link == null || link.length() == 0) {
				callbackContext.error("ScringoPlugin: Got an empty Message or Link");
			} else {
				Scringo.sendFeed(message, link, null, null, null, null);
				result = true;
			}
		} else if (action.equals("postToFeedWithImage")) {
			String message = args.optString(0);
			String imageUrl = args.optString(1);
			String description = args.optString(2);
			String subDesc = args.optString(3);
			String actionVerb = args.optString(4);
			String actionId = args.optString(5);
			if (message == null || message.length() == 0 || imageUrl == null || imageUrl.length() == 0) {
				callbackContext.error("ScringoPlugin: Got an empty Message or Image URL");
			} else {
				Scringo.sendFeed(message, imageUrl, description, subDesc, actionVerb, actionId);
				result = true;
			}
		} else if (action.equals("getFeatureBadgeNumber")) {
			int featureId = args.optInt(0, -1);
			if (featureId == -1) {
				callbackContext.error("ScringoPlugin: Got illegal feature Id (" + featureId + ")");
			} else {
				int val = -1;
				switch (featureId) {
				case 0:
					val = Scringo.getBadgeValue(Scringo.ScringoFeature.ACTIVITY);
					break;
				case 1:
					val = Scringo.getBadgeValue(Scringo.ScringoFeature.INBOX);
					break;
				case 2:
					val = Scringo.getBadgeValue(Scringo.ScringoFeature.CHAT_ROOMS);
					break;
				case 3:
					val = Scringo.getBadgeValue(Scringo.ScringoFeature.FIND_FRIENDS);
					break;
				case 4:
					val = Scringo.getBadgeValue(Scringo.ScringoFeature.RADAR);
					break;
				}
				
				if (val == -1) {
					callbackContext.error("ScringoPlugin: Got illegal feature Id (" + featureId + ")");
				} else {
					callbackContext.success(val);
					result = true;
				}
			}
		}

		return result;
	}
}
