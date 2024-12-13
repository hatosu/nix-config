{ pkgs, ... }: let

  icon = pkgs.fetchurl {
    url = "https://files.catbox.moe/ww0qwu.png";
    sha256 = "134mvkc0vl1aifgv52c7gdgsblfdcxiaq88b7rylkqfrcgz37bhy";
  };

  theme = pkgs.fetchurl {
    url = "https://files.catbox.moe/t0fr4g.css";
    sha256 = "0h2y47gk039zk6wgvkisaixihlx1qy3gcz5arixvdppmy59g3g26";
  };

in { home-manager.users.hatosu = { 

  programs.nixcord = {

    enable = true;

    discord.enable = false;

    vesktop = {
      enable = true;
      package = pkgs.vesktop.overrideAttrs (old: {
        postInstall = ''
          for n in 32 64 128 256 512 1024; do
            size=$n"x"$n
            ${pkgs.imagemagick}/bin/magick ${icon}\[2\] -resize $size $out/share/icons/hicolor/$size/apps/vesktop.png
          done;
        '';
      });
    };

    config = {

      disableMinSize = true;
      transparent = true;
      frameless = true;
      enableReactDevtools = false;
      enabledThemes = [ "theme.css" ];
  
       plugins = {

        silentTyping = {
          enable = true;
          showIcon = true;
          contextMenu = true;
          isEnabled = true;
        };

        summaries = {
          enable = true;
          summaryExpiryThresholdDays = 30;
        };

        anonymiseFileNames = {
          enable = true;
          anonymiseByDefault = true;
          method = "randomCharacters";
          randomisedLength = 10;
        };

        messageLogger = {
          enable = true;
          logDeletes = true;
          collapseDeleted = false;
          logEdits = true;
          inlineEdits = true;
          ignoreSelf = true;
          deleteStyle = "text";
        };

        voiceMessages = {
          enable = true;
          noiseSuppression = true;
          echoCancellation = true;
        };

        viewRaw = {
          enable = true;
          clickMethod = "Left";
        };

        viewIcons = {
          enable = true;
          format = "png";
          imgSize = 1024;
        };

        userVoiceShow = {
          enable = true;
          showInUserProfileModal = true;
          showInMemberList = true;
          showInMessages = true;
        };

        typingTweaks = {
          enable = true;
          showAvatars = true;
          showRoleColors = true;
          alternativeFormatting = true;
        };

        typingIndicator = {
          enable = true;
          indicatorMode = "both";
          includeCurrentChannel = true;
          includeMutedChannels = true;
          includeBlockedUsers = true;
        };

        silentMessageToggle = {
          enable = true;
          autoDisable = true;
        };

        showMeYourName = {
          enable = true;
          mode = "nick-user";
        };

        relationshipNotifier = {
          enable = true;
          notices = true;
          offlineRemovals = true;
          friends = true;
          friendRequestCancels = true;
          servers = true;
          groups = true;
        };

        messageLatency = {
          enable = true;
          latency = 0;
          showMillis = true;
          detectDiscordKotlin = true;
        };

        memberCount = {
          toolTip = true;
          memberList = true;
        };

        implicitRelationships = {
          enable = true;
          sortByAffinity = true;
        };

        dearrow = {
          enable = true;
          replaceElements = "everything";
          dearrowByDefault = false;
          hideButton = false;
        };

        consoleJanitor = {
          enable = true;
          disableLoggers = true;
          disableSpotifyLogger = true;
        };

        betterRoleContext = {
          enable = true;
          roleIconFileFormat = "png";
        };

        banger = {
          enable = true;
          source = "https://files.catbox.moe/xm4y04.gif";
        };

        translate = {
          enable = true;
          showChatBarButton = true;
          autoTranslate = false;
        };

        alwaysAnimate.enable = true;

        alwaysTrust.enable = true;

        biggerStreamPreview.enable = true;

        clearURLs.enable = true;

        betterSessions.enable = true;
        
        copyFileContents.enable = true;
        
        copyUserURLs.enable = true;
        
        disableCallIdle.enable = true;

        dontRoundMyTimestamps.enable = true;

        emoteCloner.enable = true;

        favoriteEmojiFirst.enable = true;

        favoriteGifSearch.enable = true;

        fixImagesQuality.enable = true;

        fixYoutubeEmbeds.enable = true;

        friendsSince.enable = true;

        fullSearchContext.enable = true;

        gameActivityToggle.enable = true;

        greetStickerPicker.enable = true;

        hideAttachments.enable = true;

        iLoveSpam.enable = true;

        imageLink.enable = true;

        imageZoom.enable = true;

        keepCurrentChannel.enable = true;

        loadingQuotes.enable = true;

        mentionAvatars.enable = true;

        messageTags.enable = true;

        moreCommands.enable = true;

        moreKaomoji.enable = true;

        normalizeMessageLinks.enable = true;

        permissionsViewer.enable = true;

        petpet.enable = true;

        pinDMs.enable = true;

        platformIndicators.enable = true;

        readAllNotificationsButton.enable = true;

        replyTimestamp.enable = true;

        reverseImageSearch.enable = true;

        roleColorEverywhere.enable = true;

        sendTimestamps.enable = true;

        serverInfo.enable = true;

        showConnections.enable = true;

        showAllMessageButtons.enable = true;

        serverListIndicators.enable = true;

        showHiddenChannels.enable = true;

        showHiddenThings.enable = true;

        showTimeoutDuration.enable = true;

        sortFriendRequests.enable = true;

        spotifyControls.enable = true;

        spotifyShareCommands.enable = true;

        streamerModeOnStream.enable = true;

        unlockedAvatarZoom.enable = true;

        validReply.enable = true;

        validUser.enable = true;

        vencordToolbox.enable = true;

        voiceDownload.enable = true;

        volumeBooster.enable = true;

        whoReacted.enable = true;

        youtubeAdblock.enable = true;

        webScreenShareFixes.enable = true;

        moyai.enable = false; # forever keep this disabled lmao

       };

    };

    userPlugins = {
      betterActivities = "github:D3SOX/vc-betterActivities/044b504666b8b753ab45d82c0cd0d316b1ea7e60";
      messageLoggerEnhanced = "github:Syncxv/vc-message-logger-enhanced/199b24e32503c7d3288c5237ed0786d6ce10c855";
      notifyUserChanges = "github:D3SOX/vc-notifyUserChanges/4b36010991c762581bc941ed0e74b42989f584e7";
      stalker = "github:zastlx/vc-stalker-plugin/3a7df3b4105d626c370056d6177d6b94d748b664";
    };

    extraConfig = {
      plugins = {
        betterActivities.enable = true;
        messageLoggerEnhanced.enable = true;
        notifyUserChanges.enable = true;
        stalker.enable = true;
      };
    };

  };

  home.file.".config/vesktop/themes/theme.css".source = theme;

};}
