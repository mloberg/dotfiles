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

// disable FTP
user_pref("network.ftp.enabled", false);

// limit the number of closed tabs Firefox remembers
user_pref("browser.sessionstore.max_tabs_undo", 5);

// send only the scheme, host, and port in the Referer header
user_pref("network.http.referer.trimmingPolicy", 2);
// limit referer to only send the scheme, host, and port
user_pref("network.http.referer.XOriginTrimmingPolicy", 2);

// increase on some confirmation dialogs to 3s
user_pref("security.dialog_enable_delay", 3000);

// disabled sponsored content
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
