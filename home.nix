{ config, pkgs, lib, ... }:

{
  home.stateVersion = "24.05"; # Use the latest stable version of home-manager
  home.username = "robert";
  home.homeDirectory = "/home/robert";

  # Base packages
  home.packages = lib.unique (with pkgs; [
    btop
    lsd
    jujutsu
    tmux
    fzf
    zoxide
    starship

    (pkgs.ffmpeg.override {
      withNvenc = true;
    })
  ]);

  home.file.".config/nvim".source = ./config/nvim;
  home.file.".config/fish".source = ./config/fish;
  home.file.".config/tmux".source = ./config/tmux;

  programs.git = {
    enable = true;
    userName = "Robert Ball";
    userEmail = "jhrobert@pm.me";
  };

  programs.fish.enable = true;
  programs.neovim.enable = true;

  programs.home-manager.enable = true;
}
