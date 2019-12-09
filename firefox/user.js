//
// Firefox settings focused on security and privacy while still keeping sites
// somewhat usable.
// 
// Warning: You probably don't want this. It will likely break something. If
// you choose to use this, backup your profile so you can restore it in case
// something goes wrong.
//
// Base settings from ghacks user.js (https://github.com/ghacksuserjs/ghacks-user.js)
// Other settings adapted from:
//   * https://www.privacytools.io/browsers/#about_config
//   * https://github.com/pyllyukko/user.js
//   * https://ffprofile.com
//   * https://github.com/drduh/config/blob/master/firefox.user.js

/*** ghacks-user.js overrides ***/
user_pref("_user.js.parrot", "OVERRIDE: All right then, if he's restin', I'll wake him up!");

// 0102: set START to resume previous session
 user_pref("browser.startup.page", 3);
// 0105b: Disable downloading homepage snippets/messages from Mozilla
user_pref("browser.newtabpage.activity-stream.disableSnippets", true);
user_pref("browser.aboutHomeSnippets.updateUrl", "");
// 0201: disable Location-Aware Browsing
user_pref("geo.enabled", false);
// 0203: enable logging geo requests to the console
user_pref("geo.wifi.logging.enabled", true)
// 0205: set default search engine region
user_pref("browser.search.countryCode", "US");
// 0301a: enforce checking for Firefox updates
user_pref("app.update.enabled", true);
// 0301b: Updates addons automatically
user_pref("extensions.update.enabled", true);
// 0306: opt-out of add-on metadata updates
user_pref("extensions.getAddons.cache.enabled", false);
// 0307: opt-out of themes (Persona) updates
user_pref("lightweightThemes.update.enabled", false);
// 0410: enable blocking reported web forgeries
user_pref("browser.safebrowsing.phishing.enabled", true);
user_pref("browser.safebrowsing.malware.enabled", true);
// 0501: disable experiments
user_pref("experiments.supported", false);
user_pref("experiments.enabled", false);
user_pref("experiments.manifest.uri", "");
// 0502: disable Mozilla permission to silently opt you into tests
user_pref("network.allow-experiments", false);
// 0701: enable IPv6
  // user_pref("network.dns.disableIPv6", false);
// 0708: disable FTP
user_pref("network.ftp.enabled", false);
// 0801: enable location bar using search
user_pref("keyword.enabled", true);
// 0901: disable password manager
user_pref("signon.rememberSignons", false);

// 1006: disable permissions manager from writing to disk [RESTART]
user_pref("permissions.memory_only", true);
// 1020: limit the number of closed tabs Firefox remembers
user_pref("browser.sessionstore.max_tabs_undo", 5);
// 1212: set OCSP fetch failures to soft-fail
user_pref("security.OCSP.require", false);
// 1602: send only the scheme, host, and port in the Referer header
user_pref("network.http.referer.trimmingPolicy", 2);
// 1603: don't send referer headers when following links across different domains
user_pref("network.http.referer.XOriginPolicy", 2);
// 1604: if referer headers are allowed across different domains, only send the scheme, host, and port
user_pref("network.http.referer.XOriginTrimmingPolicy", 2);
// 1605: send a referer header with the target URI as the source
  // user_pref("network.http.referer.spoofSource", true);
// 1803: disable Java plugin
user_pref("plugin.state.java", 0);

// 2401: disable right-click menu manipulation via JavaScript
user_pref("dom.event.contextmenu.enabled", false);
// 2426: disable Intersection Observer API
user_pref("dom.IntersectionObserver.enabled", false);
// 2502: disable battery API
user_pref("dom.battery.enabled", false);
// 2504: disable virtual reality devices APIs
user_pref("dom.vr.enabled", false);
// 2608: disable WebIDE
user_pref("devtools.webide.enabled", false);
user_pref("devtools.webide.autoinstallADBHelper", false);
user_pref("devtools.webide.autoinstallFxdtAdapters", false);
// 2613: disable JAR from opening Unsafe File Types
user_pref("network.jar.open-unsafe-types", false);
// 2650: discourage downloading to desktop
user_pref("browser.download.folderList", 2);
// 2682: enable CSP 1.1 script-nonce directive support
user_pref("security.csp.experimentalEnabled", true);
// 2684: enforce a security delay on some confirmation dialogs
user_pref("security.dialog_enable_delay", 3000);
// 2703: cookies expires at the end of the session (when the browser closes)
user_pref("network.cookie.lifetimePolicy", 2);
// 2731: enforce websites to ask to store data for offline use
user_pref("offline-apps.allow_by_default", false);
// 2803: don't clear history on close
user_pref("privacy.clearOnShutdown.history", false);

// 4504: disable RFP letterboxing
user_pref("privacy.resistFingerprinting.letterboxing", false);
// 4601: Spoof dual-core CPU
user_pref("dom.maxHardwareConcurrency", 2);
// 4602: Disable resource timing API
user_pref("dom.enable_resource_timing", false);
// 4604: disable sensor API
user_pref("device.sensors.enabled", false);
// 4606: disable gamepad API to prevent USB device enumeration
user_pref("dom.gamepad.enabled", false);
// 4608: disable speech synthesis
user_pref("media.webspeech.synth.enabled", false);
// 4610: disable video stats to reduce fingerprinting threat
user_pref("media.video_stats.enabled", false);
// 4702: don't reveal build ID
user_pref("general.buildID.override", "20100101");
user_pref("browser.startup.homepage_override.buildID", "20100101");

/*** Other custom settings ***/
user_pref("_user.js.parrot", "USER: You stunned him, just as he was wakin' up!");

// Disable network API (helps fingerprinting prevention)
user_pref("dom.network.enabled", false);

// Disable video capture
user_pref("media.navigator.video.enabled", false);

// Disable telephony API
user_pref("dom.telephony.enabled", false);

// Disable speech recognition
user_pref("media.webspeech.recognition.enable", false);

// Disable Archive API
user_pref("dom.archivereader.enabled", false);

// When webGL is enabled, do not expose information about the graphics driver
user_pref("webgl.enable-debug-renderer-info", false);

// Disable face detection
user_pref("camera.control.face_detection.enabled", false);

// Don't monitor OS online/offline connection state
user_pref("network.manage-offline-status", false);

// CIS 2.7.4 Disable Scripting of Plugins by JavaScript
user_pref("security.xpconnect.plugin.unrestricted", false);

// Set File URI Origin Policy
user_pref("security.fileuri.strict_origin_policy", true);

// Disable Displaying Javascript in History URLs
user_pref("browser.urlbar.filter.javascript", true);

// Enable only whitelisted URL protocol handlers
// Disabling nonessential protocols breaks all interaction with custom protocols and breaks opening third-party clients when clicking on these links
// If you want to enable a protocol, set network.protocol-handler.expose.(protocol) to true and network.protocol-handler.external.(protocol) to:
//   * true, if the protocol should be handled by an external application
//   * false, if the protocol should be handled internally by Firefox
user_pref("network.protocol-handler.warn-external-default",true);
user_pref("network.protocol-handler.expose-all", false);
user_pref("network.protocol-handler.external.http", false);
user_pref("network.protocol-handler.expose.http", true);
user_pref("network.protocol-handler.external.https", false);
user_pref("network.protocol-handler.expose.https", true);
user_pref("network.protocol-handler.external.javascript", false);
user_pref("network.protocol-handler.expose.javascript", true);
user_pref("network.protocol-handler.external.moz-extension", false);
user_pref("network.protocol-handler.expose.moz-extension", true);
user_pref("network.protocol-handler.external.ftp", false);
user_pref("network.protocol-handler.expose.ftp", true);
user_pref("network.protocol-handler.external.file", false);
user_pref("network.protocol-handler.expose.file", true);
user_pref("network.protocol-handler.external.about", false);
user_pref("network.protocol-handler.expose.about", true);
user_pref("network.protocol-handler.external.chrome", false);
user_pref("network.protocol-handler.expose.chrome", true);
user_pref("network.protocol-handler.external.blob", false);
user_pref("network.protocol-handler.expose.blob", true);
user_pref("network.protocol-handler.external.data", false);
user_pref("network.protocol-handler.expose.data", true);

// Require extension signing
user_pref("xpinstall.signatures.required", true);

// When Flash is enabled, download and use Mozilla SWF URIs blocklist
user_pref("browser.safebrowsing.blockedURIs.enabled", true);

// Disable Shumway (Mozilla Flash renderer)
user_pref("shumway.disabled", true);

// Disable Gnome Shell Integration plugin
user_pref("plugin.state.libgnome-shell-browser-plugin", 0);

// Enable add-on and certificate blocklists (OneCRL) from Mozilla
user_pref("services.blocklist.update_enabled", true);

// Disable Extension recommendations
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);

// Disable FlyWeb (discovery of LAN/proximity IoT devices that expose a Web interface)
user_pref("dom.flyweb.enabled", false);

// Enable Firefox Tracking Protection
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.pbmode.enabled", true);

// Disable Pocket
user_pref("browser.pocket.enabled", false);
user_pref("extensions.pocket.enabled", false);

// Blocks fingerprinting
user_pref("privacy.trackingprotection.fingerprinting.enabled", true);

// Blocks CryptoMining
user_pref("privacy.trackingprotection.cryptomining.enabled", true);

// Reject .onion hostnames before passing the to DNS
user_pref("network.dns.blockDotOnion", true);

// Disable SSDP
user_pref("browser.casting.enabled", false);

// Disable automatic downloading of OpenH264 codec
user_pref("media.gmp-gmpopenh264.enabled", false);
user_pref("media.gmp-manager.url", "");

// Disallow NTLMv1
user_pref("network.negotiate-auth.allow-insecure-ntlm-v1", false);
user_pref("network.negotiate-auth.allow-insecure-ntlm-v1-https", false);

// Enable Subresource Integrity
user_pref("security.sri.enable", true);

// Disable download history
user_pref("browser.download.manager.retention", 0);

// if username/password autofill is enabled, still disable it on non-HTTPS sites
user_pref("signon.autofillForms.http", false);

// Show in-content login form warning UI for insecure login fields
user_pref("security.insecure_field_warning.contextual.enabled", true);
// Enable insecure password warnings (login forms in non-HTTPS pages)
user_pref("security.insecure_password.ui.enabled", true);

// Delete Search and Form History
user_pref("browser.formfill.expire_days", 0);

// Disable Activity Stream
user_pref("browser.newtabpage.activity-stream.enabled", false);

// Enable Auto Notification of Outdated Plugins
user_pref("plugins.update.notifyUser", true);

// Display a notification bar when websites offer data for offline use
user_pref("browser.offline-apps.notify", true);

// Limit history leaks via enumeration (PER TAB: back/forward)
user_pref("browser.sessionhistory.max_entries", 10);

// set default permissions
// setting these could lead to fingerprinting via permissions API
// 0=always ask (default), 1=allow, 2=block)
// 2306: default permission for Notifications
  // user_pref("permissions.default.desktop-notification", 2);
// 0202: set a default permission for Location
  // user_pref("permissions.default.geo", 2);
// 2024: set a default permission for Camera/Microphone
  // user_pref("permissions.default.microphone", 2);

// Enable DNS over HTTPS
// user_pref("network.trr.mode", 2);
// user_pref("network.trr.uri", "https://cloudflare-dns.com/dns-query");
// user_pref("network.trr.bootstrapAddress", "1.1.1.1");

user_pref("_user.js.parrot", "SUCCESS: Remarkable bird, the Norwegian Blue, idn'it? Beautiful plumage!");
