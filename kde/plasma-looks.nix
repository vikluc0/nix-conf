{ config, pkgs, ...}:

{
  programs.plasma = {
    workspace = {
      wallpaper = /etc/nixos/wallpapers/blackhole.png;
      lookAndFeel = "org.kde.breezedark.desktop";
      cursor = {
        theme = "Breeze-Dark";
	size = 24;
      };
    };
    configFile = {
      
      kscreenlockerrc = { 
        "Greeter/Wallpaper/org.kde.image/General" = { 
         Image = "file:///etc/nixos/wallpapers/cat.png";
          PreviewImage = "file:///etc/nixos/wallpapers/cat.png";
        };
      };
  
      ksplashrc.KSplash = {
        Theme = "NixOS-Splash-Plasma6";
      };
  
##      plasmarc.Wallpapers.usersWallpapers = "/home/vikluc0/Pictures/Wallpapers/rocket-schematics.png";
      
      baloofilerc.General.dbVersion = 2;
      dolphinrc = {
        General.ViewPropsTimestamp = "2026,9,29,22,16,45.57";
        "KFileDialog Settings"."Places Icons Auto-resize" = false;
        "KFileDialog Settings"."Places Icons Static Size" = 22;
        "Notification Messages".warnAboutRisksBeforeActingAsAdmin = false;
      };
  
      kactivitymanagerdrc.activities."09216fc8-ee8b-48aa-82c6-f4a7bb01d474" = "Default";
  
      katerc = {
        General = {
          "Days Meta Infos" = 30;
          PinnedDocuments = "";
          "Save Meta Infos" = true;
          "Show Full Path in Title" = false;
          "Show Menu Bar" = true;
          "Show Status Bar" = true;
          "Show Tab Bar" = true;
          "Show Url Nav Bar" = true;
        };
  
        filetree = {
          editShade = "125,4,4";
          listMode = false;
          middleClickToClose = false;
          shadingEnabled = true;
          showCloseButton = false;
          showFullPathOnRoots = false;
          showToolbar = true;
          sortRole = 0;
          viewShade = "77,46,91";
        };
      };
  
      kded5rc = {
        Module-browserintegrationreminder.autoload = false;
        Module-device_automounter.autoload = false;
      };
  
      kdeglobals = { 
        General = {
         AccentColor = "255,0,0";
          LastUsedCustomAccentColor = "255,0,0";
        };
  
        KDE = {
         AnimationDurationFactor = 2.82842712474619;
          contrast = 4;
          frameContrast = 0.2;
        };
  
        "KFileDialog Settings" = {
         "Allow Expansion" = false;
          "Automatically select filename extension" = true;
          "Breadcrumb Navigation" = true;
          "Decoration position" = 2;
          "Show Full Path" = false;
          "Show Inline Previews" = true;
          "Show Preview" = false;
          "Show Speedbar" = true;
          "Show hidden files" = false;
          "Sort by" = "Name";
          "Sort directories first" = true;
          "Sort hidden files last" = false;
          "Sort reversed" = false;
          "Speedbar Width" = 140;
          "View Style" = "DetailTree";
        };
  
        WM = { 
         activeBackground = "39,44,49";
          activeBlend = "252,252,252";
          activeForeground = "252,252,252";
          inactiveBackground = "32,36,40";
          inactiveBlend = "161,169,177";
          inactiveForeground = "161,169,177";
        };
      };
  
      kiorc.Confirmations.ConfirmDelete = true;
  
      krunnerrc.General.FreeFloating = true;
  
      kwalletrc.Wallet."First Use" = false;
  
      plasma-localerc.Formats.LANG = "en_US.UTF-8";

      plasmaparc.General.RaiseMaximumVolume = true;

      plasmanotifyrc = {
        "Applications/firefox".Seen = true;
        "Applications/motrix".Seen = true;
        "Applications/waydroid.com.android.vending".Seen = true;
      };
  
              
      spectaclerc = {
        ImageSave = {
         lastImageSaveLocation = "file:///home/vikluc0/Pictures/Screenshots/Screenshot_20261011_143430.png";
          translatedScreenshotsFolder = "Screenshots";
        };
  
        VideoSave = {
         translatedScreencastsFolder = "Screencasts";
        };
      };
    };
  };
}
