{ pkgs, inputs, ... }: { home-manager.users.hatosu.programs.firefox = {
enable = true; package = pkgs.firefox; languagePacks = [ "jp" ];
profiles.hatosu = { isDefault = true;

      # extensions
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        darkreader
        yomitan
      ];

      # bookmarks
      bookmarks = let name = ""; in [ { name = "toolbar"; toolbar = true; bookmarks = [
        { url = "https://ayesoul.com/"; inherit name; }
        { url = "https://github.com/hatosu/config"; inherit name; }
        { url = "https://search.nixos.org/packages?channel=unstable"; inherit name; }
        { url = "https://noogle.dev/"; inherit name; }
        { url = "https://home-manager-options.extranix.com/?query=&release=master"; inherit name; }
        { url = "https://tales.mbivert.com/on-nix-language/"; inherit name; }
        { url = "https://ayats.org/blog"; inherit name; }
        { url = "https://claude.ai/new"; inherit name; }
        { url = "https://www.phind.com/search?home=true"; inherit name; }
        { url = "https://grep.app/"; inherit name; }
        { url = "https://dpp.dev/"; inherit name; }
        { url = "https://www.twitch.tv/issogashii/videos"; inherit name; }
        { url = "https://www.photopea.com/"; inherit name; }
        { url = "https://x.com/issogashii"; inherit name; }
        { url = "https://www.youtube.com/feed/subscriptions/shorts"; inherit name; }
        { url = "https://discord.com/channels/696438030189330482/1238755966439133235"; inherit name; }
        { url = "https://dictionary.goo.ne.jp/"; inherit name; }
        { url = "https://jpdb.io/learn"; inherit name; }
        { url = "https://itazuraneko.org/other/kensaku.html"; inherit name; }
        { url = "https://lifeprint.com/"; inherit name; }
        { url = "https://www.signingsavvy.com/"; inherit name; }
        { url = "https://reader.ttsu.app"; inherit name; }
        { url = "https://fmhy.net/videopiracyguide"; inherit name; }
        { url = "https://annas-archive.org/"; inherit name; }
        { url = "https://libgen.is/"; inherit name; }
        { url = "https://erynith.github.io/movie-web-instances/"; inherit name; }
        { url = "https://theindex.moe/"; inherit name; }
        { url = "https://isthereanydeal.com/deals/#sort:price"; inherit name; }
        { url = "https://rgamedeals.net/"; inherit name; }
        { url = "https://www.eneba.com/"; inherit name; }
        { url = "https://gg.deals/"; inherit name; }
        { url = "https://app.cachix.org/cache/hatosu#push"; inherit name; }
        { url = "https://filehaus.su/"; inherit name; }
        { url = "https://picsur.org/upload"; inherit name; }
        { url = "https://catbox.moe/"; inherit name; }
        { url = "https://litterbox.catbox.moe/"; inherit name; }
        { url = "https://ps4pkg.com/"; inherit name; }
        { url = "https://itch.io/games/free/platform-windows"; inherit name; }
        { url = "https://www.apkmirror.com/?post_type=app_release&searchtype=apk&s=apkmirror+installer&minapi-max=30&arch%5B%5D=universal&arch%5B%5D=x86&arch%5B%5D=x86_64&bundles%5B%5D=apk_files"; inherit name; }
        { url = "https://switchrom.io/"; inherit name; }
        { url = "https://switchrom.net/"; inherit name; }
        { url = "https://dlpsgame.com/category/ps4/"; inherit name; }
        { url = "https://posemy.art/app/"; inherit name; }
      ];}];

      # chrome CSS
      userChrome = ''
        #navigator-toolbox::after { border-bottom: 0px !important; }
        #nav-bar { box-shadow: none !important; border-top: none !important; }
        #navigator-toolbox { background-color: #1c1c1b !important; }
        #urlbar-background { background: #313438 !important; }
        :root { --toolbar-bgcolor: #1c1c1b !important; }
        :root { --toolbar-color: #EBF5FE !important; }
      '';

      # content CSS
      userContent = ''
        @-moz-document url-prefix("about:home"), url-prefix("about:newtab") {
          :root {
            --newtab-background-color: #1c1c1b !important;
          }
        }
      '';

      # prefs.js
      settings = {
        "browser.startup.homepage" = "about:home";
        "browser.search.isUS" = false;
        "intl.locale.matchOS" = true;
        "browser.search.region" = "JP";
        "distribution.searchplugins.defaultLocale" = "jp-JP";
        "general.useragent.locale" = "jp-JP";
        "intl.accept_languages" = "jp-JP, jp";
      };

      # user.js
      extraConfig = ''
        user_pref("content.notify.interval", 100000);
        user_pref("gfx.canvas.accelerated.cache-items", 4096);
        user_pref("gfx.canvas.accelerated.cache-size", 512);
        user_pref("gfx.content.skia-font-cache-size", 20);
        user_pref("browser.cache.jsbc_compression_level", 3);
        user_pref("media.memory_cache_max_size", 65536);
        user_pref("media.cache_readahead_limit", 7200);
        user_pref("media.cache_resume_threshold", 3600);
        user_pref("image.mem.decode_bytes_at_a_time", 32768);
        user_pref("network.http.max-connections", 1800);
        user_pref("network.http.max-persistent-connections-per-server", 10);
        user_pref("network.http.max-urgent-start-excessive-connections-per-host", 5);
        user_pref("network.http.pacing.requests.enabled", false);
        user_pref("network.dnsCacheExpiration", 3600);
        user_pref("network.ssl_tokens_cache_capacity", 10240);
        user_pref("network.dns.disablePrefetch", true);
        user_pref("network.dns.disablePrefetchFromHTTPS", true);
        user_pref("network.prefetch-next", false);
        user_pref("network.predictor.enabled", false);
        user_pref("network.predictor.enable-prefetch", false);
        user_pref("layout.css.grid-template-masonry-value.enabled", true);
        user_pref("dom.enable_web_task_scheduling", true);
        user_pref("dom.security.sanitizer.enabled", true);
        user_pref("browser.contentblocking.category", "strict");
        user_pref("urlclassifier.trackingSkipURLs", "*.reddit.com, *.twitter.com, *.twimg.com, *.tiktok.com");
        user_pref("urlclassifier.features.socialtracking.skipURLs", "*.instagram.com, *.twitter.com, *.twimg.com");
        user_pref("network.cookie.sameSite.noneRequiresSecure", true);
        user_pref("browser.download.start_downloads_in_tmp_dir", true);
        user_pref("browser.helperApps.deleteTempFileOnExit", true);
        user_pref("browser.uitour.enabled", false);
        user_pref("privacy.globalprivacycontrol.enabled", true);
        user_pref("security.OCSP.enabled", 0);
        user_pref("security.remote_settings.crlite_filters.enabled", true);
        user_pref("security.pki.crlite_mode", 2);
        user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
        user_pref("browser.xul.error_pages.expert_bad_cert", true);
        user_pref("security.tls.enable_0rtt_data", false);
        user_pref("browser.privatebrowsing.forceMediaMemoryCache", true);
        user_pref("browser.sessionstore.interval", 60000);
        user_pref("privacy.history.custom", true);
        user_pref("browser.urlbar.trimHttps", true);
        user_pref("browser.search.separatePrivateDefault.ui.enabled", true);
        user_pref("browser.urlbar.update2.engineAliasRefresh", true);
        user_pref("browser.search.suggest.enabled", false);
        user_pref("browser.urlbar.quicksuggest.enabled", false);
        user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false);
        user_pref("browser.urlbar.suggest.quicksuggest.nonsponsored", false);
        user_pref("browser.urlbar.groupLabels.enabled", false);
        user_pref("browser.formfill.enable", false);
        user_pref("security.insecure_connection_text.enabled", true);
        user_pref("security.insecure_connection_text.pbmode.enabled", true);
        user_pref("network.IDN_show_punycode", true);
        user_pref("dom.security.https_first", true);
        user_pref("dom.security.https_first_schemeless", true);
        user_pref("signon.formlessCapture.enabled", true);
        user_pref("signon.privateBrowsingCapture.enabled", true);
        user_pref("network.auth.subresource-http-auth-allow", 1);
        user_pref("editor.truncate_user_pastes", false);
        user_pref("security.mixed_content.block_display_content", true);
        user_pref("pdfjs.enableScripting", false);
        user_pref("extensions.postDownloadThirdPartyPrompt", false);
        user_pref("network.http.referer.XOriginTrimmingPolicy", 2);
        user_pref("privacy.userContext.ui.enabled", true);
        user_pref("media.peerconnection.ice.proxy_only_if_behind_proxy", true);
        user_pref("media.peerconnection.ice.default_address_only", true);
        user_pref("browser.safebrowsing.downloads.remote.enabled", false);
        user_pref("permissions.default.desktop-notification", 2);
        user_pref("permissions.default.geo", 2);
        user_pref("permissions.manager.defaultsUrl", "");
        user_pref("webchannel.allowObject.urlWhitelist", "");
        user_pref("datareporting.policy.dataSubmissionEnabled", false);
        user_pref("datareporting.healthreport.uploadEnabled", false);
        user_pref("toolkit.telemetry.unified", false);
        user_pref("toolkit.telemetry.enabled", false);
        user_pref("toolkit.telemetry.server", "data:,");
        user_pref("toolkit.telemetry.archive.enabled", false);
        user_pref("toolkit.telemetry.newProfilePing.enabled", false);
        user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
        user_pref("toolkit.telemetry.updatePing.enabled", false);
        user_pref("toolkit.telemetry.bhrPing.enabled", false);
        user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
        user_pref("toolkit.telemetry.coverage.opt-out", true);
        user_pref("toolkit.coverage.opt-out", true);
        user_pref("toolkit.coverage.endpoint.base", "");
        user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
        user_pref("browser.newtabpage.activity-stream.telemetry", false);
        user_pref("app.shield.optoutstudies.enabled", false);
        user_pref("app.normandy.enabled", false);
        user_pref("app.normandy.api_url", "");
        user_pref("breakpad.reportURL", "");
        user_pref("browser.tabs.crashReporting.sendReport", false);
        user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);
        user_pref("captivedetect.canonicalURL", "");
        user_pref("network.captive-portal-service.enabled", false);
        user_pref("network.connectivity-service.enabled", false);
        user_pref("dom.private-attribution.submission.enabled", false);
        user_pref("browser.privatebrowsing.vpnpromourl", "");
        user_pref("extensions.getAddons.showPane", false);
        user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
        user_pref("browser.discovery.enabled", false);
        user_pref("browser.shell.checkDefaultBrowser", false);
        user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
        user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);
        user_pref("browser.preferences.moreFromMozilla", false);
        user_pref("browser.tabs.tabmanager.enabled", false);
        user_pref("browser.aboutConfig.showWarning", false);
        user_pref("browser.aboutwelcome.enabled", false);
        user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
        user_pref("browser.compactmode.show", true);
        user_pref("browser.display.focus_ring_on_anything", true);
        user_pref("browser.display.focus_ring_style", 0);
        user_pref("browser.display.focus_ring_width", 0);
        user_pref("layout.css.prefers-color-scheme.content-override", 0);
        user_pref("browser.privateWindowSeparation.enabled", false); // WINDOWS
        user_pref("cookiebanners.service.mode", 1);
        user_pref("cookiebanners.service.mode.privateBrowsing", 1);
        user_pref("full-screen-api.transition-duration.enter", "0 0");
        user_pref("full-screen-api.transition-duration.leave", "0 0");
        user_pref("full-screen-api.warning.delay", -1);
        user_pref("full-screen-api.warning.timeout", 0);
        user_pref("browser.urlbar.suggest.calculator", true);
        user_pref("browser.urlbar.unitConversion.enabled", true);
        user_pref("browser.urlbar.trending.featureGate", false);
        user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
        user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
        user_pref("extensions.pocket.enabled", false);
        user_pref("browser.download.always_ask_before_handling_new_types", true);
        user_pref("browser.download.manager.addToRecentDocs", false);
        user_pref("browser.download.open_pdf_attachments_inline", true);
        user_pref("browser.bookmarks.openInTabClosesMenu", false);
        user_pref("browser.menu.showViewImageInfo", true);
        user_pref("findbar.highlightAll", true);
        user_pref("layout.word_select.eat_space_to_next_word", false);
        user_pref("privacy.sanitize.sanitizeOnShutdown", true);
        user_pref("places.history.enabled", false);
        user_pref("browser.urlbar.suggest.history", false);
        user_pref("browser.urlbar.suggest.bookmark", true);
        user_pref("browser.urlbar.suggest.openpage", false);
        user_pref("browser.urlbar.suggest.topsites", false); // [FF78+]
        user_pref("browser.download.useDownloadDir", false);
      '';
    };
  };
}
