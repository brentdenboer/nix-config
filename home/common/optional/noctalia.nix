{ inputs, pkgs, ... }:
let
  noctalia = cmd: [
    "noctalia-shell" "ipc" "call"
  ] ++ (pkgs.lib.splitString " " cmd);
in
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
  };

  programs.niri.settings = {
    spawn-at-startup = [
      { command = [ "noctalia-shell" ]; }
    ];

    binds = {
      "Mod+Space".action.spawn = noctalia "launcher toggle";
      "Mod+L".action.spawn = noctalia "lockScreen lock";
      "XF86AudioLowerVolume".action.spawn = noctalia "volume decrease";
      "XF86AudioRaiseVolume".action.spawn = noctalia "volume increase";
      "XF86AudioMute".action.spawn = noctalia "volume muteOutput";
    };
  };
}
