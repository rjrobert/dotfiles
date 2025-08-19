{ config, pkgs, ... }:
{
  imports = [];

  networking.hostName = "blackbox-test";
  time.timeZone = "America/Los_Angeles";

  services.openssh.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    nvidiaPersistenced = true;
  };


  services.plex = {
    enable = true;
    openFirewall = true;
  };

  fileSystems."/truenas" = {
    device = "192.168.1.201:/mnt/tank";
    fstype = "nfs";
    options = ["x-systemd.automount" "noauto" "_netdev" "nofail" ];
  };

  environment.systemPackages = with pkgs; [
    fish
    neovim
    git
    wget
    curl
    btop
    fastfetch
    tmux
    lsd
    jujutsu
    tmux
    fzf
    zoxide
    starship
    lazygit
    ripgrep
    go
    golangci-lint
    golangci-lint-langserver
    rustup
    poppler
    fd
    jq
    resvg
    imagemagick
    nodejs_24
    unzip
    sqlfluff
  ];

  users.users.robert = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" ];
    shell = pkgs.fish;
  };

  security.sudo.enable = true;

  system.stateVersion = "24.05";
}

