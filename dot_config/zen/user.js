// disable about:config warning
user_pref("browser.aboutConfig.showWarning", false);

// tabs on right side
user_pref("zen.tabs.vertical.right-side", true);

// don't show welcome setup
user_pref("zen.welcome-screen.seen", true);

// increase some confirmation dialogs to 3s
user_pref("security.dialog_enable_delay", 3000);

// disable location services
user_pref("geo.enabled", false);

// turn Enhanced Tracking Protection to strict
user_pref("browser.contentblocking.category", "strict");
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.allow_list.baseline.enabled", true);
user_pref("privacy.trackingprotection.allow_list.convenience.enabled", false);

// force HTTPS
user_pref("dom.security.https_only_mode", true);

// don't use DNS over HTTPS (DoH). We want to use our local DNS
user_pref("network.trr.mode", 5);

// don't fill in forms
user_pref("signon.rememberSignons", false);
user_pref("extensions.formautofill.creditCards.enabled", false);

// warn when closing multiple tabs
user_pref("browser.tabs.warnOnClose", true);

// use the same search in private windows
user_pref("browser.search.separatePrivateDefault", false);
