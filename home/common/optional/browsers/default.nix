{ config, ... }:
let
  home = config.home.homeDirectory;
in
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "Default";
      isDefault = true;
      settings = {
        "signon.rememberSignons" = false;
        "browser.compactmode.show" = true;
        "browser.uidensity" = 1;
        "browser.aboutConfig.showWarning" = false;
        "browser.download.dir" = "${home}/downloads";
        "ui.systemUsesDarkTheme" = 1;
        "extensions.pocket.enabled" = false;
      };
    };
  };
}
