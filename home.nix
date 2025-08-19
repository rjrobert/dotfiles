{ config, pkgs, lib, ... }:

{
  home.stateVersion = "24.05"; # Use the latest stable version of home-manager
  home.username = "robert";
  home.homeDirectory = "/home/robert";

  # Base packages
  home.packages = lib.unique (with pkgs; [
    (ffmpeg.override {
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
    delta = {
      enable = true;
      options = {
        hyperlinks = true;
        features = "decorations interactive";

        interactive = {
          keep-plus-minus-markers = false;
        };
      };
    };

  };

  # programs.fish.enable = true;
  programs.neovim.enable = true;

  imports = [
    ./modules/yazi.nix
  ];

  home.activation.seedLazyVim = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -f "$HOME/.local/share/nvim/lazyvim.json" ]; then
      mkdir -p "$HOME/.local/share/nvim"
      cp ${./config/nvim/lazyvim.json} "$HOME/.local/share/nvim/lazyvim.json"
      chmod 644 "$HOME/.local/share/nvim/lazyvim.json"
    fi
  '';
}
