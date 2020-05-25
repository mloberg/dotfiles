// 0102: set START to resume previous session
user_pref("browser.startup.page", 3);

// 0302a: auto-install Firefox updates
user_pref("app.update.auto", false);

// 0708: disable FTP
user_pref("network.ftp.enabled", false);

// 0801: enable location bar using search
user_pref("keyword.enabled", true);

// 0901: disable password manager
user_pref("signon.rememberSignons", false);

// 1020: limit the number of closed tabs Firefox remembers
user_pref("browser.sessionstore.max_tabs_undo", 5);

// 1602: send only the scheme, host, and port in the Referer header
user_pref("network.http.referer.trimmingPolicy", 2);
// 1603: always send a referer
// This breaks things like iCloud and Atlassian
// Instead, use a plugin to manage this which has an allow list
user_pref("network.http.referer.XOriginPolicy", 1);
// 1604: limit referer to only send the scheme, host, and port
user_pref("network.http.referer.XOriginTrimmingPolicy", 2);

// 2401: disable right-click menu manipulation via JavaScript
user_pref("dom.event.contextmenu.enabled", false);
// 2402: disable website access to clipboard events/content
user_pref("dom.event.clipboardevents.enabled", false);

// 2684: increase on some confirmation dialogs to 3s
user_pref("security.dialog_enable_delay", 3000);

// 2803: don't clear history or cookies on close
user_pref("privacy.clearOnShutdown.history", false);
user_pref("privacy.clearOnShutdown.cookies", false);
