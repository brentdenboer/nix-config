{ config, lib, pkgs, ... }:
{
  users.users.brentdb = {
    isNormalUser = true;
    description = "Brent den Boer";
    shell = pkgs.fish;
    extraGroups = lib.flatten [
      "wheel"
      (lib.filter (group: lib.hasAttr group config.users.groups) [
        "audio"
        "video"
        "networkmanager"
        "scanner"
        "lp"
      ])
    ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILvwLeuLq57Gp0JpgNG7j6dcejFjyNWhYhi0mp/mP52g brentdb@brent-desktop"
    ];

    # Keep password material out of the Nix store/repo.
    # Create this file with a single line produced by:
    #   mkpasswd -m sha-512
    hashedPasswordFile = "/etc/nixos/secrets/brentdb-password-hash";
  };
}
