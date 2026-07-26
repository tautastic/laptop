{
  programs.librewolf = {
    enable = true;
    settings = {
      "browser.contentblocking.category" = "strict";                                 # Strict Enhanced Tracking Protection
      "browser.dom.window.dump.enabled" = false;                                     # Prevent sites from using dump()
      "browser.ml.linkPreview.enabled" = false;                                      # Disable ML-based link previews
      "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;          # Hide sponsored shortcuts on new tab page
      "browser.region.update.enabled" = false;                                       # Disable automatic region detection
      "browser.safebrowsing.downloads.remote.block_potentially_unwanted" = false;    # Don't block potentially unwanted downloads
      "browser.safebrowsing.downloads.remote.block_uncommon" = false;                # Don't block uncommon downloads
      "browser.safebrowsing.downloads.remote.enabled" = false;                       # Disable remote download safebrowsing checks
      "browser.translations.enable" = false;                                         # Disable built-in translation feature
      "browser.urlbar.suggest.quickactions" = false;                                 # Remove quick actions from address bar
      "dom.forms.autocomplete.formautofill" = true;                                  # Allow form autofill (addresses, credit cards)
      "extensions.pictureinpicture.enable_picture_in_picture_overrides" = true;      # Allow sites to override PiP behavior
      "findbar.highlightAll" = true;                                                 # Highlight all matches when using find bar
      "layout.spellcheckDefault" = 0;                                                # Disable spell checking in text fields
      "media.eme.enabled" = true;                                                    # Enable DRM (e.g., Netflix, Spotify)
      "network.captive-portal-service.enabled" = false;                              # Disable captive portal detection
      "network.connectivity-service.enabled" = false;                                # Disable network connectivity checks
      "network.http.http3.enable_0rtt" = false;                                      # Disable HTTP/3 0-RTT (privacy/security)
      "network.http.referer.disallowCrossSiteRelaxingDefault.top_navigation" = true; # Stricter cross-origin referrer policy
      "network.http.speculative-parallel-limit" = 0;                                 # Disable speculative preconnections
      "network.prefetch-next" = false;                                               # Disable link prefetching
      "privacy.clearOnShutdown.cookies" = true;                                      # Clear cookies when browser closes
      "privacy.clearOnShutdown.history" = true;                                      # Clear browsing history on exit
      "privacy.fingerprintingProtection" = true;                                     # Enable Firefox's fingerprinting protection
      "privacy.globalprivacycontrol.was_ever_enabled" = true;                        # Signal Global Privacy Control (do not sell)
      "privacy.query_stripping.enabled" = true;                                      # Strip tracking query parameters from URLs
      "privacy.query_stripping.enabled.pbmode" = true;                               # Same in private browsing mode
      "privacy.resistFingerprinting" = false;                                        # Disable strict RFP (can break sites)
      "privacy.trackingprotection.allow_list.convenience.enabled" = false;           # Don't auto-allow known trackers for convenience
      "privacy.trackingprotection.emailtracking.enabled" = true;                     # Block email trackers
      "privacy.trackingprotection.enabled" = true;                                   # Enable built-in tracking protection
      "privacy.trackingprotection.socialtracking.enabled" = true;                    # Block social media trackers
      "privacy.userContext.enabled" = false;                                         # Disable container tabs feature
      "security.tls.enable_0rtt_data" = false;                                       # Disable TLS 1.3 0-RTT (security)
      "signon.generation.enabled" = false;                                           # Disable password generation suggestions
      "signon.management.page.breach-alerts.enabled" = false;                        # Disable data breach alerts for saved logins
      "toolkit.telemetry.reportingpolicy.firstRun" = false;                          # Disable telemetry prompt on first run
      "webgl.disabled" = false;                                                      # Enable WebGL (3D graphics)
    };
  };
}
