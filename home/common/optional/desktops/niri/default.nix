{ lib, pkgs, ... }:
{
  home.packages = lib.attrValues {
    inherit (pkgs) wlogout brightnessctl;
  };

  programs.niri.settings = {
    binds = {
      "Mod+Return".action.spawn = [ "ghostty" ];
    };
  };
}
