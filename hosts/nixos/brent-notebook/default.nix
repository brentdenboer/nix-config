_:
{
  imports = [
    ./hardware-configuration.nix

    ../../common/core
    ../../common/users/brentdb.nix

    ../../common/optional/audio.nix
    ../../common/optional/bluetooth.nix
    ../../common/optional/niri.nix
    ../../common/optional/greetd.nix
    ../../common/optional/printing.nix
    ../../common/optional/power.nix
    ../../common/optional/openssh.nix
  ];

  networking = {
    hostName = "brent-notebook";
    networkmanager.enable = true;
    firewall.enable = true;
  };

  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    efi.canTouchEfiVariables = true;
  };

  services.fwupd.enable = true;

  systemd.network.wait-online.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;

  system.stateVersion = "25.05";
}
