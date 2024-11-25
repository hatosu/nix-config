{ pkgs, inputs, strings, ... }: let

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
            "FixImagesQuality": {
                "enabled": true
            },
            "CommandsAPI": {
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
            "AlwaysAnimate": {
                "enabled": true
            },
            "AlwaysTrust": {
                "enabled": false
            },
            "AnonymiseFileNames": {
                "enabled": true,
                "anonymiseByDefault": true,
                "method": 0,
                "randomisedLength": 7
            },
            "AppleMusicRichPresence": {
                "enabled": false
            },
            "WebRichPresence (arRPC)": {
                "enabled": false
            },
            "AutomodContext": {
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
                "enabled": false
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
                "enabled": false
            },
            "CustomIdle": {
                "enabled": false
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
                "enabled": false
            },
            "FavoriteGifSearch": {
                "enabled": true,
                "searchOption": "hostandpath"
            },
            "FixCodeblockGap": {
                "enabled": false
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
                "enabled": false
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
                "enabled": true,
                "size": 100,
                "zoom": 2,
                "nearestNeighbour": false,
                "square": false,
                "saveZoomValues": true,
                "zoomSpeed": 0.5
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
            "MaskedLinkPaste": {
                "enabled": false
            },
            "MemberCount": {
                "enabled": true,
                "memberList": true,
                "toolTip": true
            },
            "MentionAvatars": {
                "enabled": true,
                "showAtSymbol": true
            },
            "MessageClickActions": {
                "enabled": false
            },
            "MessageLatency": {
                "enabled": true,
                "latency": 1,
                "detectDiscordKotlin": true,
                "showMillis": true
            },
            "MessageLinkEmbeds": {
                "enabled": false
            },
            "MessageLogger": {
                "enabled": true,
                "deleteStyle": "text",
                "logDeletes": true,
                "collapseDeleted": false,
                "logEdits": true,
                "inlineEdits": true,
                "ignoreBots": false,
                "ignoreSelf": true,
                "ignoreUsers": "",
                "ignoreChannels": "",
                "ignoreGuilds": ""
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
                "enabled": false,
                "volume": 1,
                "quality": "HD",
                "triggerWhenUnfocused": true,
                "ignoreBots": true,
                "ignoreBlocked": true
            },
            "MutualGroupDMs": {
                "enabled": true
            },
            "NewGuildSettings": {
                "enabled": false
            },
            "NoBlockedMessages": {
                "enabled": false,
                "ignoreBlockedMessages": false
            },
            "NoDefaultHangStatus": {
                "enabled": false
            },
            "NoDevtoolsWarning": {
                "enabled": false
            },
            "NoF1": {
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
                "enabled": false,
                "userList": "1234567890123445,1234567890123445",
                "shouldPingListed": true,
                "inverseShiftReply": false
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
                "enabled": false
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
                "enabled": false
            },
            "PauseInvitesForever": {
                "enabled": false
            },
            "PermissionFreeWill": {
                "enabled": false
            },
            "PermissionsViewer": {
                "enabled": true,
                "permissionsSortOrder": 1,
                "defaultPermissionsDropdownState": false
            },
            "petpet": {
                "enabled": true
            },
            "PictureInPicture": {
                "enabled": false
            },
            "PinDMs": {
                "enabled": true,
                "dmSectioncollapsed": false,
                "pinOrder": 0
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
                "notices": true,
                "offlineRemovals": true,
                "friends": true,
                "friendRequestCancels": true,
                "servers": true,
                "groups": true
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
                "enabled": false,
                "notifyReviews": true,
                "showWarning": true,
                "hideBlockedUsers": true,
                "hideTimestamps": false
            },
            "RoleColorEverywhere": {
                "enabled": true,
                "chatMentions": true,
                "memberList": true,
                "voiceUsers": true,
                "reactorsList": true,
                "colorChatMessages": false
            },
            "SecretRingToneEnabler": {
                "enabled": false
            },
            "Summaries": {
                "enabled": false
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
                "enabled": true,
                "iconSpacing": 1,
                "iconSize": 32
            },
            "ShowHiddenChannels": {
                "enabled": true,
                "showMode": 0,
                "hideUnreads": true,
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
                "mode": "nick-user",
                "displayNames": false,
                "inReplies": false
            },
            "ShowTimeoutDuration": {
                "enabled": true,
                "displayStyle": "ssalggnikool"
            },
            "SilentMessageToggle": {
                "enabled": false
            },
            "SilentTyping": {
                "enabled": true,
                "showIcon": true,
                "contextMenu": true,
                "isEnabled": true
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
            "TimeBarAllActivities": {
                "enabled": false
            },
            "Translate": {
                "enabled": true,
                "showChatBarButton": true,
                "service": "google",
                "deeplApiKey": "",
                "autoTranslate": false,
                "showAutoTranslateTooltip": true,
                "receivedInput": "auto",
                "receivedOutput": "en",
                "sentInput": "auto",
                "sentOutput": "en"
            },
            "TypingIndicator": {
                "enabled": true,
                "includeMutedChannels": false,
                "includeCurrentChannel": true,
                "indicatorMode": 3
            },
            "TypingTweaks": {
                "enabled": true,
                "alternativeFormatting": true,
                "showRoleColors": true,
                "showAvatars": true
            },
            "Unindent": {
                "enabled": false
            },
            "UnlockedAvatarZoom": {
                "enabled": true,
                "zoomMultiplier": 4
            },
            "UnsuppressEmbeds": {
                "enabled": false
            },
            "UserVoiceShow": {
                "enabled": true,
                "showInUserProfileModal": true,
                "showVoiceChannelSectionHeader": true,
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
                "enabled": false,
                "volume": 1,
                "rate": 1,
                "sayOwnName": false,
                "latinOnly": false,
                "joinMessage": "{{USER}} joined",
                "leaveMessage": "{{USER}} left",
                "moveMessage": "{{USER}} moved to {{CHANNEL}}",
                "muteMessage": "{{USER}} Muted",
                "unmuteMessage": "{{USER}} unmuted",
                "deafenMessage": "{{USER}} deafened",
                "undeafenMessage": "{{USER}} undeafened"
            },
            "VencordToolbox": {
                "enabled": true
            },
            "ViewIcons": {
                "enabled": true,
                "format": "webp",
                "imgSize": "1024"
            },
            "ViewRaw": {
                "enabled": true,
                "clickMethod": "Left"
            },
            "VoiceDownload": {
                "enabled": true
            },
            "VoiceMessages": {
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
            },
            "YoutubeAdblock": {
                "enabled": true
            },
            "NoMaskedUrlPaste": {
                "enabled": false
            },
            "AlwaysExpandRoles": {
                "enabled": false
            },
            "CopyFileContents": {
                "enabled": false
            },
            "StickerPaste": {
                "enabled": false
            },
            "VolumeBooster": {
                "enabled": true
            },
            "FullSearchContext": {
                "enabled": false
            },
            "UserMessagesPronouns": {
                "enabled": false
            },
            "DynamicImageModalAPI": {
                "enabled": true
            },
            "AccountPanelServerProfile": {
                "enabled": false
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
            "settingsSyncVersion": 1730538609582
        }
    }
  '';

# ignore everything below
vesktopcss = builtins.readFile theme; in {
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
      mimeType = [ "" "" "" ];
      type = "Application";
    };
  };
}
