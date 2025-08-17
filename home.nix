{ config, pkgs, ... }:

{
  home.username = "robert";
  home.homeDirectory = "/home/robert";

  # Base packages
  home.packages = with pkgs; [
    btop
    git
    neovim
    fish
    lsd
    jujutsu
    fish
    tmux

    (pkgs.ffmpeg.override {
      withNvenc = true;
    })
  ];

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
