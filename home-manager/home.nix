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
    asciiquarium-transparent
    eza
  ];

  home.shellAliases = {
    reload-home = "home-manager switch --flake ${dotfiles}/home-manager --impure";
    home-sh = "cd ~/dotfiles/home-manager";
    dot-sh = "cd ~/dotfiles";
    conf-sh = "cd ~/dotfiles/config";
    ls = "eza --icons";
    ll = "ls -l --no-permissions --no-user";
    lt = "ls --tree -L=3 --group-directories-first --git-ignore";
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
    ./modules/programs/git.nix
    ./modules/programs/fastfetch.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
