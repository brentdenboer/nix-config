{ pkgs, ... }:
{
  imports = [
    ./default.nix

    ../common/optional/desktops/niri

    ../common/optional/browsers

    ../common/optional/ghostty.nix

    ../common/optional/noctalia.nix
  ];

  home.packages = [
    pkgs.vscode
  ];
}
