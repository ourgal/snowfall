args:
args.module (
  args
  // {
    path = ./.;
    progs.floorp = {
      policies = {
        "3rdparty" = { };
        AllowedDomainsForApps = "";
        AllowFileSelectionDialogs = true;
        AppAutoUpdate = false;
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;
        AutoLaunchProtocolsFromOrigins = [
          {
            protocol = "zoommtg";
            allowed_origins = "https://somesite.zoom.us";
          }
        ];
        BackgroundAppUpdate = false;
        BlockAboutAddons = false;
        BlockAboutConfig = false;
        BlockAboutProfiles = false;
        BlockAboutSupport = false;
        Bookmarks = [
          {
            "Title" = "Example";
            "URL" = "https=//example.com";
            "Favicon" = "https=//example.com/favicon.ico";
            "Placement" = "toolbar";
            "Folder" = "test";
          }
        ];
        Containers = {
          Default = [
            {
              "name" = "My container";
              "icon" = "pet";
              "color" = "turquoise";
            }
          ];
        };
        DefaultDownloadDirectory = "\${home}/Downloads";
        DisableAppUpdate = true;
        DisableBuiltinPDFViewer = true;
        DisablePocket = true;
        DisableSetDesktopBackground = true;
        DisableSystemAddonUpdate = true;
        DisplayBookmarksToolbar = "newtab";
        DisableTelemetry = true;
        DisplayMenuBar = "default-off";
        DNSOverHTTPS = {
          Enabled = false;
          Locked = false;
        };
        DontCheckDefaultBrowser = true;
        DownloadDirectory = "\${home}/Downloads";
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
        };
      };
    };
  }
)
