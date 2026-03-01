# Core NixOS configuration - imported by all hosts
{ ... }:
{
  imports = [
    ./nix.nix
    ./locale.nix
  ];

  hardware.enableRedistributableFirmware = true;

  environment.enableAllTerminfo = true;

  programs.fish = {
    enable = true;
  };

  nixpkgs.config.allowUnfree = true;
}
