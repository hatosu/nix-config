{
  pkgs,
  inputs,
  strings,
  ...
}:
let

  # choose display method (wayland or xorg)
  protocol = "wayland";

  # choose icon
  icon = pkgs.fetchurl {
    url = "https://files.catbox.moe/ww0qwu.png";
    sha256 = "134mvkc0vl1aifgv52c7gdgsblfdcxiaq88b7rylkqfrcgz37bhy";
  };

  # choose theme
  theme = pkgs.fetchurl {
    url = "https://files.catbox.moe/t0fr4g.css";
    sha256 = "0h2y47gk039zk6wgvkisaixihlx1qy3gcz5arixvdppmy59g3g26";
  };

  # customize config
  vesktop-config = pkgs.writeText "settings.json" ''
    {
        "autoUpdate": true,
        "autoUpdateNotification": true,
        "useQuickCss": true,
        "themeLinks": [],
        "enabledThemes": [
            "theme.css"
        ],
        "enableReactDevtools": false,
        "frameless": false,
        "transparent": false,
        "winCtrlQ": false,
        "disableMinSize": false,
        "winNativeTitleBar": false,
        "plugins": {
            "ChatInputButtonAPI": {
                "enabled": true
            },
            "CommandsAPI": {
                "enabled": true
            },
            "DynamicImageModalAPI": {
                "enabled": true
            },
            "MemberListDecoratorsAPI": {
                "enabled": true
            },
            "MessageAccessoriesAPI": {
                "enabled": true
            },
            "MessageDecorationsAPI": {
                "enabled": true
            },
            "MessageEventsAPI": {
                "enabled": true
            },
            "MessagePopoverAPI": {
                "enabled": true
            },
            "MessageUpdaterAPI": {
                "enabled": true
            },
            "ServerListAPI": {
                "enabled": true
            },
            "UserSettingsAPI": {
                "enabled": true
            },
            "AccountPanelServerProfile": {
                "enabled": false
            },
            "AlwaysAnimate": {
                "enabled": true
            },
            "AlwaysExpandRoles": {
                "enabled": false
            },
            "AlwaysTrust": {
                "enabled": true,
                "domain": true,
                "file": true
            },
            "AnonymiseFileNames": {
                "enabled": true,
                "anonymiseByDefault": true,
                "method": 0,
                "randomisedLength": 50,
                "consistent": "image"
            },
            "AppleMusicRichPresence": {
                "enabled": false
            },
            "WebRichPresence (arRPC)": {
                "enabled": false
            },
            "BANger": {
                "enabled": false
            },
            "BetterFolders": {
                "enabled": false
            },
            "BetterGifAltText": {
                "enabled": false
            },
            "BetterGifPicker": {
                "enabled": false
            },
            "BetterNotesBox": {
                "enabled": false
            },
            "BetterRoleContext": {
                "enabled": true
            },
            "BetterRoleDot": {
                "enabled": true,
                "bothStyles": false,
                "copyRoleColorInProfilePopout": false
            },
            "BetterSessions": {
                "enabled": true,
                "backgroundCheck": true,
                "checkInterval": 20
            },
            "BetterSettings": {
                "enabled": true,
                "disableFade": true,
                "eagerLoad": true
            },
            "BetterUploadButton": {
                "enabled": false
            },
            "BiggerStreamPreview": {
                "enabled": true
            },
            "BlurNSFW": {
                "enabled": false
            },
            "CallTimer": {
                "enabled": true,
                "format": "stopwatch"
            },
            "ClearURLs": {
                "enabled": true
            },
            "ClientTheme": {
                "enabled": false
            },
            "ColorSighted": {
                "enabled": false
            },
            "ConsoleJanitor": {
                "enabled": false
            },
            "ConsoleShortcuts": {
                "enabled": false
            },
            "CopyEmojiMarkdown": {
                "enabled": false
            },
            "CopyFileContents": {
                "enabled": true
            },
            "CopyUserURLs": {
                "enabled": false
            },
            "CrashHandler": {
                "enabled": true
            },
            "CtrlEnterSend": {
                "enabled": false
            },
            "CustomRPC": {
                "enabled": true,
                "type": 0,
                "timestampMode": 0
            },
            "CustomIdle": {
                "enabled": false,
                "idleTimeout": 10,
                "remainInIdle": true
            },
            "Dearrow": {
                "enabled": false
            },
            "Decor": {
                "enabled": false
            },
            "DisableCallIdle": {
                "enabled": false
            },
            "DontRoundMyTimestamps": {
                "enabled": true
            },
            "EmoteCloner": {
                "enabled": true
            },
            "Experiments": {
                "enabled": false
            },
            "F8Break": {
                "enabled": false
            },
            "FakeNitro": {
                "enabled": false
            },
            "FakeProfileThemes": {
                "enabled": false
            },
            "FavoriteEmojiFirst": {
                "enabled": true
            },
            "FavoriteGifSearch": {
                "enabled": true,
                "searchOption": "hostandpath"
            },
            "FixCodeblockGap": {
                "enabled": false
            },
            "FixImagesQuality": {
                "enabled": true
            },
            "FixSpotifyEmbeds": {
                "enabled": false
            },
            "FixYoutubeEmbeds": {
                "enabled": true
            },
            "ForceOwnerCrown": {
                "enabled": false
            },
            "FriendInvites": {
                "enabled": false
            },
            "FriendsSince": {
                "enabled": true
            },
            "FullSearchContext": {
                "enabled": true
            },
            "GameActivityToggle": {
                "enabled": true,
                "oldIcon": false
            },
            "GifPaste": {
                "enabled": false
            },
            "GreetStickerPicker": {
                "enabled": false
            },
            "HideAttachments": {
                "enabled": true
            },
            "iLoveSpam": {
                "enabled": true
            },
            "IgnoreActivities": {
                "enabled": false
            },
            "ImageLink": {
                "enabled": false
            },
            "ImageZoom": {
                "enabled": true
            },
            "ImplicitRelationships": {
                "enabled": true,
                "sortByAffinity": true
            },
            "InvisibleChat": {
                "enabled": false,
                "savedPasswords": "password, Password"
            },
            "KeepCurrentChannel": {
                "enabled": true
            },
            "LastFMRichPresence": {
                "enabled": false
            },
            "LoadingQuotes": {
                "enabled": true,
                "replaceEvents": true,
                "enableDiscordPresetQuotes": false,
                "additionalQuotes": "",
                "additionalQuotesDelimiter": "|",
                "enablePluginPresetQuotes": true
            },
            "MemberCount": {
                "enabled": true,
                "memberList": true,
                "toolTip": true
            },
            "MentionAvatars": {
                "enabled": true
            },
            "MessageClickActions": {
                "enabled": false
            },
            "MessageLatency": {
                "enabled": true,
                "latency": 2,
                "detectDiscordKotlin": true,
                "showMillis": false
            },
            "MessageLinkEmbeds": {
                "enabled": true,
                "automodEmbeds": "never",
                "listMode": "blacklist",
                "idList": ""
            },
            "MessageLogger": {
                "enabled": true,
                "collapseDeleted": false,
                "deleteStyle": "text",
                "ignoreBots": false,
                "ignoreSelf": true,
                "ignoreUsers": "",
                "ignoreChannels": "",
                "ignoreGuilds": "",
                "logEdits": true,
                "logDeletes": true,
                "inlineEdits": true
            },
            "MessageTags": {
                "enabled": false
            },
            "MoreCommands": {
                "enabled": true
            },
            "MoreKaomoji": {
                "enabled": true
            },
            "MoreUserTags": {
                "enabled": false
            },
            "Moyai": {
                "enabled": false
            },
            "MutualGroupDMs": {
                "enabled": true
            },
            "NewGuildSettings": {
                "enabled": false
            },
            "NoBlockedMessages": {
                "enabled": false
            },
            "NoDevtoolsWarning": {
                "enabled": false
            },
            "NoF1": {
                "enabled": false
            },
            "NoMaskedUrlPaste": {
                "enabled": false
            },
            "NoMosaic": {
                "enabled": false
            },
            "NoOnboardingDelay": {
                "enabled": false
            },
            "NoPendingCount": {
                "enabled": false
            },
            "NoProfileThemes": {
                "enabled": false
            },
            "NoReplyMention": {
                "enabled": false
            },
            "NoScreensharePreview": {
                "enabled": true
            },
            "NoServerEmojis": {
                "enabled": false
            },
            "NoTypingAnimation": {
                "enabled": false
            },
            "NoUnblockToJump": {
                "enabled": false
            },
            "NormalizeMessageLinks": {
                "enabled": true
            },
            "NotificationVolume": {
                "enabled": false,
                "notificationVolume": 100
            },
            "NSFWGateBypass": {
                "enabled": false
            },
            "OnePingPerDM": {
                "enabled": false
            },
            "oneko": {
                "enabled": false
            },
            "OpenInApp": {
                "enabled": false
            },
            "OverrideForumDefaults": {
                "enabled": false
            },
            "PartyMode": {
                "enabled": false,
                "superIntensePartyMode": 0
            },
            "PauseInvitesForever": {
                "enabled": false
            },
            "PermissionFreeWill": {
                "enabled": false
            },
            "PermissionsViewer": {
                "enabled": true,
                "permissionsSortOrder": 0
            },
            "petpet": {
                "enabled": true
            },
            "PictureInPicture": {
                "enabled": false
            },
            "PinDMs": {
                "enabled": true,
                "dmSectioncollapsed": false
            },
            "PlainFolderIcon": {
                "enabled": false
            },
            "PlatformIndicators": {
                "enabled": true,
                "colorMobileIndicator": true,
                "list": true,
                "badges": true,
                "messages": true
            },
            "PreviewMessage": {
                "enabled": false
            },
            "QuickMention": {
                "enabled": false
            },
            "QuickReply": {
                "enabled": false
            },
            "ReactErrorDecoder": {
                "enabled": false
            },
            "ReadAllNotificationsButton": {
                "enabled": true
            },
            "RelationshipNotifier": {
                "enabled": true,
                "offlineRemovals": true,
                "groups": true,
                "servers": true,
                "friends": true,
                "friendRequestCancels": true,
                "notices": true
            },
            "ReplaceGoogleSearch": {
                "enabled": false
            },
            "ReplyTimestamp": {
                "enabled": true
            },
            "RevealAllSpoilers": {
                "enabled": false
            },
            "ReverseImageSearch": {
                "enabled": true
            },
            "ReviewDB": {
                "enabled": false
            },
            "RoleColorEverywhere": {
                "enabled": true,
                "chatMentions": true,
                "memberList": true,
                "voiceUsers": true,
                "reactorsList": true,
                "pollResults": true,
                "colorChatMessages": false
            },
            "SecretRingToneEnabler": {
                "enabled": false
            },
            "Summaries": {
                "enabled": true,
                "summaryExpiryThresholdDays": 1
            },
            "SendTimestamps": {
                "enabled": false,
                "replaceMessageContents": true
            },
            "ServerInfo": {
                "enabled": true
            },
            "ServerListIndicators": {
                "enabled": true,
                "mode": 2
            },
            "ShikiCodeblocks": {
                "enabled": false
            },
            "ShowAllMessageButtons": {
                "enabled": true
            },
            "ShowConnections": {
                "enabled": true
            },
            "ShowHiddenChannels": {
                "enabled": true,
                "showMode": 0,
                "hideUnreads": false,
                "defaultAllowedUsersAndRolesDropdownState": true
            },
            "ShowHiddenThings": {
                "enabled": true,
                "showTimeouts": true,
                "showInvitesPaused": true,
                "showModView": true,
                "disableDiscoveryFilters": true,
                "disableDisallowedDiscoveryFilters": true
            },
            "ShowMeYourName": {
                "enabled": true,
                "displayNames": false,
                "inReplies": false,
                "mode": "nick-user"
            },
            "ShowTimeoutDuration": {
                "enabled": true
            },
            "SilentMessageToggle": {
                "enabled": false
            },
            "SilentTyping": {
                "enabled": true,
                "isEnabled": true,
                "showIcon": true,
                "contextMenu": true
            },
            "SortFriendRequests": {
                "enabled": true,
                "showDates": false
            },
            "SpotifyControls": {
                "enabled": true,
                "hoverControls": false
            },
            "SpotifyCrack": {
                "enabled": false
            },
            "SpotifyShareCommands": {
                "enabled": true
            },
            "StartupTimings": {
                "enabled": false
            },
            "StickerPaste": {
                "enabled": false
            },
            "StreamerModeOnStream": {
                "enabled": false
            },
            "SuperReactionTweaks": {
                "enabled": false
            },
            "TextReplace": {
                "enabled": false
            },
            "ThemeAttributes": {
                "enabled": false
            },
            "Translate": {
                "enabled": true,
                "autoTranslate": false,
                "showChatBarButton": true
            },
            "TypingIndicator": {
                "enabled": true,
                "includeMutedChannels": false,
                "includeCurrentChannel": true,
                "indicatorMode": 3
            },
            "TypingTweaks": {
                "enabled": true,
                "alternativeFormatting": true
            },
            "Unindent": {
                "enabled": false
            },
            "UnlockedAvatarZoom": {
                "enabled": true
            },
            "UnsuppressEmbeds": {
                "enabled": false
            },
            "UserMessagesPronouns": {
                "enabled": false
            },
            "UserVoiceShow": {
                "enabled": true,
                "showInUserProfileModal": true,
                "showInMemberList": true,
                "showInMessages": true
            },
            "USRBG": {
                "enabled": false
            },
            "ValidReply": {
                "enabled": true
            },
            "ValidUser": {
                "enabled": false
            },
            "VoiceChatDoubleClick": {
                "enabled": false
            },
            "VcNarrator": {
                "enabled": false
            },
            "VencordToolbox": {
                "enabled": true
            },
            "ViewIcons": {
                "enabled": true
            },
            "ViewRaw": {
                "enabled": true,
                "clickMethod": "Left"
            },
            "VoiceDownload": {
                "enabled": true
            },
            "VoiceMessages": {
                "enabled": true,
                "noiseSuppression": true,
                "echoCancellation": true
            },
            "VolumeBooster": {
                "enabled": true
            },
            "WebKeybinds": {
                "enabled": true
            },
            "WebScreenShareFixes": {
                "enabled": true
            },
            "WhoReacted": {
                "enabled": true
            },
            "XSOverlay": {
                "enabled": false
            },
            "YoutubeAdblock": {
                "enabled": true
            },
            "NoTrack": {
                "enabled": true,
                "disableAnalytics": true
            },
            "WebContextMenus": {
                "enabled": true,
                "addBack": true
            },
            "Settings": {
                "enabled": true,
                "settingsLocation": "aboveNitro"
            },
            "SupportHelper": {
                "enabled": true
            }
        },
        "notifications": {
            "timeout": 5000,
            "position": "bottom-right",
            "useNative": "not-focused",
            "logLimit": 50
        },
        "cloud": {
            "authenticated": false,
            "url": "https://api.vencord.dev/",
            "settingsSync": false,
            "settingsSyncVersion": 1732809350480
        }
    }
  '';

  # ignore everything below
  vesktopcss = builtins.readFile theme;
in
{
  home-manager.users.hatosu.home.file = {
    "vesktop-config" = {
      source = vesktop-config;
      target = ".config/vesktop/settings/settings.json";
      force = true;
    };
  };
  home-manager.users.hatosu.home.file = {
    "vesktop-theme" = {
      source = builtins.toFile "theme.css" "${vesktopcss}";
      target = ".config/vesktop/themes/theme.css";
      force = true;
    };
  };
  home-manager.users.hatosu.home.packages = with pkgs; [ vesktop ];
  home-manager.users.hatosu.xdg.desktopEntries = {
    vesktop = {
      exec = "vesktop --enable-features=UseOzonePlatform --ozone-platform=${protocol} --enable-wayland-ime %U";
      icon = "${icon}";
      name = "Discord";
      genericName = "Internet Messenger";
      comment = "some random discord client...";
      noDisplay = false;
      prefersNonDefaultGPU = false;
      startupNotify = true;
      terminal = false;
      settings = {
        Keywords = "discord;vencord;electron;chat";
        DBusActivatable = "false";
      };
      categories = [
        "Network"
        "InstantMessaging"
        "Chat"
      ];
      mimeType = [
        ""
        ""
        ""
      ];
      type = "Application";
    };
  };
}
