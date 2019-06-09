//
// Firefox settings focused on security and privacy while still keeping sites
// somewhat usable.
// 
// Warning: You probably don't want this. It will likely break something. If
// you choose to use this, backup your profile so you can restore it in case
// something goes wrong.
//
// settings adapted from:
//   * https://www.privacytools.io/browsers/#about_config
//   * https://github.com/pyllyukko/user.js/blob/master/user.js
//   * https://github.com/ghacksuserjs/ghacks-user.js/blob/master/user.js
//   * https://ffprofile.com

/******************************************************************************
 * HTML5 / APIs / DOM                                                         *
 ******************************************************************************/

// Disable geolocation
user_pref("geo.enabled", false);

// When geolocation is enabled, use Mozilla geolocation service instead of Google
user_pref("geo.wifi.uri", "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%");

// When geolocation is enabled, don't log geolocation requests to the console
user_pref("geo.wifi.logging.enabled", false);

// Disable leaking network/browser connection information via Javascript
user_pref("dom.netinfo.enabled", false);

// Disable network API (helps fingerprinting prevention)
user_pref("dom.network.enabled", false);

// Disable WebRTC entirely to prevent leaking internal IP addresses
user_pref("media.peerconnection.enabled", false);

// Don't reveal your internal IP when WebRTC is enabled
user_pref("media.peerconnection.ice.no_host", true);

// Disable WebRTC getUserMedia, screen sharing, audio capture, video capture
user_pref("media.navigator.enabled", false);
user_pref("media.navigator.video.enabled", false);
user_pref("media.getusermedia.screensharing.enabled", false);
user_pref("media.getusermedia.audiocapture.enabled", false);

// Disable battery API
user_pref("dom.battery.enabled", false);

// Disable telephony API
user_pref("dom.telephony.enabled", false);

// Disable "beacon" asynchronous HTTP transfers (used for analytics)
user_pref("beacon.enabled", false);

// Disable access to clipboard events
// This does break cut/copy/paste in some apps (Google Docs)
user_pref("dom.event.clipboardevents.enabled", false);

// Disable "copy to clipboard" functionality via Javascript
// user_pref("dom.allow_cut_copy", false);

// Disable speech recognition
user_pref("media.webspeech.recognition.enable", false);

// Disable speech synthesis
user_pref("media.webspeech.synth.enabled", false);

// Disable sensor API
user_pref("device.sensors.enabled", false);

// Disable pinging URIs specified in HTML <a> ping= attributes
user_pref("browser.send_pings", false);

// When browser pings are enabled, only allow pinging the same host as the origin page
user_pref("browser.send_pings.require_same_host", true);

// Disable IndexedDB
// This could be used for tracking purposes, but uBlock uses it, so it's left enabled
// user_pref("dom.indexedDB.enabled",false);

// Disable gamepad API to prevent USB device enumeration
user_pref("dom.gamepad.enabled", false);

// Disable virtual reality devices APIs
user_pref("dom.vr.enabled", false);

// Disable vibrator API
user_pref("dom.vibrator.enabled", false);

// Disable resource timing API
user_pref("dom.enable_resource_timing", false);

// Disable Archive API
user_pref("dom.archivereader.enabled", false);

// Disable WebGL
user_pref("webgl.disabled", true);
// When webGL is enabled, use the minimum capability mode
user_pref("webgl.min_capability_mode", true);
// When webGL is enabled, disable webGL extensions
user_pref("webgl.disable-extensions", true);
// When webGL is enabled, force enabling it even when layer acceleration is not supported
user_pref("webgl.disable-fail-if-major-performance-caveat", true);
// When webGL is enabled, do not expose information about the graphics driver
user_pref("webgl.enable-debug-renderer-info", false);

// Spoof dual-core CPU
user_pref("dom.maxHardwareConcurrency", 2);

// Disable WebAssembly
user_pref("javascript.options.wasm", false);

// Disable DRM-controlled HTML5 content as it automatically downloads software from Google
user_pref("media.eme.enabled", false);
user_pref("media.gmp-widevinecdm.enabled", false);

// Disable Intersection Observer API
user_pref("dom.IntersectionObserver.enabled", false);

// Enable (limited but sufficient) window.opener protection
user_pref("dom.targetBlankNoOpener.enabled", true);

// Disable Web Audio API
user_pref("dom.webaudio.enabled", false);

/******************************************************************************
 * SECTION: Misc                                                              *
 ******************************************************************************/

// Disable face detection
user_pref("camera.control.face_detection.enabled", false);

// Disable GeoIP lookup on your address to set default search engine region
user_pref("browser.search.countryCode", "US");
user_pref("browser.search.region", "US");
user_pref("browser.search.geoip.url", "");

// Set Accept-Language HTTP header to en-US regardless of Firefox localization
user_pref("intl.accept_languages", "en-US, en");

// Don't use OS values to determine locale, force using Firefox locale setting
user_pref("intl.locale.matchOS", false);

// Don't use Mozilla-provided location-specific search engines
user_pref("browser.search.geoSpecificDefaults", false);

// Do not automatically send selection to clipboard on some Linux platforms
user_pref("clipboard.autocopy", false);

// Prevent leaking application locale/date format using JavaScript
user_pref("javascript.use_us_english_locale", true);

// Don't trim HTTP off of URLs in the address bar.
user_pref("browser.urlbar.trimURLs", false);

// Don't try to guess domain names when entering an invalid domain name in URL bar
user_pref("browser.fixup.alternate.enabled", false);

// When browser.fixup.alternate.enabled is enabled, strip password from 'user:password@...' URLs
user_pref("browser.fixup.hide_user_pass", true);

// Send DNS request through SOCKS when SOCKS proxying is in use
user_pref("network.proxy.socks_remote_dns", true);

// Don't monitor OS online/offline connection state
user_pref("network.manage-offline-status", false);

// Enforce Mixed Active Content Blocking
user_pref("security.mixed_content.block_active_content", true);

// Enforce Mixed Passive Content blocking (a.k.a. Mixed Display Content)
user_pref("security.mixed_content.block_display_content", true);

// Disable JAR from opening Unsafe File Types
user_pref("network.jar.open-unsafe-types", false);

// CIS 2.7.4 Disable Scripting of Plugins by JavaScript
user_pref("security.xpconnect.plugin.unrestricted", false);

// Set File URI Origin Policy
user_pref("security.fileuri.strict_origin_policy", true);

// Disable Displaying Javascript in History URLs
user_pref("browser.urlbar.filter.javascript", true);

// Disable asm.js
user_pref("javascript.options.asmjs", false);

// Disable SVG in OpenType fonts
user_pref("gfx.font_rendering.opentype_svg.enabled", false);

// Disable graphite
user_pref("gfx.font_rendering.graphite.enabled", false);

// Disable video stats to reduce fingerprinting threat
user_pref("media.video_stats.enabled", false);

// Don't reveal build ID
user_pref("general.buildID.override", "20100101");
user_pref("browser.startup.homepage_override.buildID", "20100101");

// Prevent font fingerprinting
user_pref("browser.display.use_document_fonts", 0);

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

// Disable FTP
user_pref("network.ftp.enabled", false);

// Prevent accessibility services from accessing your browser
user_pref("accessibility.force_disabled", 1);



/******************************************************************************
 * SECTION: Extensions / plugins                                              *
 ******************************************************************************/

// Ensure you have a security delay when installing add-ons (milliseconds)
user_pref("security.dialog_enable_delay", 3000);

// Require signatures
user_pref("xpinstall.signatures.required", true);

// Opt-out of add-on metadata updates
user_pref("extensions.getAddons.cache.enabled", false);

// Opt-out of themes (Persona) updates
user_pref("lightweightThemes.update.enabled", false);

// Disable Flash Player NPAPI plugin
user_pref("plugin.state.flash", 0);

// Disable Java NPAPI plugin
user_pref("plugin.state.java", 0);

// Disable sending Flash Player crash reports
user_pref("dom.ipc.plugins.flash.subprocess.crashreporter.enabled", false);

// When Flash crash reports are enabled, don't send the visited URL in the crash report
user_pref("dom.ipc.plugins.reportCrashURL", false);

// When Flash is enabled, download and use Mozilla SWF URIs blocklist
user_pref("browser.safebrowsing.blockedURIs.enabled", true);

// Disable Shumway (Mozilla Flash renderer)
user_pref("shumway.disabled", true);

// Disable Gnome Shell Integration NPAPI plugin
user_pref("plugin.state.libgnome-shell-browser-plugin", 0);

// Enable plugins click-to-play
user_pref("plugins.click_to_play", true);

// Updates addons automatically
user_pref("extensions.update.enabled", true);

// Enable add-on and certificate blocklists (OneCRL) from Mozilla
user_pref("extensions.blocklist.enabled", true);
user_pref("services.blocklist.update_enabled", true);

// Decrease system information leakage to Mozilla blocklist update servers
user_pref("extensions.blocklist.url", "https://blocklist.addons.mozilla.org/blocklist/3/%APP_ID%/%APP_VERSION%/");

/******************************************************************************
 * SECTION: Firefox (anti-)features / components                              *
 ******************************************************************************/

// Disable Extension recommendations
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr", false);

// Disable WebIDE
user_pref("devtools.webide.enabled", false);
user_pref("devtools.webide.autoinstallADBHelper", false);
user_pref("devtools.webide.autoinstallFxdtAdapters", false);

// Disable remote debugging
user_pref("devtools.debugger.remote-enabled", false);
user_pref("devtools.chrome.enabled", false);
user_pref("devtools.debugger.force-local", true);

// Disable Mozilla telemetry/experiments
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("experiments.supported", false);
user_pref("experiments.enabled", false);
user_pref("experiments.manifest.uri", "");

// Disallow Necko to do A/B testing
user_pref("network.allow-experiments", false);

// Disable sending Firefox crash reports to Mozilla servers
user_pref("breakpad.reportURL", "");

// Disable sending reports of tab crashes to Mozilla (about:tabcrashed)
user_pref("browser.tabs.crashReporting.sendReport", false);

// Don't nag user about unsent crash reports
user_pref("browser.crashReports.unsubmittedCheck.enabled", false);

// Disable FlyWeb (discovery of LAN/proximity IoT devices that expose a Web interface)
user_pref("dom.flyweb.enabled", false);

// Disable the UITour backend
user_pref("browser.uitour.enabled", false);

// Enable Firefox Tracking Protection
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.pbmode.enabled", true);

// Enable contextual identity Containers feature
user_pref("privacy.userContext.enabled", true);

// Enable Firefox's anti-fingerprinting mode
user_pref("privacy.resistFingerprinting", true);

// Disable the built-in PDF viewer
user_pref("pdfjs.disabled", true);

// Disable collection/sending of the health report
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.healthreport.service.enabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("browser.discovery.enabled", false);

// Disable Heartbeat (Mozilla user rating telemetry)
user_pref("browser.selfsupport.url", "");

// Disable Firefox Hello metrics collection
user_pref("loop.logDomains", false);

// Enforce checking for Firefox updates
user_pref("app.update.enabled", true);

// Enable blocking reported web forgeries
user_pref("browser.safebrowsing.phishing.enabled", true);

// Enable blocking reported attack sites
user_pref("browser.safebrowsing.malware.enabled", true);

// Disable querying Google Application Reputation database for downloaded binary files
user_pref("browser.safebrowsing.downloads.remote.enabled", false);

// Disable Pocket
user_pref("browser.pocket.enabled", false);
user_pref("extensions.pocket.enabled", false);

// Disable SHIELD
user_pref("extensions.shield-recipe-client.enabled", false);
user_pref("app.shield.optoutstudies.enabled", false);

// Disable Normandy (https://github.com/mozilla/normandy)
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");

// Disable "Recommended by Pocket" in Firefox Quantum
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);

// Blocks fingerprinting
user_pref("privacy.trackingprotection.fingerprinting.enabled", true);

// Blocks CryptoMining
user_pref("privacy.trackingprotection.cryptomining.enabled", true);

// Limit the number of closed tabs Firefox remembers
// You could disable this by setting it to 0, but I use this feature more than I care to admit
user_pref("browser.sessionstore.max_tabs_undo", 5);

/******************************************************************************
 * SECTION: Automatic connections                                             *
 ******************************************************************************/

// Disable prefetching of <link rel="next"> URLs
user_pref("network.prefetch-next", false);

// Disable DNS prefetching
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);

// Disable the predictive service (Necko)
user_pref("network.predictor.enabled", false);
user_pref("network.predictor.enable-prefetch", false);

// Reject .onion hostnames before passing the to DNS
user_pref("network.dns.blockDotOnion", true);

// Disable search suggestions in the search bar
user_pref("browser.search.suggest.enabled", false);

// Disable "Show search suggestions in location bar results"
user_pref("browser.urlbar.suggest.searches", false);

// Disable SSDP
user_pref("browser.casting.enabled", false);

// Disable automatic downloading of OpenH264 codec
user_pref("media.gmp-gmpopenh264.enabled", false);
user_pref("media.gmp-manager.url", "");

// Disable speculative pre-connections
user_pref("network.http.speculative-parallel-limit", 0);

// Disable downloading homepage snippets/messages from Mozilla
user_pref("browser.aboutHomeSnippets.updateUrl", "");

// Never check updates for search engines
user_pref("browser.search.update", false);

// Disable automatic captive portal detection
user_pref("network.captive-portal-service.enabled", false);

// Disable preloading of autocomplete URLs
user_pref("browser.urlbar.speculativeConnect.enabled", false);

/******************************************************************************
 * SECTION: HTTP                                                              *
 ******************************************************************************/

// Disallow NTLMv1
user_pref("network.negotiate-auth.allow-insecure-ntlm-v1", false);
user_pref("network.negotiate-auth.allow-insecure-ntlm-v1-https", false);

// Enable CSP 1.1 script-nonce directive support
user_pref("security.csp.experimentalEnabled", true);

// Enable Content Security Policy (CSP)
user_pref("security.csp.enable", true);

// Enable Subresource Integrity
user_pref("security.sri.enable", true);

// DNT HTTP header
user_pref("privacy.donottrackheader.enabled", true);

// Send a referer header with the target URI as the source
user_pref("network.http.referer.spoofSource", true);

// Send only the scheme, host, and port in the Referer header
user_pref("network.http.referer.trimmingPolicy", 2);

// Don't send referer headers when following links across different domains
user_pref("network.http.referer.XOriginPolicy", 2);

// If referer headers are allowed across different domains, only send the scheme, host, and port
user_pref("network.http.referer.XOriginTrimmingPolicy", 2);

// Accept Only 1st Party Cookies
user_pref("network.cookie.cookieBehavior", 1);

// Enable first-party isolation
// This may break social login and require basic auth creds for each new tab
user_pref("privacy.firstparty.isolate", true);

// Make sure that third-party cookies (if enabled) never persist beyond the session.
user_pref("network.cookie.thirdparty.sessionOnly", true);

// Limit HTTP redirects (this does not control redirects with HTML meta tags or JS)
user_pref("network.http.redirection-limit", 10);

/*******************************************************************************
 * SECTION: Caching                                                            *
 ******************************************************************************/

// Do not download URLs for the offline cache
user_pref("browser.cache.offline.enable", false);

// Disable download history
user_pref("browser.download.manager.retention", 0);

// Disable password manager
user_pref("signon.rememberSignons", false);

// Disable form autofill, don't save information entered in web page forms and the Search Bar
user_pref("browser.formfill.enable", false);

// Cookies expires at the end of the session (when the browser closes)
user_pref("network.cookie.lifetimePolicy", 2);

// Require manual intervention to autofill known username/passwords sign-in forms
user_pref("signon.autofillForms", false);

// Disable formless login capture
user_pref("signon.formlessCapture.enabled", false);

// When username/password autofill is enabled, still disable it on non-HTTPS sites
user_pref("signon.autofillForms.http", false);

// Show in-content login form warning UI for insecure login fields
user_pref("security.insecure_field_warning.contextual.enabled", true);

// Delete Search and Form History
user_pref("browser.formfill.expire_days", 0);

// Clear SSL Form Session Data
user_pref("browser.sessionstore.privacy_level", 2);

// Delete temporary files on exit
user_pref("browser.helperApps.deleteTempFileOnExit", true);

// Do not create screenshots of visited pages (relates to the "new tab page" feature)
user_pref("browser.pagethumbnails.capturing_disabled", true);

// Enforce websites to ask to store data for offline use
user_pref("offline-apps.allow_by_default", false);

/*******************************************************************************
 * SECTION: UI related                                                         *
 *******************************************************************************/

// Enable insecure password warnings (login forms in non-HTTPS pages)
user_pref("security.insecure_password.ui.enabled", true);

// Disable right-click menu manipulation via JavaScript
user_pref("dom.event.contextmenu.enabled", false);

// Disable "Are you sure you want to leave this page?" popups on page close
user_pref("dom.disable_beforeunload", true);

// Disable Downloading on Desktop
user_pref("browser.download.folderList", 2);

// Always ask the user where to download
user_pref("browser.download.useDownloadDir", false);

// Disable Activity Stream
user_pref("browser.newtabpage.activity-stream.enabled", false);

// Enable Auto Notification of Outdated Plugins
user_pref("plugins.update.notifyUser", true);

// Force Punycode for Internationalized Domain Names
user_pref("network.IDN_show_punycode", true);

// Disable CSS :visited selectors
user_pref("layout.css.visited_links_enabled", false);

// Do not check if Firefox is the default browser
user_pref("browser.shell.checkDefaultBrowser", false);

// Display a notification bar when websites offer data for offline use
user_pref("browser.offline-apps.notify", true);

// Limit history leaks via enumeration (PER TAB: back/forward)
user_pref("browser.sessionhistory.max_entries", 10);

/******************************************************************************
 * SECTION: Cryptography                                                      *
 ******************************************************************************/

// Enable HSTS preload list (pre-set HSTS sites list provided by Mozilla)
user_pref("network.stricttransportsecurity.preloadlist", true);

// Enable Online Certificate Status Protocol
user_pref("security.OCSP.enabled", 1);

// Enable OCSP Stapling support
user_pref("security.ssl.enable_ocsp_stapling", true);

// Enable OCSP Must-Staple support
user_pref("security.ssl.enable_ocsp_must_staple", true);

// Require a valid OCSP response for OCSP enabled certificates
user_pref("security.OCSP.require", true);

// Disable TLS Session Tickets
user_pref("security.ssl.disable_session_identifiers", true);

// Only allow TLS 1.[0-3]
user_pref("security.tls.version.min", 1);
user_pref("security.tls.version.max", 4);

// Disable insecure TLS version fallback
user_pref("security.tls.version.fallback-limit", 3);

// Enforce Public Key Pinning
user_pref("security.cert_pinning.enforcement_level", 2);

// Disallow SHA-1
user_pref("security.pki.sha1_enforcement_level", 1);

// Warn the user when server doesn't support RFC 5746 ("safe" renegotiation)
user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);

// Disable automatic reporting of TLS connection errors
user_pref("security.ssl.errorReporting.automatic", false);

// Pre-populate the current URL but do not pre-fetch the certificate in the "Add Security Exception" dialog
user_pref("browser.ssl_override_behavior", 1);

// Display advanced information on Insecure Connection warning pages
user_pref("browser.xul.error_pages.expert_bad_cert", true);

// Display "insecure" icon and "Not Secure" text on HTTP sites
user_pref("security.insecure_connection_icon.enabled", true);
user_pref("security.insecure_connection_text.enabled", true);

/******************************************************************************
 * SECTION: Cipher suites                                                     *
 ******************************************************************************/

// Disable null ciphers
user_pref("security.ssl3.rsa_null_sha", false);
user_pref("security.ssl3.rsa_null_md5", false);
user_pref("security.ssl3.ecdhe_rsa_null_sha", false);
user_pref("security.ssl3.ecdhe_ecdsa_null_sha", false);
user_pref("security.ssl3.ecdh_rsa_null_sha", false);
user_pref("security.ssl3.ecdh_ecdsa_null_sha", false);

// Disable SEED cipher
user_pref("security.ssl3.rsa_seed_sha", false);

// Disable 40/56/128-bit ciphers
user_pref("security.ssl3.rsa_rc4_40_md5", false);
user_pref("security.ssl3.rsa_rc2_40_md5", false);
user_pref("security.ssl3.rsa_1024_rc4_56_sha", false);
user_pref("security.ssl3.rsa_camellia_128_sha", false);
user_pref("security.ssl3.ecdhe_rsa_aes_128_sha", false);
user_pref("security.ssl3.ecdhe_ecdsa_aes_128_sha", false);
user_pref("security.ssl3.ecdh_rsa_aes_128_sha", false);
user_pref("security.ssl3.ecdh_ecdsa_aes_128_sha", false);
user_pref("security.ssl3.dhe_rsa_camellia_128_sha", false);
user_pref("security.ssl3.dhe_rsa_aes_128_sha", false);

// Disable RC4
user_pref("security.ssl3.ecdh_ecdsa_rc4_128_sha", false);
user_pref("security.ssl3.ecdh_rsa_rc4_128_sha", false);
user_pref("security.ssl3.ecdhe_ecdsa_rc4_128_sha", false);
user_pref("security.ssl3.ecdhe_rsa_rc4_128_sha", false);
user_pref("security.ssl3.rsa_rc4_128_md5", false);
user_pref("security.ssl3.rsa_rc4_128_sha", false);
user_pref("security.tls.unrestricted_rc4_fallback", false);

// Disable 3DES (effective key size is < 128)
user_pref("security.ssl3.dhe_dss_des_ede3_sha", false);
user_pref("security.ssl3.dhe_rsa_des_ede3_sha", false);
user_pref("security.ssl3.ecdh_ecdsa_des_ede3_sha", false);
user_pref("security.ssl3.ecdh_rsa_des_ede3_sha", false);
user_pref("security.ssl3.ecdhe_ecdsa_des_ede3_sha", false);
user_pref("security.ssl3.ecdhe_rsa_des_ede3_sha", false);
user_pref("security.ssl3.rsa_des_ede3_sha", false);
user_pref("security.ssl3.rsa_fips_des_ede3_sha", false);

// Disable ciphers with ECDH (non-ephemeral)
user_pref("security.ssl3.ecdh_rsa_aes_256_sha", false);
user_pref("security.ssl3.ecdh_ecdsa_aes_256_sha", false);

// Disable 256 bits ciphers without PFS
user_pref("security.ssl3.rsa_camellia_256_sha", false);

// Enable ciphers with ECDHE and key size > 128bits
user_pref("security.ssl3.ecdhe_rsa_aes_256_sha", true); // 0xc014
user_pref("security.ssl3.ecdhe_ecdsa_aes_256_sha", true); // 0xc00a

// Enable GCM ciphers (TLSv1.2 only)e
user_pref("security.ssl3.ecdhe_ecdsa_aes_128_gcm_sha256", true); // 0xc02b
user_pref("security.ssl3.ecdhe_rsa_aes_128_gcm_sha256", true); // 0xc02f

// Enable ChaCha20 and Poly1305
user_pref("security.ssl3.ecdhe_ecdsa_chacha20_poly1305_sha256", true);
user_pref("security.ssl3.ecdhe_rsa_chacha20_poly1305_sha256", true);

// Disable ciphers susceptible to the logjam attack
user_pref("security.ssl3.dhe_rsa_camellia_256_sha", false);
user_pref("security.ssl3.dhe_rsa_aes_256_sha", false);

// Disable ciphers with DSA (max 1024 bits)
user_pref("security.ssl3.dhe_dss_aes_128_sha", false);
user_pref("security.ssl3.dhe_dss_aes_256_sha", false);
user_pref("security.ssl3.dhe_dss_camellia_128_sha", false);
user_pref("security.ssl3.dhe_dss_camellia_256_sha", false);

// Fallbacks due compatibility reasons
user_pref("security.ssl3.rsa_aes_256_sha", true); // 0x35
user_pref("security.ssl3.rsa_aes_128_sha", true); // 0x2f
