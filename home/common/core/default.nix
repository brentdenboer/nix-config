{ pkgs, ... }:
{
  home.packages = [
    pkgs.nautilus
  ];

  imports = [
    ./fish.nix
    ./starship.nix
  ];

  home.preferXdgDirectories = true;

  programs.git = {
    enable = true;
    userName = "brentdenboer";
    userEmail = "142184336+brentdenboer@users.noreply.github.com";
  };
  programs.neovim.enable = true;
  programs.home-manager.enable = true;
}
