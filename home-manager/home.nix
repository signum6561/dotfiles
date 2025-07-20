{ config, pkgs, ... }:
let
  ompTheme = "powerhousev4.omp.toml";
  dotfiles = "${config.home.homeDirectory}/dotfiles";
  dotConfigs = "${dotfiles}/config";
in
{
  home.username = "dsynclair";
  home.homeDirectory = "/home/dsynclair";
  home.stateVersion = "25.05"; # Please read the comment before changing.
  home.packages = with pkgs; [
    glibcLocales
    fzf
    fastfetch
  ];

  programs.git = {
    enable = true;
    userName = "signum6561";
    userEmail = "quiocdat777@gmail.com";

    extraConfig.core = {
      editor = "hx";
    };
  };

  home.shellAliases = {
    reload-home = "home-manager switch --flake ${dotfiles}/home-manager --impure";
    home-sh = "cd ~/dotfiles/home-manager";
    dot-sh = "cd ~/dotfiles";
    conf-sh = "cd ~/dotfiles/config";
  };

  home.file = {
    ".config/oh-my-posh/theme.omp.toml".source = "${dotConfigs}/oh-my-posh/${ompTheme}";
  };

  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    COLORTERM = "truecolor";
    LOCALE_ARCHIVE = "${pkgs.glibcLocales}/lib/locale/locale-archive";
  };

  imports = [
    ./modules/programs/zsh.nix
    ./modules/programs/helix.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
