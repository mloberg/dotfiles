// disable about:config warning
user_pref("browser.aboutConfig.showWarning", false);

// don't check if Firefox is the default browser
user_pref("browser.shell.checkDefaultBrowser", false);

// disable sending the URL of the website where a plugin crashed
user_pref("dom.ipc.plugins.reportCrashURL", false);

// disable about:addons' Recommendations pane
user_pref("extensions.getAddons.showPane", false);
// disable recommendations in about:addons' Extensions and Themes panes
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);

// disable pocket
user_pref("extensions.pocket.enabled", false);

// disable FTP
user_pref("network.ftp.enabled", false);

// disable pocket
user_pref('extensions.pocket.enabled', false);

// limit the number of closed tabs Firefox remembers
user_pref("browser.sessionstore.max_tabs_undo", 5);

// send only the scheme, host, and port in the Referer header
user_pref("network.http.referer.trimmingPolicy", 2);
// limit referer to only send the scheme, host, and port
user_pref("network.http.referer.XOriginTrimmingPolicy", 2);

// increase some confirmation dialogs to 3s
user_pref("security.dialog_enable_delay", 3000);

// disabled sponsored content
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);

// open new tab to the right of the active tab
user_pref("browser.tabs.insertAfterCurrent", true);

// prevent websites from checking the state of microphone and camera
user_pref("media.navigator.enabled", false);

// isolate first party domain cookies to reduce tracking across websites
user_pref("privacy.firstparty.isolate", true);

// prevent crypto miners
user_pref("privacy.trackingprotection.cryptomining.enabled", true);

// attempt to reduce the browser's fingerprint
user_pref("privacy.trackingprotection.fingerprinting.enabled", true);

// disable location services (as they go through Google's servers)
user_pref("geo.enabled", false);

// disable pre-fetching webpages
user_pref("network.prefetch-next", false);

// disable websockets as it can leak your real ip on a VPN
user_pref("network.websocket.max-connections", 0);

// prevent clipboard notifications
user_pref("dom.event.clipboardevents.enabled", false);

// disable webRTC as it can leak your real ip on a VPN
user_pref("media.peerconnection.enabled", false);

// prevent websites from ready battery level
user_pref("dom.battery.enabled", false);

// prevent websites from tracking clicks on a page
user_pref("browser.send_pings", false);

// additional privacy settings
user_pref("browser.urlbar.speculativeConnect.enabled", false);
user_pref("webgl.disabled", true);
user_pref("beacon.enabled", false);
user_pref("network.IDN_show_punycode", true);
user_pref("network.http.referer.XOriginPolicy", 1);
